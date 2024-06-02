(library-directories '(("." . ".") ("libnng" . "libnng")))
(import (libnng nng))

(define-ftype string (* char))
(define (make-string-pointer str)
  (let* ([len (string-length str)]
         [p (make-ftype-pointer char (foreign-alloc (fx* (ftype-sizeof char) (fx+ len 1))))])
    (do ([i 0 (fx+ i 1)])
        ((fx= i len))
        (ftype-set! char () p i (string-ref str i)))
    (ftype-set! char () p len #\nul)
    p))

(let* ([msg "This is an error message"]
       [sp (make-string-pointer msg)]
       [s (make-ftype-pointer string (foreign-alloc (ftype-sizeof string)))]
       [_ (ftype-set! string () s sp)])
  (printf "sp: ~a ~a\n" sp (ftype-pointer->sexpr sp))
  (printf "sp[0]: ~a\n" (ftype-ref char () sp 0))
  (printf "sp[1]: ~a\n" (ftype-ref char () sp 1))
  (printf "sp[2]: ~a\n" (ftype-ref char () sp 2))
  (printf "sp[23]: ~a\n" (ftype-ref char () sp 23))
  (printf "sp[24]: ~a\n" (ftype-ref char () sp 24))
  (printf "sp[25]: ~a\n" (ftype-ref char () sp 25))
  (printf "s: ~a: ~a\n" s (ftype-pointer->sexpr s))
  )


(define logger
  (make-nng-logger
    (lambda (level facility msg-id msg)
      ; (list->string (map (lambda (i) (foreign-ref 'char data i)) (iota len)))
      (printf "logger: ~a[~a]: ~a\n" msg-id (ftype-ref char () msg-id) (ftype-pointer->sexpr msg)))))
(nng-log-set-logger logger)
(nng-log-set-level NNG_LOG_DEBUG)
(printf "log level => ~a\n" (nng-log-get-level))
(nng-log-err (make-string-pointer "err") (make-string-pointer "This is an error message"))



(nng-log-set-logger (make-nng-logger nng-stderr-logger))
(nng-log-set-level NNG_LOG_DEBUG)
(printf "log level => ~a\n" (nng-log-get-level))
(nng-log-err (make-string-pointer "err") (make-string-pointer "This is an error message"))
(nng-log-err (make-string-pointer "err") (make-string-pointer "This is an error message"))
(nng-log-err (make-string-pointer "err") (make-string-pointer "This is an error message"))
(nng-log-err (make-string-pointer "err") (make-string-pointer "This is an error message"))