;;
;; a simple web server with chez-nng
;; http://127.0.0.1/
;; http://127.0.0.1/ok
;;
;; scheme --script nng-http-server2.ss
;; ab -c100 -n10000 -k 'http://127.0.0.1/ok'
;; watch -n 1 'cat /proc/net/sockstat'
;;

(library-directories "lib")
(import (libnng nng)
        (mysql mysql)
        (json json)
        (shtml shtml)
        (libduckdb chez-duckdb))

(nng-log-set-logger (make-nng-logger nng-stderr-logger))
(nng-log-set-level NNG_LOG_DEBUG)

(define conn (connect 
                `((hostname . "host.docker.internal")
                  (port . 4406)
                  (user . "test")
                  (password . "test123")
                  (database . "iot_database"))))

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

(define url (make-ftype-pointer nng_url*         (foreign-alloc (ftype-sizeof nng_url*))))
(define aio (make-ftype-pointer nng_aio*         (foreign-alloc (ftype-sizeof nng_aio*))))
(define s  (make-ftype-pointer nng_http_server*  (foreign-alloc (ftype-sizeof nng_http_server*))))

(define-fn make-on-handle ((* nng_aio)) void)
(define (make-handler) (make-ftype-pointer nng_http_handler* (foreign-alloc (ftype-sizeof nng_http_handler*))))

;;
;; handler function accept an req param which contains all parsed key-value, headers/cookies/params/session/...
;; the req param is from AIO
;;

(define-syntax router
  (syntax-rules ()
    ((_) '())
    ((_ (r f) ...) (list (cons r f) ...))))

(define install-handler
  (lambda (uri handler)
    (let ([h (make-handler)])
      (nng-http-handler-alloc
        h
        uri
        (make-on-handle
          (lambda (aio)
            (let* ([ret (nng-aio-result aio)]
                   [req (make-ftype-pointer nng_http_req (nng-aio-get-input aio 0))]
                   [conn (nng-aio-get-input aio 2)]
                   [res (make-ftype-pointer nng_http_res* (foreign-alloc (ftype-sizeof nng_http_res*)))]
                   [req-ht (let ([ht (make-eq-hashtable)]
                                 [hht (make-eq-hashtable)])
                             (hashtable-set! ht 'uri (nng-http-req-get-uri req))
                             (hashtable-set! ht 'request-method (nng-http-req-get-method req))
                             (hashtable-set! ht 'version (nng-http-req-get-version req))
                             ;; headers
                             (hashtable-set! hht 'a-im (nng-http-req-get-header req "a-im"))
                             (hashtable-set! hht 'accept (nng-http-req-get-header req "accept"))
                             (hashtable-set! hht 'accept-ch (nng-http-req-get-header req "accept-ch"))
                             (hashtable-set! hht 'accept-charset (nng-http-req-get-header req "accept-charset"))
                             (hashtable-set! hht 'accept-datetime (nng-http-req-get-header req "accept-datetime"))
                             (hashtable-set! hht 'accept-encoding (nng-http-req-get-header req "accept-encoding"))
                             (hashtable-set! hht 'accept-language (nng-http-req-get-header req "accept-language"))
                             (hashtable-set! hht 'accept-patch (nng-http-req-get-header req "accept-patch"))
                             (hashtable-set! hht 'accept-post (nng-http-req-get-header req "accept-post"))
                             (hashtable-set! hht 'accept-ranges (nng-http-req-get-header req "accept-ranges"))
                             (hashtable-set! hht 'access-control-allow-credentials (nng-http-req-get-header req "access-control-allow-credentials"))
                             (hashtable-set! hht 'access-control-allow-headers (nng-http-req-get-header req "access-control-allow-headers"))
                             (hashtable-set! hht 'access-control-allow-methods (nng-http-req-get-header req "access-control-allow-methods"))
                             (hashtable-set! hht 'access-control-allow-origin (nng-http-req-get-header req "access-control-allow-origin"))
                             (hashtable-set! hht 'access-control-expose-headers (nng-http-req-get-header req "access-control-expose-headers"))
                             (hashtable-set! hht 'access-control-max-age (nng-http-req-get-header req "access-control-max-age"))
                             (hashtable-set! hht 'access-control-request-headers (nng-http-req-get-header req "access-control-request-headers"))
                             (hashtable-set! hht 'access-control-request-method (nng-http-req-get-header req "access-control-request-method"))
                             (hashtable-set! hht 'age (nng-http-req-get-header req "age"))
                             (hashtable-set! hht 'allow (nng-http-req-get-header req "allow"))
                             (hashtable-set! hht 'alt-svc (nng-http-req-get-header req "alt-svc"))
                             (hashtable-set! hht 'authorization (nng-http-req-get-header req "authorization"))
                             (hashtable-set! hht 'cache-control (nng-http-req-get-header req "cache-control"))
                             (hashtable-set! hht 'clear-site-data (nng-http-req-get-header req "clear-site-data"))
                             (hashtable-set! hht 'connection (nng-http-req-get-header req "connection"))
                             (hashtable-set! hht 'content-disposition (nng-http-req-get-header req "content-disposition"))
                             (hashtable-set! hht 'content-encoding (nng-http-req-get-header req "content-encoding"))
                             (hashtable-set! hht 'content-language (nng-http-req-get-header req "content-language"))
                             (hashtable-set! hht 'content-length (nng-http-req-get-header req "content-length"))
                             (hashtable-set! hht 'content-location (nng-http-req-get-header req "content-location"))
                             (hashtable-set! hht 'content-range (nng-http-req-get-header req "content-range"))
                             (hashtable-set! hht 'content-security-policy (nng-http-req-get-header req "content-security-policy"))
                             (hashtable-set! hht 'content-security-policy-report-only (nng-http-req-get-header req "content-security-policy-report-only"))
                             (hashtable-set! hht 'content-type (nng-http-req-get-header req "content-type"))
                             (hashtable-set! hht 'cookie (nng-http-req-get-header req "cookie"))
                             (hashtable-set! hht 'cross-origin-embedder-policy (nng-http-req-get-header req "cross-origin-embedder-policy"))
                             (hashtable-set! hht 'cross-origin-opener-policy (nng-http-req-get-header req "cross-origin-opener-policy"))
                             (hashtable-set! hht 'cross-origin-resource-policy (nng-http-req-get-header req "cross-origin-resource-policy"))
                             (hashtable-set! hht 'date (nng-http-req-get-header req "date"))
                             (hashtable-set! hht 'delta-base (nng-http-req-get-header req "delta-base"))
                             (hashtable-set! hht 'device-memory (nng-http-req-get-header req "device-memory"))
                             (hashtable-set! hht 'digest (nng-http-req-get-header req "digest"))
                             (hashtable-set! hht 'etag (nng-http-req-get-header req "etag"))
                             (hashtable-set! hht 'expect (nng-http-req-get-header req "expect"))
                             (hashtable-set! hht 'expect-ct (nng-http-req-get-header req "expect-ct"))
                             (hashtable-set! hht 'expires (nng-http-req-get-header req "expires"))
                             (hashtable-set! hht 'forwarded (nng-http-req-get-header req "forwarded"))
                             (hashtable-set! hht 'from (nng-http-req-get-header req "from"))
                             (hashtable-set! hht 'host (nng-http-req-get-header req "host"))
                             (hashtable-set! hht 'http2-settings (nng-http-req-get-header req "http2-settings"))
                             (hashtable-set! hht 'if-match (nng-http-req-get-header req "if-match"))
                             (hashtable-set! hht 'if-modified-since (nng-http-req-get-header req "if-modified-since"))
                             (hashtable-set! hht 'if-none-match (nng-http-req-get-header req "if-none-match"))
                             (hashtable-set! hht 'if-range (nng-http-req-get-header req "if-range"))
                             (hashtable-set! hht 'if-unmodified-since (nng-http-req-get-header req "if-unmodified-since"))
                             (hashtable-set! hht 'im (nng-http-req-get-header req "im"))
                             (hashtable-set! hht 'keep-alive (nng-http-req-get-header req "keep-alive"))
                             (hashtable-set! hht 'last-modified (nng-http-req-get-header req "last-modified"))
                             (hashtable-set! hht 'link (nng-http-req-get-header req "link"))
                             (hashtable-set! hht 'location (nng-http-req-get-header req "location"))
                             (hashtable-set! hht 'max-forwards (nng-http-req-get-header req "max-forwards"))
                             (hashtable-set! hht 'nel (nng-http-req-get-header req "nel"))
                             (hashtable-set! hht 'origin (nng-http-req-get-header req "origin"))
                             (hashtable-set! hht 'permissions-policy (nng-http-req-get-header req "permissions-policy"))
                             (hashtable-set! hht 'pragma (nng-http-req-get-header req "pragma"))
                             (hashtable-set! hht 'prefer (nng-http-req-get-header req "prefer"))
                             (hashtable-set! hht 'proxy-authenticate (nng-http-req-get-header req "proxy-authenticate"))
                             (hashtable-set! hht 'proxy-authorization (nng-http-req-get-header req "proxy-authorization"))
                             (hashtable-set! hht 'purpose (nng-http-req-get-header req "purpose"))
                             (hashtable-set! hht 'range (nng-http-req-get-header req "range"))
                             (hashtable-set! hht 'referer (nng-http-req-get-header req "referer"))
                             (hashtable-set! hht 'referrer-policy (nng-http-req-get-header req "referrer-policy"))
                             (hashtable-set! hht 'retry-after (nng-http-req-get-header req "retry-after"))
                             (hashtable-set! hht 'save-data (nng-http-req-get-header req "save-data"))
                             (hashtable-set! hht 'sec-fetch-dest (nng-http-req-get-header req "sec-fetch-dest"))
                             (hashtable-set! hht 'sec-fetch-mode (nng-http-req-get-header req "sec-fetch-mode"))
                             (hashtable-set! hht 'sec-fetch-site (nng-http-req-get-header req "sec-fetch-site"))
                             (hashtable-set! hht 'sec-fetch-user (nng-http-req-get-header req "sec-fetch-user"))
                             (hashtable-set! hht 'sec-websocket-accept (nng-http-req-get-header req "sec-websocket-accept"))
                             (hashtable-set! hht 'server (nng-http-req-get-header req "server"))
                             (hashtable-set! hht 'server-timing (nng-http-req-get-header req "server-timing"))
                             (hashtable-set! hht 'set-cookie (nng-http-req-get-header req "set-cookie"))
                             (hashtable-set! hht 'sourcemap (nng-http-req-get-header req "sourcemap"))
                             (hashtable-set! hht 'strict-transport-security (nng-http-req-get-header req "strict-transport-security"))
                             (hashtable-set! hht 'te (nng-http-req-get-header req "te"))
                             (hashtable-set! hht 'timing-allow-origin (nng-http-req-get-header req "timing-allow-origin"))
                             (hashtable-set! hht 'trailer (nng-http-req-get-header req "trailer"))
                             (hashtable-set! hht 'transfer-encoding (nng-http-req-get-header req "transfer-encoding"))
                             (hashtable-set! hht 'upgrade (nng-http-req-get-header req "upgrade"))
                             (hashtable-set! hht 'upgrade-insecure-requests (nng-http-req-get-header req "upgrade-insecure-requests"))
                             (hashtable-set! hht 'user-agent (nng-http-req-get-header req "user-agent"))
                             (hashtable-set! hht 'vary (nng-http-req-get-header req "vary"))
                             (hashtable-set! hht 'via (nng-http-req-get-header req "via"))
                             (hashtable-set! hht 'want-digest (nng-http-req-get-header req "want-digest"))
                             (hashtable-set! hht 'warning (nng-http-req-get-header req "warning"))
                             (hashtable-set! hht 'www-authenticate (nng-http-req-get-header req "www-authenticate"))
                             (hashtable-set! hht 'x-content-type-options (nng-http-req-get-header req "x-content-type-options"))
                             (hashtable-set! hht 'x-dns-prefetch-control (nng-http-req-get-header req "x-dns-prefetch-control"))
                             (hashtable-set! hht 'x-forwarded-for (nng-http-req-get-header req "x-forwarded-for"))
                             (hashtable-set! hht 'x-forwarded-host (nng-http-req-get-header req "x-forwarded-host"))
                             (hashtable-set! hht 'x-forwarded-proto (nng-http-req-get-header req "x-forwarded-proto"))
                             (hashtable-set! hht 'x-frame-options (nng-http-req-get-header req "x-frame-options"))
                             (hashtable-set! hht 'x-powered-by (nng-http-req-get-header req "x-powered-by"))
                             (hashtable-set! hht 'x-request-id (nng-http-req-get-header req "x-request-id"))
                             (hashtable-set! hht 'x-robots-tag (nng-http-req-get-header req "x-robots-tag"))
                             (hashtable-set! hht 'x-ua-compatible (nng-http-req-get-header req "x-ua-compatible"))
                             (hashtable-set! hht 'x-xss-protection (nng-http-req-get-header req "x-xss-protection"))
                             (hashtable-set! ht 'headers hht)
                             
                             ht
                             )]
                   [body (handler req-ht)]
                   )
              (nng-log-info "HANDLER" (format "[0x~(~x~)] ~a ~a" (ftype-pointer-address aio) (nng-http-req-get-method req) (nng-http-req-get-uri req)))
              (nng-http-res-alloc res)
              (nng-http-res-set-data (ftype-ref nng_http_res* () res) (ftype-pointer-address (make-string-pointer body)) (string-length body))
              ; 第三个参数需要进行转换
              (nng-aio-set-output aio 0 (ftype-pointer-address (ftype-ref nng_http_res* () res)))
              (nng-aio-finish aio 0))
              )))
      (nng-http-server-add-handler (ftype-ref nng_http_server* () s) (ftype-ref nng_http_handler* () h))
      )))

(define api-mysql
  (lambda (req)
    (nng-log-info "NNG-WEB" (hashtable-ref req 'request-method ""))
    (nng-log-info "NNG-WEB" (hashtable-ref req 'uri ""))
    (nng-log-info "NNG-WEB" (hashtable-ref req 'version ""))
    (nng-log-info "NNG-WEB" (hashtable-ref (hashtable-ref req 'headers (make-eq-hashtable)) 'user-agent ""))
    
    (nng-log-info "NNG-WEB" (hashtable-ref (hashtable-ref req 'headers (make-eq-hashtable)) 'accept-language ""))
    
    (string-append (json->string (query conn "select * from auto_test_db.test")) "\n")))

(define api-ok
  (lambda (req)
    (let ([data "{\"data\": [1,2,3,4,5]}"])
      data)))

(define api-index
  (lambda (req)
    (let* ([data (query conn "select * from auto_test_db.test limit 1")]
           [ht (make-eq-hashtable)])
      (for-each (lambda (r) (hashtable-set! ht (string->symbol (car r)) (cdr r))) (car (vector->list data)))
      (:html '("lang" "en")
        (:meta '("charset" "utf-8"))
        (:title "chez-nng-web")
        (:script '("src" "/static/js/htmx.min.js"))
        (:script "htmx.config.selfRequestsOnly=false;")
        (:script '("src" "https://cdn.jsdelivr.net/npm/@unocss/runtime"))
        (:link '("rel" "stylesheet" "href" "https://cdn.jsdelivr.net/npm/@unocss/reset/normalize.min.css"))
        (:body
          (:div '("class" "h-full flex p-10 bg-gray-50")
            (:div '("class" "ma max-w-7xl mx-auto px-5 sm-px10 md-px12 lg-px5 grid grid-cols-2 md-grid-cols-4 gap-4")
              (:div '("class" "flex-grow bg-white dark-bg-gray-950 shadow-lg shadow-gray-200/50 dark:shadow-transparent border border-gray-100/80 dark:border-gray-900/80 p-6 md:p-5 lg:p-6 rd-lg flex flex-col justify-center gap-0.5 text-center text-gray7 dark-text-gray3")
                (:span '("class" "font-semibold text-xl sm:text-3xl md:text-4xl text-gray9 dark-text-white") (hashtable-ref ht 'apptype "--"))
                (:span "apptype"))
              (:div '("class" "bg-white dark-bg-gray-950 shadow-lg shadow-gray-200/50 dark:shadow-transparent border border-gray-100/80 dark:border-gray-900/80 p-6 md:p-5 lg:p-6 rd-lg flex flex-col justify-center gap-0.5 text-center text-gray7 dark-text-gray3")
                (:span '("class" "font-semibold text-xl sm:text-3xl md:text-4xl text-gray9 dark-text-white") "4k")
                (:span "Projects"))
              (:div '("class" "bg-white dark-bg-gray-950 shadow-lg shadow-gray-200/50 dark:shadow-transparent border border-gray-100/80 dark:border-gray-900/80 p-6 md:p-5 lg:p-6 rd-lg flex flex-col justify-center gap-0.5 text-center text-gray7 dark-text-gray3")
                (:span '("class" "font-semibold text-xl sm:text-3xl md:text-4xl text-gray9 dark-text-white") "95%")
                (:span "Satisfaction"))
              (:div '("class" "bg-white dark-bg-gray-950 shadow-lg shadow-gray-200/50 dark:shadow-transparent border border-gray-100/80 dark:border-gray-900/80 p-6 md:p-5 lg:p-6 rd-lg flex flex-col justify-center gap-0.5 text-center text-gray7 dark-text-gray3")
                (:span '("id" "client"
                        "class" "font-semibold text-xl sm:text-3xl md:text-4xl text-gray9 dark-text-white"
                        "hx-get" "/client"
                        "hx-target" "#client"
                        "hx-trigger" "every 1s") "0")
                (:span "Clients"))))
          (:div '("class" "absolute bottom-5 right-0 left-0 text-center op30 fw300") "on-demand - instant - fully customizable - 中文")
          
          (:script "console.log('hello scheme')"))
        )
      )
    )
  )

(define client 0)
(define api-client
  (lambda (req)
    (set! client (+ client 1))
    (printf "~s\n" "中文")
    (string-append "中文" (number->string client))))

(define routers
  (router ("/" api-index)
          ("/db" api-mysql)
          ("/ok" api-ok)
          ("/client" api-client)))




(nng-url-parse url "http://0.0.0.0:80")
(nng-aio-alloc aio on-complete (ftype-pointer-address (make-ftype-null nng_url)))
(nng-http-server-hold s (ftype-ref nng_url* () url))

(for-each (lambda (r) (install-handler (car r) (cdr r))) routers)
(let ([h (make-handler)])
  (nng-http-handler-alloc-directory h "/static" "./resource")
  (nng-http-server-add-handler (ftype-ref nng_http_server* () s) (ftype-ref nng_http_handler* () h)))

(nng-http-server-start (ftype-ref nng_http_server* () s))

(nng-log-info "NNG-WEB" "nng-web start at http://0.0.0.0:7777")


; (fork-thread (lambda () (system "curl http://127.0.0.1/ok")))

(sleep (make-time 'time-duration 0 100000))


; (do ((t #\t))
;   (#\f (sleep (make-time 'time-duration 0 100))))
;


