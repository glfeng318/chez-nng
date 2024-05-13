;;
;; scheme --script nng-req-rep.ss node0 ipc:///tmp/req-rep.ipc
;; scheme --script nng-req-rep.ss node1 ipc:///tmp/req-rep.ipc
;;

(library-directories "lib")
(import (libnng nng))

(define DATE "DATE")

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

(define (node0 url)
  (let ([sock (nng-socket-initializer)])
    (fatal 'nng-rep-open (nng-rep-open sock))
    (fatal 'nng-listen (nng-listen sock url (make-ftype-null nng_listener) 0))
    (do ()
        (#f)
        (let ([buf (make-ftype-pointer string (foreign-alloc (ftype-sizeof string)))]
              [sz (make-ftype-pointer size_t (foreign-alloc (ftype-sizeof size_t)))])
          (fatal 'nng-recv (nng-recv sock (ftype-pointer-address buf) sz NNG_FLAG_ALLOC))
          (when (and (= (ftype-ref size_t () sz) (+ 1 (string-length DATE))) (string=? (ftype-pointer->sexpr buf) DATE))
            (printf "NODE0: RECEIVED DATE REQUEST\n")
            (let* ([d (date-and-time)]
                   [d-ptr (make-string-pointer d)])
              (printf "NODE0: SENDING DATE ~a\n" d)
              (fatal 'nng-send (nng-send sock (ftype-pointer-address d-ptr) (+ 1 (string-length d)) 0))
              )
            (printf "NODE0: RECEIVED ~a\n" (ftype-pointer->sexpr buf)))
          (nng-free (ftype-pointer-address buf) (ftype-ref size_t () sz))
          ))
    ))
(define (node1 url)
  (let ([sock (nng-socket-initializer)]
        [buf (make-ftype-pointer string (foreign-alloc (ftype-sizeof string)))]
        [sz (make-ftype-pointer size_t (foreign-alloc (ftype-sizeof size_t)))])
    (fatal 'nng-req-open (nng-req-open sock))
    (fatal 'nng-dial (nng-dial sock url (make-ftype-null nng_dialer) 0))
    (printf "NODE1: SENDING DATE REQUEST ~a\n" DATE)
    (fatal 'nng-send (nng-send sock (ftype-pointer-address (make-string-pointer DATE)) (+ 1 (string-length DATE)) 0))
    (fatal 'nng-recv (nng-recv sock (ftype-pointer-address buf) sz NNG_FLAG_ALLOC))
    (printf "NODE1: RECEIVED DATE ~a\n" (ftype-pointer->sexpr buf))
    (nng-free (ftype-pointer-address buf) (ftype-ref size_t () sz))
    (nng-close sock)
    ))

(let ([args (command-line)])
  (unless (> (length args) 2)
    (printf "Usage: scheme --script req-rep.ss node0|node1 ipc:///tmp/req-rep.ipc\n")
    (exit 1))
  (case (cadr args)
    ["node0" (node0 (caddr args))]
    ["node1" (node1 (caddr args))]
    [else (printf "Usage: scheme --script req-rep.ss ipc:///tmp/req-rep.ipc req|rep\n")]))
