;;
;; a simple web server with chez-nng
;; http://127.0.0.1/
;; http://127.0.0.1/ok
;; http://127.0.0.1/home
;;
;; scheme --script nng-http-server2.ss
;; ab -c100 -n10000 -k 'http://127.0.0.1/ok'
;; watch -n 1 'cat /proc/net/sockstat'
;;

(library-directories "lib")
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

(define on-complete
  (make-nng-aio-alloc-cb
    (lambda (arg)
      (printf "callbackl with arg:~a\n" arg)
      )))

(define url (make-ftype-pointer nng_url*          (foreign-alloc (ftype-sizeof nng_url*))))
(define aio (make-ftype-pointer nng_aio*          (foreign-alloc (ftype-sizeof nng_aio*))))
(define s  (make-ftype-pointer nng_http_server*  (foreign-alloc (ftype-sizeof nng_http_server*))))

(define (make-handler) (make-ftype-pointer nng_http_handler* (foreign-alloc (ftype-sizeof nng_http_handler*))))
(define h  (make-handler))
(define h2 (make-handler))
(define h3 (make-handler))

(define doc1 "<html><body>Someone <b>is</b> home!</body></html>\n")

(nng-url-parse url "http://0.0.0.0:80")
(nng-aio-alloc aio on-complete (ftype-pointer-address (make-ftype-null nng_url)))
(nng-http-server-hold s (ftype-ref nng_url* () url))


(define-fn make-on-handle ((* nng_aio)) void)
(define on-handle
  (make-on-handle
    (lambda (aio)
      (let ([ret (nng-aio-result aio)]
            [req (nng-aio-get-input aio 0)]
            [conn (nng-aio-get-input aio 2)]
            [res (make-ftype-pointer nng_http_res* (foreign-alloc (ftype-sizeof nng_http_res*)))]
            )
        (printf "[~(~x~)] in on-handle: ~a\n" (ftype-pointer-address aio) (nng-strerror ret))
        ; (printf "req:~a\n" (make-ftype-pointer nng_http_req* req))
        (nng-http-res-alloc res)
        ; (printf "~a\n" (nng-http-req-get-header (ftype-ref nng_http_req* () (make-ftype-pointer nng_http_req* req)) "Connection"))
        (nng-http-res-set-data (ftype-ref nng_http_res* () res) (ftype-pointer-address (make-string-pointer "ok\n")) 3)
        (nng-aio-set-output aio 0 (ftype-pointer-address (ftype-ref nng_http_res* () res)))
        (nng-aio-finish aio 0)
        )
      
        )))
(define on-handle2
  (make-on-handle
    (lambda (aio)
      (let* ([ret (nng-aio-result aio)]
             [req (nng-aio-get-input aio 0)]
             [conn (nng-aio-get-input aio 2)]
             [res (make-ftype-pointer nng_http_res* (foreign-alloc (ftype-sizeof nng_http_res*)))]
             ;
             [data "{data: [1,2,3]}\n"]
             [p-data (ftype-pointer-address (make-string-pointer data))]
             )
        (printf "[~(~x~)] in on-handle2: ~a\n" (ftype-pointer-address aio) (nng-strerror ret))
        
        (printf "~a\n" (nng-http-req-get-header (make-ftype-pointer nng_http_req req) "host"))
        (printf "~a\n" (nng-http-req-get-header (make-ftype-pointer nng_http_req req) "user-agent"))
        (printf "~a\n" (nng-http-req-get-header (make-ftype-pointer nng_http_req req) "accept"))
        
        (printf "~a\n" (nng-http-req-get-version (make-ftype-pointer nng_http_req req)))
        (printf "~a\n" (nng-http-req-get-method (make-ftype-pointer nng_http_req req)))
        
        

        (nng-http-res-alloc res)
        (nng-http-res-set-header (ftype-ref nng_http_res* () res) "Content-Type" "application/json")
        (nng-http-res-set-data (ftype-ref nng_http_res* () res) p-data (string-length data))
        (nng-aio-set-output aio 0 (ftype-pointer-address (ftype-ref nng_http_res* () res)))
        (nng-aio-finish aio 0)
        )
      
        )))

(nng-http-handler-alloc h2 "/ok" on-handle2)
(nng-http-handler-alloc h "/" on-handle)
(nng-http-handler-alloc-static h3 "/home" (ftype-pointer-address (make-string-pointer doc1)) (string-length doc1) "text/html")

(nng-http-server-add-handler (ftype-ref nng_http_server* () s) (ftype-ref nng_http_handler* () h))
(nng-http-server-add-handler (ftype-ref nng_http_server* () s) (ftype-ref nng_http_handler* () h2))
(nng-http-server-add-handler (ftype-ref nng_http_server* () s) (ftype-ref nng_http_handler* () h3))

(nng-http-server-start (ftype-ref nng_http_server* () s))


; (fork-thread (lambda () (system "curl http://127.0.0.1/ok")))

(sleep (make-time 'time-duration 0 60))
