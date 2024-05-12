;;
;; helper.ss
;;

(define-syntax make-ftype-null
  (syntax-rules ()
    ((_ type)
      (make-ftype-pointer type #x00000000))))

(define-syntax define-callback
  (lambda (x)
    (syntax-case x ()
      [(_ name args ret)
       #'(define name
           (lambda (p)
             (let ([code (foreign-callable __collect_safe p args ret)])
               (lock-object code)
               (foreign-callable-entry-point code))))])))
