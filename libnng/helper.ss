;;
;; helper.ss
;;

(define-syntax define-callback
  (lambda (x)
    (syntax-case x ()
      [(_ name args ret)
       #'(define name
           (lambda (p)
             (let ([code (foreign-callable p args ret)])
               (lock-object code)
               (foreign-callable-entry-point code))))])))
