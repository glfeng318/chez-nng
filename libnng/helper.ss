;;
;; helper.ss
;;

; (make-ftype-null int)
(define-syntax make-ftype-null
  (syntax-rules ()
    ((_ type)
      (make-ftype-pointer type #x00000000))))

; (define-callback make-on-close (void*) void)
; (define on-close (make-on-close (lambda (p) (printf "~a\n" p))))
(define-syntax define-callback
  (lambda (x)
    (syntax-case x ()
      [(_ name args ret)
       #'(define name
           (lambda (p)
             (let ([code (foreign-callable __collect_safe p args ret)])
               (lock-object code)
               (foreign-callable-entry-point code))))])))

(alias define-fn define-callback)
