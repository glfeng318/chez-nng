;;
;; scheme --script pub-sub.ss server ipc:///tmp/pair.ipc
;; scheme --script pub-sub.ss client ipc:///tmp/pair.ipc client1
;; scheme --script pub-sub.ss client ipc:///tmp/pair.ipc client2
;; scheme --script pub-sub.ss client ipc:///tmp/pair.ipc client3
;;

(library-directories "lib")
(import (libnng nng))

(define (fatal who r)
  (unless (= 0 r)
    (error who (string-append (nng-strerror r)))
    (exit 1)))

(define-ftype string (* char))
(define (make-string-pointer str)
  (let* ([len (string-length str)]
         [p (make-ftype-pointer char (foreign-alloc (fx* (ftype-sizeof char) (fx+ len 1))))])
    (do ([i 0 (fx+ i 1)])
        ((fx= i len))
        (ftype-set! char () p i (string-ref str i)))
    (ftype-set! char () p len #\nul)
    p))

(define (send-name sock name)
  (printf "~a: SENDING ~s\n" name name)
  (fatal 'nng-send (nng-send sock (ftype-pointer-address (make-string-pointer name)) (+ 1 (string-length name)) 0)))
(define (recv-name sock name)
  (let ([buf (make-ftype-pointer string (foreign-alloc (ftype-sizeof string)))]
        [sz (make-ftype-pointer size_t (foreign-alloc (ftype-sizeof size_t)))])
    (when (= 0 (nng-recv sock (ftype-pointer-address buf) sz NNG_FLAG_ALLOC))
      (printf "~a: RECEIVED ~s\n" name (ftype-pointer->sexpr buf))
      (nng-free (ftype-pointer-address buf) (ftype-ref size_t () sz)))
    
    ))
(define (send-recv sock name)
  (fatal 'nng-socket-set-ms 
         (nng-socket-set-ms
           sock
           NNG_OPT_RECVTIMEO
           (let ([ptr (make-ftype-pointer nng_duration (foreign-alloc (ftype-sizeof nng_duration)))])
             (ftype-set! nng_duration () ptr 100)
             ptr)))
  (do ()
      (#f)
      (begin
        (send-name sock name)
        (sleep (make-time 'time-duration 0 1))
        (recv-name sock name)
        ))
  )

(define (server url)
  (let ([sock (nng-socket-initializer)])
    (fatal 'nng-pub-open (nng-pub-open sock))
    (fatal 'nng-listen (nng-listen sock url (make-ftype-null nng_listener) 0))
    (do ()
        (#f)
        (let* ([d (date-and-time)])
          (printf "SERVER: PUBLISHING DATE ~a\n" d)
          (fatal 'nng-send (nng-send sock (ftype-pointer-address (make-string-pointer d)) (+ 1 (string-length d)) 0))
          (sleep (make-time 'time-duration 0 1))
          ))
    ))
(define (client url name)
  (let ([sock (nng-socket-initializer)])
    (fatal 'nng-sub-open (nng-sub-open sock))
    ;; subscribe to everything (empty means all topics)
    (fatal 'nng-socket-set-string (nng-socket-set-string sock NNG_OPT_SUB_SUBSCRIBE ""))
    (fatal 'nng-dial (nng-dial sock url (make-ftype-null nng_dialer) 0))
    (do ()
        (#f)
        (let* ([buf (make-ftype-pointer string (foreign-alloc (ftype-sizeof string)))]
               [sz (make-ftype-pointer size_t (foreign-alloc (ftype-sizeof size_t)))]
               [r (nng-recv sock (ftype-pointer-address buf) sz NNG_FLAG_ALLOC)])
          
          (if (= r 0)
            (printf "CLIENT (~a): RECEIVED ~a\n" name (ftype-pointer->sexpr buf))
            (printf "CLIENT (~a): RECEIVED ~a\n" name (nng-strerror r)))
          
          (sleep (make-time 'time-duration 0 1))
          ))
    ))

(let ([args (command-line)])
  (unless (> (length args) 2)
    (printf "Usage: scheme --script pub-sub.ss server|client <URL> <ARG>\n")
    (exit 1))
  (case (cadr args)
    ["server" (server (caddr args))]
    ["client" (client (caddr args) (cadddr args))]
    [else (printf "Usage: scheme --script pub-sub.ss server|client <URL> <ARG>\n")]))
