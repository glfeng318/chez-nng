;;
;; scheme --script nng-raw.ss tcp://127.0.0.1:5555 -s
;; scheme --script nng-raw.ss tcp://127.0.0.1:5555 3
;;

; (system "cc -D PARALLEL=32 -I /usr/local/include ./c/libnng/raw.c -o ./c/libnng/raw -L /usr/local/lib -lnng")
; (fork-thread (system "./c/libnng/raw tcp://127.0.0.1:5555 -s"))
; (for-each (lambda (i) (fork-thread (lambda () (system "./c/libnng/raw tcp://127.0.0.1:5555 1")))) (iota 10))

(library-directories '(("." . ".") ("lib" . "lib")))
(import (libnng nng))

; Parallel is the maximum number of outstanding requests we can handle.
; This is *NOT* the number of threads in use, but instead represents
; outstanding work items.  Select a small number to reduce memory size.
; (Each one of these can be thought of as a request-reply loop.)
(define parallel 32)

(define INIT 0)
(define RECV 1)
(define WAIT 2)
(define SEND 3)

; The server keeps a list of work items, sorted by expiration time,
; so that we can use this to set the timeout to the correct value for
; use in poll.
(define-ftype work
  (struct
    [state unsigned]
    [aio (* nng_aio)]
    [sock (* nng_socket)]
    [msg (* nng_msg)]
    ))
(define-ftype uint32_t unsigned-32)

(define (fatal who r)
  (unless (= 0 r)
    (error who (string-append (nng-strerror r)))
    (exit 1)
    ))

(define (server-callback w)
  (let* ([when-t (make-ftype-pointer unsigned-32 (foreign-alloc (ftype-sizeof unsigned-32)))]
         ; w is pointer address when server-callback is called directry, otherwise ftype-pointer
         [w (if (ftype-pointer? w) w (make-ftype-pointer work w))]
         [state (ftype-ref work (state) w)])
    (printf "server-callback: w.state.~a\n" state)
    (case state
      [(INIT 0) (ftype-set! work (state) w RECV)
                (nng-recv-aio (ftype-ref work (sock) w) (ftype-ref work (aio) w))
                ]
      [(RECV 1) (fatal 'nng-recv-aio (nng-aio-result (ftype-ref work (aio) w)))
                (let* ([msg (nng-aio-get-msg (ftype-ref work (aio) w))]
                       [r (nng-msg-trim-u32 msg when-t)])
                  (if (= 0 r)
                    (begin
                      (ftype-set! work (msg) w msg)
                      (ftype-set! work (state) w WAIT)
                      (nng-sleep-aio when-t (ftype-ref work (aio) w)))
                    (begin
                      ; bad message, just ignore it.
                      (nng-msg-free msg)
                      (nng-recv-aio (ftype-ref work (sock) w) (ftype-ref work (aio) w))))
                    )]
      [(WAIT 2) (nng-aio-set-msg (ftype-ref work (aio) w) (ftype-ref work (msg) w)) ; We could add more data to the message here.
                (ftype-set! work (msg) w (make-ftype-null nng_msg))
                (ftype-set! work (state) w SEND)
                (nng-send-aio (ftype-ref work (sock) w) (ftype-ref work (aio) w))
                ]
      [(SEND 3) (let ([r (nng-aio-result (ftype-ref work (aio) w))])
                  (unless (= 0 r)
                    (nng-msg-free (ftype-ref work (msg) w))
                    (fatal 'nng-send-aio r)))
                (ftype-set! work (state) w RECV)
                (nng-recv-aio (ftype-ref work (sock) w) (ftype-ref work (aio) w))]
      [else (fatal 'work NNG_ESTATE)] ; NNG_ESTATE = 11
      ))
  )

; a callback pointer
(define server-cb (make-nng-aio-alloc-cb server-callback))


(define (alloc-work socket)
  (let ([w (make-ftype-pointer work (nng-alloc (ftype-sizeof work)))]  ;; foreign-alloc / nng-alloc
        [aio* (make-ftype-pointer nng_aio* (foreign-alloc (ftype-sizeof nng_aio*)))])
    ;; the last parameter of nng-aio-alloc is void* (for general-purpose), so change w to (ftype-pointer-address w)
    (fatal 'nng-aio-alloc (nng-aio-alloc aio* server-cb (ftype-pointer-address w)))
    (ftype-set! work (state) w INIT)
    (ftype-set! work (sock) w socket)
    ; set aio as nng-aio-alloc use a defined aio but not w.aio
    (ftype-set! work (aio) w (ftype-ref nng_aio* () aio*))
    w
    ))

; The server runs forever.
(define (server url)
  (printf "server start at <~a>\n" url)
  (let ([socket (make-ftype-pointer nng_socket (foreign-alloc (ftype-sizeof nng_socket)))]
        [works (make-vector parallel)])
    ; Create the socket.
    (fatal 'nng-rep-open-raw (nng-rep-open-raw socket))
    
    (for-each (lambda (i) (vector-set! works i (alloc-work socket))) (iota parallel))
    
    (fatal 'nng-listen (nng-listen socket url (make-ftype-null nng_listener) 0))
    
    ; this starts them going (INIT state)
    (for-each (lambda (i) (server-callback (vector-ref works i))) (iota parallel))
    (printf "server inited\n")

    ; neither pause() nor sleep() portable
    (sleep (make-time 'time-duration 0 3600000))
    )
  )

(define (client url secs)
  (let ([start 0]
        [end 0]
        [msec (* 1000 (string->number secs))]
        [socket (make-ftype-pointer nng_socket (foreign-alloc (ftype-sizeof nng_socket)))]
        [msg* (make-ftype-pointer nng_msg* (foreign-alloc (ftype-sizeof nng_msg*)))])
    (fatal 'nng-req-open (nng-req-open socket))
    (fatal 'nng-dial (nng-dial socket url (make-ftype-null nng_dialer) 0))
    (set! start (current-time))
    (fatal 'nng-msg-alloc (nng-msg-alloc msg* 0))
    (fatal 'nng-msg-append-u32 (nng-msg-append-u32 (ftype-ref nng_msg* () msg*) msec))
    (fatal 'nng-sendmsg (nng-sendmsg socket (ftype-ref nng_msg* () msg*) 0))
    (fatal 'nng-recvmsg (nng-recvmsg socket msg* 0))
    (set! end (current-time))
    (nng-msg-free (ftype-ref nng_msg* () msg*))
    (nng-close socket)
    (let ([d (time-difference end start)])
      (printf "Request took ~a milliseconds.\n" (+ (* 1000 (time-second d)) (/ (time-nanosecond d) 1000000.0))))
    ))

(let ([args (command-line)])
  (unless (= 3 (length args))
    (error 'x "Usage: scheme --script nng-raw.ss <url> [-s|<secs>]\n")
    (exit 1))

  (if (string=? "-s" (caddr args))
    (server (cadr args))
    (client (cadr args) (caddr args))
    ))
