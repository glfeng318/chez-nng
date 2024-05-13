;;
;; scheme --script pair.ss node0 ipc:///tmp/pair.ipc
;; scheme --script pair.ss node1 ipc:///tmp/pair.ipc
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

(define (node0 url)
  (let ([sock (nng-socket-initializer)])
    (fatal 'nng-pair0-open (nng-pair0-open sock))
    (fatal 'nng-listen (nng-listen sock url (make-ftype-null nng_listener) 0))
    (send-recv sock "node0")
    ))
(define (node1 url)
  (sleep (make-time 'time-duration 0 1))
  (let ([sock (nng-socket-initializer)])
    (fatal 'nng-pair0-open (nng-pair0-open sock))
    (fatal 'nng-dial (nng-dial sock url (make-ftype-null nng_dialer) 0))
    (send-recv sock "node1")
    ))

(let ([args (command-line)])
  (unless (> (length args) 2)
    (printf "Usage: scheme --script pair.ss node0|node1 ipc:///tmp/pair.ipc\n")
    (exit 1))
  (case (cadr args)
    ["node0" (node0 (caddr args))]
    ["node1" (node1 (caddr args))]
    [else (printf "Usage: scheme --script pair.ss ipc:///tmp/pair.ipc req|rep\n")]))
