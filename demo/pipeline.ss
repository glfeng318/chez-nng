;;
;; chez --script ./demo/pipeline.ss ipc:///tmp/pipeline.ipc
;; chez --script ./demo/pipeline.ss ipc:///tmp/pipeline.ipc hello
;;

;(library-directories "lib")
(library-directories '(("." . ".") ("lib" . "lib")))
(import (libnng nng))

(define (fatal who r)
  (unless (= 0 r)
    (error who (nng-strerror r))
    ))

(define-ftype string (* char))

(define (node0 url)
  (let ([sock (make-ftype-pointer nng_socket (foreign-alloc (ftype-sizeof nng_socket)))])
    (fatal 'nng-pull-open (nng-pull-open sock))
    (fatal 'nng-listen (nng-listen sock url (make-ftype-null nng_listener) 0))
    (do ()
        (#f)
        (let ([buf (make-ftype-pointer string (foreign-alloc (ftype-sizeof string)))]
              [sz (make-ftype-pointer size_t (foreign-alloc (ftype-sizeof size_t)))])
          (fatal 'nng-recv (nng-recv sock (ftype-pointer-address buf) sz NNG_FLAG_ALLOC))
          (printf "NODE0: RECEIVED ~a\n" (ftype-pointer->sexpr buf))
          (nng-free (ftype-pointer-address buf) (ftype-ref size_t () sz))
          ))
    ))

(define (node1 url msg)
  (let* ([sock (make-ftype-pointer nng_socket (foreign-alloc (ftype-sizeof nng_socket)))]
         [msg-ptr (let* ([len (string-length msg)]
                         [p (make-ftype-pointer char (foreign-alloc (fx* (ftype-sizeof char) (fx+ len 1))))])
                    (do ([i 0 (fx+ i 1)])
                      ((fx= i len))
                      (ftype-set! char () p i (string-ref msg i)))
                    (ftype-set! char () p len #\nul)
                    p)]
         [sz-msg (+ 1 (string-length msg))])
    (fatal 'nng-push-open (nng-push-open sock))
    (fatal 'nng-dial (nng-dial sock url (make-ftype-null nng_dialer) 0))
    (printf "NODE1: SENDING ~s\n" msg)
    (fatal 'nng-send (nng-send sock (ftype-pointer-address msg-ptr) sz-msg 0))
    (sleep (make-time 'time-duration 100 0))
    (nng-close sock)
    ))

(let ([args (command-line)])
  (case (length args)
    [2 (node0 (cadr args))]
    [3 (node1 (cadr args) (caddr args))]
    [else (printf "Usage: chez --script pipeline.ss <URL> <ARG>\n")]))
