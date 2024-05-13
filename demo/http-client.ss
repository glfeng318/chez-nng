;;
;; scheme --script http-client.ss http://httpbin.org/ip
;;

;(library-directories "lib")
(library-directories '(("." . ".") ("lib" . "lib")))
(import (libnng nng))

(when (= 1 (length (command-line)))
  (error 'http-client "No URL supplied!")
  (exit 1))

(define (fatal who r)
  (unless (= 0 r)
    (error who (string-append (nng-strerror r)))
    (exit 1)))

(define client (make-ftype-pointer nng_http_client* (foreign-alloc (ftype-sizeof nng_http_client*))))
(define conn   (make-ftype-pointer nng_http_conn    (foreign-alloc (ftype-sizeof nng_http_conn))))
(define url    (make-ftype-pointer nng_url*         (foreign-alloc (ftype-sizeof nng_url*))))
(define req    (make-ftype-pointer nng_http_req*    (foreign-alloc (ftype-sizeof nng_http_req*))))
(define res    (make-ftype-pointer nng_http_res*    (foreign-alloc (ftype-sizeof nng_http_res*))))
(define aio    (make-ftype-pointer nng_aio*         (foreign-alloc (ftype-sizeof nng_aio*))))

(define on-complete
  (make-nng-aio-alloc-cb
    (lambda (arg)
      (printf "callback with arg:~a\n" arg)
      )))


; (nng-url-parse url "http://httpbin.org/ip")
; (nng-url-parse url "http://host.docker.internal:8080/api/v1/cache")
(fatal 'nng-url-parse (nng-url-parse url (cadr (command-line))))
; (printf "url: ~a\n" url)
; (printf "url: ~a\n" (ftype-pointer->sexpr url))
; (printf "url: ~a\n" (ftype-pointer->sexpr (ftype-ref nng_url* () url)))
; (printf "url.u_hostname: ~a\n" (cadadr (cddddr (ftype-pointer->sexpr (ftype-ref nng_url* () url)))))

(fatal 'nng-http-client-alloc (nng-http-client-alloc client (ftype-ref nng_url* () url)))
; (printf "client: ~a\n" (ftype-pointer->sexpr client))


(fatal 'nng-http-req-alloc (nng-http-req-alloc req (ftype-ref nng_url* () url)))
; (printf "req:~a\n" req)
; (printf "req:~a\n" (ftype-pointer->sexpr req))

(fatal 'nng-http-res-alloc (nng-http-res-alloc res))
; (printf "res: ~a\n" (ftype-pointer->sexpr res))

(fatal 'nng-aio-alloc (nng-aio-alloc aio on-complete (ftype-pointer-address (make-ftype-null nng_url))))
; (printf "aio: ~a\n" aio)
; (printf "aio: ~a\n" (ftype-pointer->sexpr aio))
; (printf "aio: ~a\n" (ftype-pointer->sexpr (ftype-ref nng_aio* () aio)))
; (printf "aio: ~a\n" (ftype-ref nng_aio* () aio))

; start connection process and wait for it to finish.
(nng-http-client-connect (ftype-ref nng_http_client* () client) (ftype-ref nng_aio* () aio))
(nng-aio-wait (ftype-ref nng_aio* () aio))
(fatal 'nng-http-client-connect (nng-aio-result (ftype-ref nng_aio* () aio)))

; get the connection, at the 0th output.
(set! conn (make-ftype-pointer nng_http_conn (nng-aio-get-output (ftype-ref nng_aio* () aio) 0)))

; Request is already set up with URL, and for GET via HTTP/1.1.
; The Host: header is already set up too.

; Send the request, and wait for that to finish.
(nng-http-conn-write-req conn (ftype-ref nng_http_req* () req) (ftype-ref nng_aio* () aio))
(nng-aio-wait (ftype-ref nng_aio* () aio))
(fatal 'nng-http-conn-write-req (nng-aio-result (ftype-ref nng_aio* () aio)))

; Read a response.
(nng-http-conn-read-res conn (ftype-ref nng_http_res* () res) (ftype-ref nng_aio* () aio))
(nng-aio-wait (ftype-ref nng_aio* () aio))
(fatal 'nng-http-conn-read-res (nng-aio-result (ftype-ref nng_aio* () aio)))

(define status (nng-http-res-get-status (ftype-ref nng_http_res* () res)))
(unless (= NNG_HTTP_STATUS_OK status)
  (printf "HTTP Server Responded: ~d ~s\n"
    (nng-http-res-get-status (ftype-ref nng_http_res* () res))
    (nng-http-res-get-reason (ftype-ref nng_http_res* () res)))
  (exit 1)
  )

; This only supports regular transfer encoding (no Chunked-Encoding,
; and a Content-Length header is required.)
; (printf "~a\n" (nng-http-res-get-header (ftype-ref nng_http_res* () res) "Content-Length"))
; (printf "~a\n" (nng-http-res-get-header (ftype-ref nng_http_res* () res) "Content-Type"))
; (printf "~a\n" (nng-http-res-get-header (ftype-ref nng_http_res* () res) "Server"))

(define hdr (nng-http-res-get-header (ftype-ref nng_http_res* () res) "Content-Length"))
(when (null? hdr)
  (printf "Missing Content-Length header\n"))

(define len (string->number hdr))
; Allocate a buffer to receive the body data.
(define data (foreign-alloc len))

; Set up a single iov to point to the buffer.
(define iov (make-nng-iov data len))

; Following never fails with fewer than 5 elements.
(nng-aio-set-iov (ftype-ref nng_aio* () aio) 1 iov)

; Now attempt to receive the data and wait for it to complete.
(nng-http-conn-read-all conn (ftype-ref nng_aio* () aio));
(nng-aio-wait (ftype-ref nng_aio* () aio))
(fatal 'nng-http-conn-read-all (nng-aio-result (ftype-ref nng_aio* () aio)))

(printf "\n~a\n" (list->string (map (lambda (i) (foreign-ref 'char data i)) (iota len))))

