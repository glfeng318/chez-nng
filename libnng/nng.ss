(library (libnng nng (1 7 3))
  (export
    ; struct

    NNG_MAXADDRLEN

    nng_ctx_s
    nng_ctx
    nng_dialer_s
    nng_dialer
    nng_listener_s
    nng_listener
    nng_pipe_s
    nng_pipe
    nng_socket_s
    nng_socket

    make-nng-ctx-s
    make-nng-ctx
    make-nng-dialer-s
    make-nng-dialer
    make-nng-listener-s
    make-nng-listener
    make-nng-pipe-s
    make-nng-pipe
    make-nng-socket-s
    make-nng-socket

    nng_duration
    nng_time
    nng_msg
    nng_stat
    nng_aio
    nng_aio*
    nng_sockaddr_inproc
    nng_sockaddr_path
    nng_sockaddr_ipc
    nng_sockaddr_in6
    nng_sockaddr_in
    nng_sockaddr_zt
    nng_sockaddr_abstract
    nng_sockaddr_storage
    nng_sockaddr
    nng_iov
    nng_url
    nng_url*
    nng_stream
    nng_stream_dialer
    nng_stream_listener


    nng-pipe-initializer
    nng-socket-initializer
    nng-dialer-initializer
    nng-listener-initializer
    nng-ctx-initializer



    NNG_AF_UNSPEC
    NNG_AF_INPROC
    NNG_AF_IPC
    NNG_AF_INET
    NNG_AF_INET6
    NNG_AF_ZT
    NNG_AF_ABSTRACT

    NNG_DURATION_INFINITE
    NNG_DURATION_DEFAULT
    NNG_DURATION_ZERO
    nng-fini
    nng-close
    nng-socket-id
    nng-socket-set
    nng-socket-set-bool
    nng-socket-set-int
    nng-socket-set-size
    nng-socket-set-uint64
    nng-socket-set-string
    nng-socket-set-ptr
    nng-socket-set-ms
    nng-socket-set-addr
    nng-socket-get
    nng-socket-get-bool
    nng-socket-get-int
    nng-socket-get-size
    nng-socket-get-uint64
    nng-socket-get-string
    nng-socket-get-ptr
    nng-socket-get-ms
    nng-socket-get-addr
    NNG_PIPE_EV_ADD_PRE
    NNG_PIPE_EV_ADD_POST
    NNG_PIPE_EV_REM_POST
    NNG_PIPE_EV_NUM
    make-nng-pipe-cb
    nng-pipe-notify
    nng-listen
    nng-dial
    nng-dialer-create
    nng-listener-create
    nng-dialer-start
    nng-listener-start
    nng-dialer-close
    nng-listener-close
    nng-dialer-id
    nng-listener-id
    nng-dialer-set
    nng-dialer-set-bool
    nng-dialer-set-int
    nng-dialer-set-size
    nng-dialer-set-uint64
    nng-dialer-set-string
    nng-dialer-set-ptr
    nng-dialer-set-ms
    nng-dialer-set-addr
    nng-dialer-get
    nng-dialer-get-bool
    nng-dialer-get-int
    nng-dialer-get-size
    nng-dialer-get-uint64
    nng-dialer-get-string
    nng-dialer-get-ptr
    nng-dialer-get-ms
    nng-dialer-get-addr
    nng-listener-set
    nng-listener-set-bool
    nng-listener-set-int
    nng-listener-set-size
    nng-listener-set-uint64
    nng-listener-set-string
    nng-listener-set-ptr
    nng-listener-set-ms
    nng-listener-set-addr
    nng-listener-get
    nng-listener-get-bool
    nng-listener-get-int
    nng-listener-get-size
    nng-listener-get-uint64
    nng-listener-get-string
    nng-listener-get-ptr
    nng-listener-get-ms
    nng-listener-get-addr
    nng-strerror
    nng-send
    nng-recv
    nng-sendmsg
    nng-recvmsg
    nng-send-aio
    nng-recv-aio
    nng-ctx-open
    nng-ctx-close
    nng-ctx-id
    nng-ctx-recv
    nng-ctx-recvmsg
    nng-ctx-send
    nng-ctx-sendmsg
    nng-ctx-set
    nng-ctx-set-bool
    nng-ctx-set-int
    nng-ctx-set-size
    nng-ctx-set-uint64
    nng-ctx-set-string
    nng-ctx-set-ptr
    nng-ctx-set-ms
    nng-ctx-set-addr
    nng-ctx-get
    nng-ctx-get-bool
    nng-ctx-get-int
    nng-ctx-get-size
    nng-ctx-get-uint64
    nng-ctx-get-string
    nng-ctx-get-ptr
    nng-ctx-get-ms
    nng-ctx-get-addr
    nng-alloc
    nng-free
    nng-strdup
    nng-strfree
    make-nng-aio-alloc-cb
    nng-aio-alloc
    nng-aio-free
    nng-aio-reap
    nng-aio-stop
    nng-aio-result
    nng-aio-count
    nng-aio-cancel
    nng-aio-abort
    nng-aio-wait
    nng-aio-busy
    nng-aio-set-msg
    nng-aio-get-msg
    nng-aio-set-input
    nng-aio-get-input
    nng-aio-set-output
    nng-aio-get-output
    nng-aio-set-timeout
    nng-aio-set-expire
    nng-aio-set-iov
    nng-aio-begin
    nng-aio-finish
    nng-aio-defer
    nng-sleep-aio
    nng_msg_alloc
    nng_msg_free
    nng_msg_realloc
    nng_msg_reserve
    nng_msg_capacity
    nng_msg_header
    nng_msg_header_len
    nng_msg_body
    nng_msg_len
    nng-msg-append
    nng-msg-insert
    nng-msg-trim
    nng-msg-chop
    nng-msg-header-append
    nng-msg-header-insert
    nng-msg-header-trim
    nng-msg-header-chop
    nng-msg-header-append-u16
    nng-msg-header-append-u32
    nng-msg-header-append-u64
    nng-msg-header-insert-u16
    nng-msg-header-insert-u32
    nng-msg-header-insert-u64
    nng-msg-header-chop-u16
    nng-msg-header-chop-u32
    nng-msg-header-chop-u64
    nng-msg-header-trim-u16
    nng-msg-header-trim-u32
    nng-msg-header-trim-u64
    nng-msg-append-u16
    nng-msg-append-u32
    nng-msg-append-u64
    nng-msg-insert-u16
    nng-msg-insert-u32
    nng-msg-insert-u64
    nng-msg-chop-u16
    nng-msg-chop-u32
    nng-msg-chop-u64
    nng-msg-trim-u16
    nng-msg-trim-u32
    nng-msg-trim-u64
    nng-msg-dup
    nng-msg-clear
    nng-msg-header-clear
    nng-msg-set-pipe
    nng-msg-get-pipe
    nng-pipe-get
    nng-pipe-get-bool
    nng-pipe-get-int
    nng-pipe-get-ms
    nng-pipe-get-size
    nng-pipe-get-uint64
    nng-pipe-get-string
    nng-pipe-get-ptr
    nng-pipe-get-addr
    nng-pipe-close
    nng-pipe-id
    nng-pipe-socket
    nng-pipe-dialer
    nng-pipe-listener

    NNG_FLAG_ALLOC
    NNG_FLAG_NONBLOCK
    NNG_OPT_SOCKNAME
    NNG_OPT_RAW
    NNG_OPT_PROTO
    NNG_OPT_PROTONAME
    NNG_OPT_PEER
    NNG_OPT_PEERNAME
    NNG_OPT_RECVBUF
    NNG_OPT_SENDBUF
    NNG_OPT_RECVFD
    NNG_OPT_SENDFD
    NNG_OPT_RECVTIMEO
    NNG_OPT_SENDTIMEO
    NNG_OPT_LOCADDR
    NNG_OPT_REMADDR
    NNG_OPT_URL
    NNG_OPT_MAXTTL
    NNG_OPT_RECVMAXSZ
    NNG_OPT_RECONNMINT
    NNG_OPT_RECONNMAXT
    NNG_OPT_TLS_CONFIG
    NNG_OPT_TLS_AUTH_MODE
    NNG_OPT_TLS_CERT_KEY_FILE
    NNG_OPT_TLS_CA_FILE
    NNG_OPT_TLS_SERVER_NAME
    NNG_OPT_TLS_VERIFIED
    NNG_OPT_TLS_PEER_CN
    NNG_OPT_TLS_PEER_ALT_NAMES
    NNG_OPT_TCP_NODELAY
    NNG_OPT_TCP_KEEPALIVE
    NNG_OPT_TCP_BOUND_PORT
    NNG_OPT_IPC_SECURITY_DESCRIPTOR
    NNG_OPT_IPC_PERMISSIONS
    NNG_OPT_PEER_UID
    NNG_OPT_IPC_PEER_UID
    NNG_OPT_PEER_GID
    NNG_OPT_IPC_PEER_GID
    NNG_OPT_PEER_PID
    NNG_OPT_IPC_PEER_PID
    NNG_OPT_PEER_ZONEID
    NNG_OPT_IPC_PEER_ZONEID
    NNG_OPT_WS_REQUEST_HEADERS
    NNG_OPT_WS_RESPONSE_HEADERS
    NNG_OPT_WS_RESPONSE_HEADER
    NNG_OPT_WS_REQUEST_HEADER
    NNG_OPT_WS_REQUEST_URI
    NNG_OPT_WS_SENDMAXFRAME
    NNG_OPT_WS_RECVMAXFRAME
    NNG_OPT_WS_PROTOCOL
    NNG_OPT_WS_SEND_TEXT
    NNG_OPT_WS_RECV_TEXT
    NNG_OPT_SOCKET_FD
    nng-stats-get
    nng-stats-free
    nng-stats-dump
    nng-stat-next
    nng-stat-child
    nng-stat-name
    nng-stat-type
    nng-stat-find
    nng-stat-find-socket
    nng-stat-find-dialer
    nng-stat-find-listener
    NNG_STAT_SCOPE
    NNG_STAT_LEVEL
    NNG_STAT_COUNTER
    NNG_STAT_STRING
    NNG_STAT_BOOLEAN
    NNG_STAT_ID
    nng-stat-unit
    NNG_UNIT_NONE
    NNG_UNIT_BYTES
    NNG_UNIT_MESSAGES
    NNG_UNIT_MILLIS
    NNG_UNIT_EVENTS
    nng-stat-value
    nng-stat-bool
    nng-stat-string
    nng-stat-desc
    nng-stat-timestamp
    nng-device
    nng-device-aio
    NNG_EINTR
    NNG_ENOMEM
    NNG_EINVAL
    NNG_EBUSY
    NNG_ETIMEDOUT
    NNG_ECONNREFUSED
    NNG_ECLOSED
    NNG_EAGAIN
    NNG_ENOTSUP
    NNG_EADDRINUSE
    NNG_ESTATE
    NNG_ENOENT
    NNG_EPROTO
    NNG_EUNREACHABLE
    NNG_EADDRINVAL
    NNG_EPERM
    NNG_EMSGSIZE
    NNG_ECONNABORTED
    NNG_ECONNRESET
    NNG_ECANCELED
    NNG_ENOFILES
    NNG_ENOSPC
    NNG_EEXIST
    NNG_EREADONLY
    NNG_EWRITEONLY
    NNG_ECRYPTO
    NNG_EPEERAUTH
    NNG_ENOARG
    NNG_EAMBIGUOUS
    NNG_EBADTYPE
    NNG_ECONNSHUT
    NNG_EINTERNAL
    NNG_ESYSERR
    NNG_ETRANERR

    nng-url-parse
    nng-url-free
    nng-url-clone
    nng-version
    nng-stream-free
    nng-stream-close
    nng-stream-send
    nng-stream-recv
    nng-stream-set
    nng-stream-set-bool
    nng-stream-set-int
    nng-stream-set-size
    nng-stream-set-uint64
    nng-stream-set-string
    nng-stream-set-ptr
    nng-stream-set-ms
    nng-stream-set-addr
    nng-stream-get
    nng-stream-get-bool
    nng-stream-get-int
    nng-stream-get-size
    nng-stream-get-uint64
    nng-stream-get-string
    nng-stream-get-ptr
    nng-stream-get-ms
    nng-stream-get-addr
    nng-stream-dialer-alloc
    nng-stream-dialer-alloc-url
    nng-stream-dialer-free
    nng-stream-dialer-close
    nng-stream-dialer-dial
    nng-stream-dialer-set
    nng-stream-dialer-set-bool
    nng-stream-dialer-set-int
    nng-stream-dialer-set-size
    nng-stream-dialer-set-uint64
    nng-stream-dialer-set-string
    nng-stream-dialer-set-ptr
    nng-stream-dialer-set-ms
    nng-stream-dialer-set-addr
    nng-stream-dialer-get
    nng-stream-dialer-get-bool
    nng-stream-dialer-get-int
    nng-stream-dialer-get-size
    nng-stream-dialer-get-uint64
    nng-stream-dialer-get-string
    nng-stream-dialer-get-ptr
    nng-stream-dialer-get-ms
    nng-stream-dialer-get-addr
    nng-stream-listener-alloc
    nng-stream-listener-alloc-url
    nng-stream-listener-free
    nng-stream-listener-close
    nng-stream-listener-listen
    nng-stream-listener-accept
    nng-stream-listener-set
    nng-stream-listener-set-bool
    nng-stream-listener-set-int
    nng-stream-listener-set-size
    nng-stream-listener-set-uint64
    nng-stream-listener-set-string
    nng-stream-listener-set-ptr
    nng-stream-listener-set-ms
    nng-stream-listener-set-addr
    nng-stream-listener-get
    nng-stream-listener-get-bool
    nng-stream-listener-get-int
    nng-stream-listener-get-size
    nng-stream-listener-get-uint64
    nng-stream-listener-get-string
    nng-stream-listener-get-ptr
    nng-stream-listener-get-ms
    nng-stream-listener-get-addr
    
    ;;
    ;; protocol
    ;;
    ; pubsub0
    NNG_OPT_SUB_SUBSCRIBE
    NNG_OPT_SUB_UNSUBSCRIBE
    NNG_OPT_SUB_PREFNEW
    nng-pub-open 
    nng-pub-open-raw 
    nng-sub-open 
    nng-sub-open-raw 

    ; pair0
    nng-pair0-open 
    nng-pair0-open-raw 

    ; pair1
    NNG_OPT_PAIR1_POLY
    NNG_PAIR1_SELF
    NNG_PAIR1_PEER
    NNG_PAIR1_SELF_NAME
    NNG_PAIR1_PEER_NAME
    nng-pair1-open 
    nng-pair1-open-raw 
    nng-pair1-open-poly 

    ; bus0
    NNG_BUS0_SELF
    NNG_BUS0_PEER
    NNG_BUS0_SELF_NAME
    NNG_BUS0_PEER_NAME
    nng-bus-open 
    nng-bus-open-raw 

    ; pipeline0
    nng-push-open 
    nng-push-open-raw 
    nng-pull-open 
    nng-pull-open-raw 

    ; reqrep0
    NNG_REP0_SELF
    NNG_REP0_PEER
    NNG_REP0_SELF_NAME
    NNG_REP0_PEER_NAME
    NNG_REQ0_SELF
    NNG_REQ0_PEER
    NNG_REQ0_SELF_NAME
    NNG_REQ0_PEER_NAME
    NNG_OPT_REQ_RESENDTIME
    NNG_OPT_REQ_RESENDTICK
    nng-req-open 
    nng-req-open-raw 
    nng-rep-open 
    nng-rep-open-raw 

    ; survey0
    NNG_RESPONDENT0_SELF
    NNG_RESPONDENT0_PEER
    NNG_RESPONDENT0_SELF_NAME
    NNG_RESPONDENT0_PEER_NAME
    NNG_SURVEYOR0_SELF
    NNG_SURVEYOR0_PEER
    NNG_SURVEYOR0_SELF_NAME
    NNG_SURVEYOR0_PEER_NAME
    NNG_OPT_SURVEYOR_SURVEYTIME
    nng-respondent-open 
    nng-respondent-open-raw 
    nng-surveyor-open 
    nng-surveyor-open-raw 


    ;;
    ;; http
    ;;
    nng_tls_config
    ; nng_http_status
    NNG_HTTP_STATUS_CONTINUE                 
    NNG_HTTP_STATUS_SWITCHING                
    NNG_HTTP_STATUS_PROCESSING               
    NNG_HTTP_STATUS_OK                       
    NNG_HTTP_STATUS_CREATED                  
    NNG_HTTP_STATUS_ACCEPTED                 
    NNG_HTTP_STATUS_NOT_AUTHORITATIVE        
    NNG_HTTP_STATUS_NO_CONTENT               
    NNG_HTTP_STATUS_RESET_CONTENT            
    NNG_HTTP_STATUS_PARTIAL_CONTENT          
    NNG_HTTP_STATUS_MULTI_STATUS             
    NNG_HTTP_STATUS_ALREADY_REPORTED         
    NNG_HTTP_STATUS_IM_USED                  
    NNG_HTTP_STATUS_MULTIPLE_CHOICES         
    NNG_HTTP_STATUS_STATUS_MOVED_PERMANENTLY 
    NNG_HTTP_STATUS_FOUND                    
    NNG_HTTP_STATUS_SEE_OTHER                
    NNG_HTTP_STATUS_NOT_MODIFIED             
    NNG_HTTP_STATUS_USE_PROXY                
    NNG_HTTP_STATUS_TEMPORARY_REDIRECT       
    NNG_HTTP_STATUS_PERMANENT_REDIRECT       
    NNG_HTTP_STATUS_BAD_REQUEST              
    NNG_HTTP_STATUS_UNAUTHORIZED             
    NNG_HTTP_STATUS_PAYMENT_REQUIRED         
    NNG_HTTP_STATUS_FORBIDDEN                
    NNG_HTTP_STATUS_NOT_FOUND                
    NNG_HTTP_STATUS_METHOD_NOT_ALLOWED       
    NNG_HTTP_STATUS_NOT_ACCEPTABLE           
    NNG_HTTP_STATUS_PROXY_AUTH_REQUIRED      
    NNG_HTTP_STATUS_REQUEST_TIMEOUT          
    NNG_HTTP_STATUS_CONFLICT                 
    NNG_HTTP_STATUS_GONE                     
    NNG_HTTP_STATUS_LENGTH_REQUIRED          
    NNG_HTTP_STATUS_PRECONDITION_FAILED      
    NNG_HTTP_STATUS_PAYLOAD_TOO_LARGE        
    NNG_HTTP_STATUS_ENTITY_TOO_LONG          
    NNG_HTTP_STATUS_UNSUPPORTED_MEDIA_TYPE   
    NNG_HTTP_STATUS_RANGE_NOT_SATISFIABLE    
    NNG_HTTP_STATUS_EXPECTATION_FAILED       
    NNG_HTTP_STATUS_TEAPOT                   
    NNG_HTTP_STATUS_UNPROCESSABLE_ENTITY     
    NNG_HTTP_STATUS_LOCKED                   
    NNG_HTTP_STATUS_FAILED_DEPENDENCY        
    NNG_HTTP_STATUS_UPGRADE_REQUIRED         
    NNG_HTTP_STATUS_PRECONDITION_REQUIRED    
    NNG_HTTP_STATUS_TOO_MANY_REQUESTS        
    NNG_HTTP_STATUS_HEADERS_TOO_LARGE        
    NNG_HTTP_STATUS_UNAVAIL_LEGAL_REASONS    
    NNG_HTTP_STATUS_INTERNAL_SERVER_ERROR    
    NNG_HTTP_STATUS_NOT_IMPLEMENTED          
    NNG_HTTP_STATUS_BAD_GATEWAY              
    NNG_HTTP_STATUS_SERVICE_UNAVAILABLE      
    NNG_HTTP_STATUS_GATEWAY_TIMEOUT          
    NNG_HTTP_STATUS_HTTP_VERSION_NOT_SUPP    
    NNG_HTTP_STATUS_VARIANT_ALSO_NEGOTIATES  
    NNG_HTTP_STATUS_INSUFFICIENT_STORAGE     
    NNG_HTTP_STATUS_LOOP_DETECTED            
    NNG_HTTP_STATUS_NOT_EXTENDED             
    NNG_HTTP_STATUS_NETWORK_AUTH_REQUIRED    

    nng_http_req
    nng_http_req*
    nng-http-req-alloc       
    nng-http-req-free        
    nng-http-req-get-method  
    nng-http-req-get-version 
    nng-http-req-get-uri     
    nng-http-req-set-header  
    nng-http-req-add-header  
    nng-http-req-del-header  
    nng-http-req-get-header  
    nng-http-req-set-method  
    nng-http-req-set-version 
    nng-http-req-set-uri     
    nng-http-req-set-data    
    nng-http-req-copy-data   
    nng-http-req-get-data    
    nng_http_res
    nng_http_res*
    nng-http-res-alloc       
    nng-http-res-alloc-error 
    nng-http-res-free        
    nng-http-res-get-status  
    nng-http-res-set-status  
    nng-http-res-get-reason  
    nng-http-res-set-reason  
    nng-http-res-set-header  
    nng-http-res-add-header  
    nng-http-res-del-header  
    nng-http-res-get-header  
    nng-http-res-set-version 
    nng-http-res-get-version 
    nng-http-res-get-data    
    nng-http-res-set-data    
    nng-http-res-copy-data   
    nng_http_conn
    nng_http_conn_close     
    nng_http_conn_read      
    nng_http_conn_read_all  
    nng_http_conn_write     
    nng_http_conn_write_all 
    nng_http_conn_write_req 
    nng_http_conn_write_res 
    nng_http_conn_read_req  
    nng_http_conn_read_res  
    nng_http_req_reset      
    nng_http_res_reset      
    nng_http_handler
    nng_http_handler_alloc              
    nng_http_handler_free               
    nng_http_handler_alloc_file         
    nng_http_handler_alloc_static       
    nng_http_handler_alloc_redirect     
    nng_http_handler_alloc_directory    
    nng_http_handler_set_method         
    nng_http_handler_set_host           
    nng_http_handler_collect_body       
    nng_http_handler_set_tree           
    nng_http_handler_set_tree_exclusive 
    nng_http_handler_set_data           
    nng_http_handler_get_data           
    nng_http_server
    nng_http_server_hold           
    nng_http_server_release        
    nng_http_server_start          
    nng_http_server_stop           
    nng_http_server_add_handler    
    nng_http_server_del_handler    
    nng_http_server_set_tls        
    nng_http_server_get_tls        
    nng_http_server_get_addr       
    nng_http_server_set_error_page 
    nng_http_server_set_error_file 
    nng_http_server_res_error      
    nng_http_hijack                
    nng_http_client
    nng_http_client*
    nng-http-client-alloc    
    nng-http-client-free     
    nng-http-client-set-tls  
    nng-http-client-get-tls  
    nng-http-client-connect  
    nng-http-conn-transact   
    nng-http-client-transact 


    )
  (import (chezscheme))

  (include "helper.ss")

  (define lib
    (load-shared-object
      (case (machine-type)
            ((a6osx i3osx ta6osx ti3osx) "/opt/homebrew/Cellar/nng/1.7.3/lib/libnng.1.7.3.dylib")
            ((a6le i3le ta6le ti3le) "libnng.so")
            (else "libnng.so"))))

  (define NNG_MAXADDRLEN 128)

  (define-ftype nng_ctx_s (struct [id unsigned-32]))
  (define (make-nng-ctx-s id)
    (let ([ptr (make-ftype-pointer nng_ctx_s (foreign-alloc (ftype-sizeof nng_ctx_s)))])
      (ftype-set! nng_ctx_s (id) ptr id)
      ptr))
  (define-ftype nng_ctx (struct [id unsigned-32]))
  (define (make-nng-ctx id)
    (let ([ptr (make-ftype-pointer nng_ctx (foreign-alloc (ftype-sizeof nng_ctx)))])
      (ftype-set! nng_ctx (id) ptr id)
      ptr))
  (define-ftype nng_dialer_s (struct [id unsigned-32]))
  (define (make-nng-dialer-s id)
    (let ([ptr (make-ftype-pointer nng_dialer_s (foreign-alloc (ftype-sizeof nng_dialer_s)))])
      (ftype-set! nng_dialer_s (id) ptr id)
      ptr))
  (define-ftype nng_dialer (struct [id unsigned-32]))
  (define (make-nng-dialer id)
    (let ([ptr (make-ftype-pointer nng_dialer (foreign-alloc (ftype-sizeof nng_dialer)))])
      (ftype-set! nng_dialer (id) ptr id)
      ptr))
  (define-ftype nng_listener_s (struct [id unsigned-32]))
  (define (make-nng-listener-s id)
    (let ([ptr (make-ftype-pointer nng_listener_s (foreign-alloc (ftype-sizeof nng_listener_s)))])
      (ftype-set! nng_listener_s (id) ptr id)
      ptr))
  (define-ftype nng_listener (struct [id unsigned-32]))
  (define (make-nng-listener id)
    (let ([ptr (make-ftype-pointer nng_listener (foreign-alloc (ftype-sizeof nng_listener)))])
      (ftype-set! nng_listener (id) ptr id)
      ptr))
  (define-ftype nng_pipe_s (struct [id unsigned-32]))
  (define (make-nng-pipe-s id)
    (let ([ptr (make-ftype-pointer nng_pipe_s (foreign-alloc (ftype-sizeof nng_pipe_s)))])
      (ftype-set! nng_pipe_s (id) ptr id)
      ptr))
  (define-ftype nng_pipe (struct [id unsigned-32]))
  (define (make-nng-pipe id)
    (let ([ptr (make-ftype-pointer nng_pipe (foreign-alloc (ftype-sizeof nng_pipe)))])
      (ftype-set! nng_pipe (id) ptr id)
      ptr))
  (define-ftype nng_socket_s (struct [id unsigned-32]))
  (define (make-nng-socket-s id)
    (let ([ptr (make-ftype-pointer nng_socket_s (foreign-alloc (ftype-sizeof nng_socket_s)))])
      (ftype-set! nng_socket_s (id) ptr id)
      ptr))
  (define-ftype nng_socket (struct [id unsigned-32]))
  (define (make-nng-socket id)
    (let ([ptr (make-ftype-pointer nng_socket (foreign-alloc (ftype-sizeof nng_socket)))])
      (ftype-set! nng_socket (id) ptr id)
      ptr))
  (define-ftype nng_duration unsigned-32) ; in milliseconds
  ; nng_time represents an absolute time since some arbitrary point in the
  ; past, measured in milliseconds.  The values are always positive.
  (define-ftype nng_time unsigned-64)
  (define-ftype nng_msg
    (struct
      [m_header_buf (array 16 unsigned-int)] ; NNI_MAX_MAX_TTL + 1
      [m_header_len size_t]
      [m_body void*]          ; nni_chunk
      [m_pipe unsigned-int]
      [m_refcnt void*]        ; nni_atomic_int 
      ))
  (define-ftype nng_stat
    (struct
      [s_info void*]  ; const nni_stat_info *s_info;
      [s_item void*]  ; const nni_stat_item *s_item;
      [s_children void*]
      [s_parent void*]
      [s_node void*]
      [s_timestamp nng_time]
      [s_val (union
               [sv_id int]
               [sv_bool boolean]
               [sv_value unsigned-long-long]
               [sv_string (* char)]
               )]
      ))
  (define-ftype nng_aio
    (struct
      [a_count size_t]
      [a_expire unsigned-64] ;uint64_t nni_time
      [a_timeout integer-32] ;int32_t nni_duration
      [a_result int]
      [a_stop boolean]
      [a_sleep boolean]
      [a_expire_ok boolean]
      [a_expiring boolean]
      [a_use_expire boolean]
      [a_task void*]
      [a_iov void*]
      [a_bio unsigned]
      [a_msg void*]
      [a_inputs void*]
      [a_outputs void*]
      [a_cancel_fn void*]
      [a_cancel_arg void*]
      [a_prov_data void*]
      [a_prov_node void*]
      [a_expire_q void*]
      [a_expire_node void*]
      [a_reap_node void*]
      ))
  (define-ftype nng_aio* (* nng_aio))

  ; Initializers
  (define nng-pipe-initializer (lambda () (make-nng-pipe 0)))
  (define nng-socket-initializer (lambda () (make-nng-socket 0)))
  (define nng-dialer-initializer (lambda () (make-nng-dialer 0)))
  (define nng-listener-initializer (lambda () (make-nng-listener 0)))
  (define nng-ctx-initializer (lambda () (make-nng-ctx 0)))

  ; Some address details. This is in some ways like a traditional sockets
  ; sockaddr, but we have our own to cope with our unique families, etc.
  ; The details of this structure are directly exposed to applications.
  ; These structures can be obtained via property lookups, etc.
  (define-ftype nng_sockaddr_inproc
    (struct
      [sa_family unsigned-16]
      [sa_name (array 128 char)]
      ))
  (define-ftype nng_sockaddr_path
    (struct
      [sa_family unsigned-16]
      [sa_path (array 128 char)]
      ))
  ; nng_sockaddr_ipc is same as nng_sockaddr_path
  (define-ftype nng_sockaddr_ipc
    (struct
      [sa_family unsigned-16]
      [sa_path (array 128 char)]
      ))
  (define-ftype nng_sockaddr_in6
    (struct
      [sa_family unsigned-16]
      [sa_port unsigned-16]
      [sa_addr (array 16 unsigned-8)]
      [sa_scope unsigned-32]
      ))
  (define-ftype nng_sockaddr_in
    (struct
      [sa_family unsigned-16]
      [sa_port unsigned-16]
      [sa_addr unsigned-32]
      ))
  (define-ftype nng_sockaddr_zt
    (struct
      [sa_family unsigned-16]
      [sa_nwid unsigned-64]
      [sa_nodeid unsigned-64]
      [sa_port unsigned-32]
      ))
  (define-ftype nng_sockaddr_abstract 
    (struct
      [sa_family unsigned-16]
      [sa_len unsigned-16]                 ; will be 0 - 107 max.
      [sa_name (array 107 unsigned-8)]     ; 108 linux/windows, without leading NUL
      ))
  ; nng_sockaddr_storage is the size required to store any nng_sockaddr.
  ; This size must not change, and no individual nng_sockaddr type may grow
  ; larger than this without breaking binary compatibility.
  (define-ftype nng_sockaddr_storage
    (struct
      [sa_family unsigned-16]
      [sa_pad (array 16 unsigned-64)]
      ))
  (define-ftype nng_sockaddr
    (struct
      [s_family unsigned-16]
      [s_ipc nng_sockaddr_ipc]
      [s_inproc nng_sockaddr_inproc]
      [s_in6 nng_sockaddr_in6]
      [s_in nng_sockaddr_in]
      [s_zt nng_sockaddr_zt]
      [s_abstract nng_sockaddr_abstract]
      [s_storage nng_sockaddr_storage]
      ))
  
  ; nng_sockaddr_family 
  (define NNG_AF_UNSPEC   0)
  (define NNG_AF_INPROC   1)
  (define NNG_AF_IPC      2)
  (define NNG_AF_INET     3)
  (define NNG_AF_INET6    4)
  (define NNG_AF_ZT       5) ; ZeroTier
  (define NNG_AF_ABSTRACT 6)
  
  ; Scatter/gather I/O.
  (define-ftype nng_iov
    (struct
      [iov_buf void*]
      [iov_len size_t]
      ))
  
  ; Some definitions for durations used with timeouts.  
  (define NNG_DURATION_INFINITE -1)
  (define NNG_DURATION_DEFAULT -2)
  (define NNG_DURATION_ZERO 0)

  ; nng_fini is used to terminate the library, freeing certain global resources.
  ; This should only be called during atexit() or just before dlclose().
  ; THIS FUNCTION MUST NOT BE CALLED CONCURRENTLY WITH ANY OTHER FUNCTION
  ; IN THIS LIBRARY; IT IS NOT REENTRANT OR THREADSAFE.
  ;
  ; For most cases, this call is unnecessary, but it is provided to assist
  ; when debugging with memory checkers (e.g. valgrind).  Calling this
  ; function prevents global library resources from being reported incorrectly
  ; as memory leaks.  In those cases, we recommend doing this with atexit().
  ; NNG_DECL void nng_fini(void);
  (define nng-fini (let ([f (foreign-procedure "nng_fini" () void)]) (lambda () (f))))

  ; nng_close closes the socket, terminating all activity and
  ; closing any underlying connections and releasing any associated
  ; resources.
  ; NNG_DECL int nng_close(nng_socket);
  (define nng-close (let ([f (foreign-procedure "nng_close" ((& nng_socket)) int)]) (lambda (socket) (f socket))))
  
  ; nng_socket_id returns the positive socket id for the socket, or -1 if the socket is not valid.
  (define nng-socket-id (let ([f (foreign-procedure "nng_socket_id" ((& nng_socket)) int)]) (lambda (socket) (f socket))))

  (define nng-socket-set        (let ([f (foreign-procedure "nng_socket_set"        ((& nng_socket) string void* size_t) int)])     (lambda (socket opt val valsz)  (f socket opt val valsz))))
  (define nng-socket-set-bool   (let ([f (foreign-procedure "nng_socket_set_bool"   ((& nng_socket) string boolean) int)])          (lambda (socket opt bval)       (f socket opt bval))))
  (define nng-socket-set-int    (let ([f (foreign-procedure "nng_socket_set_int"    ((& nng_socket) string int) int)])              (lambda (socket opt ival)       (f socket opt ival))))
  (define nng-socket-set-size   (let ([f (foreign-procedure "nng_socket_set_size"   ((& nng_socket) string size_t) int)])           (lambda (socket opt z)          (f socket opt z))))
  (define nng-socket-set-uint64 (let ([f (foreign-procedure "nng_socket_set_uint64" ((& nng_socket) string unsigned-64) int)])      (lambda (socket opt u64)        (f socket opt u64))))
  (define nng-socket-set-string (let ([f (foreign-procedure "nng_socket_set_string" ((& nng_socket) string string) int)])           (lambda (socket opt str)        (f socket opt str))))
  (define nng-socket-set-ptr    (let ([f (foreign-procedure "nng_socket_set_ptr"    ((& nng_socket) string void*) int)])            (lambda (socket opt ptr)        (f socket opt ptr))))
  (define nng-socket-set-ms     (let ([f (foreign-procedure "nng_socket_set_ms"     ((& nng_socket) string (& nng_duration)) int)]) (lambda (socket opt dur)        (f socket opt dur))))
  (define nng-socket-set-addr   (let ([f (foreign-procedure "nng_socket_set_addr"   ((& nng_socket) string (* nng_sockaddr)) int)]) (lambda (socket opt addr)       (f socket opt addr))))
  
  (define nng-socket-get        (let ([f (foreign-procedure "nng_socket_get"        ((& nng_socket) string void* (* size_t)) int)]) (lambda (socket opt val valszp) (f socket opt val valszp))))
  (define nng-socket-get-bool   (let ([f (foreign-procedure "nng_socket_get_bool"   ((& nng_socket) string (* boolean)) int)])      (lambda (socket opt bvalp)      (f socket opt bvalp))))
  (define nng-socket-get-int    (let ([f (foreign-procedure "nng_socket_get_int"    ((& nng_socket) string (* int)) int)])          (lambda (socket opt ivalp)      (f socket opt ivalp))))
  (define nng-socket-get-size   (let ([f (foreign-procedure "nng_socket_get_size"   ((& nng_socket) string (* size_t)) int)])       (lambda (socket opt zp)         (f socket opt zp))))
  (define nng-socket-get-uint64 (let ([f (foreign-procedure "nng_socket_get_uint64" ((& nng_socket) string (* unsigned-64)) int)])  (lambda (socket opt u64p)       (f socket opt u64p))))
  (define nng-socket-get-string (let ([f (foreign-procedure "nng_socket_get_string" ((& nng_socket) string void*) int)])            (lambda (socket opt strp)       (f socket opt strp))))
  (define nng-socket-get-ptr    (let ([f (foreign-procedure "nng_socket_get_ptr"    ((& nng_socket) string void*) int)])            (lambda (socket opt ptr)        (f socket opt ptr))))
  (define nng-socket-get-ms     (let ([f (foreign-procedure "nng_socket_get_ms"     ((& nng_socket) string (* nng_duration)) int)]) (lambda (socket opt durp)       (f socket opt durp))))
  (define nng-socket-get-addr   (let ([f (foreign-procedure "nng_socket_get_addr"   ((& nng_socket) string (* nng_sockaddr)) int)]) (lambda (socket opt addrp)      (f socket opt addrp))))

  ; Arguably the pipe callback functions could be handled as an option,
  ; but with the need to specify an argument, we find it best to unify
  ; this as a separate function to pass in the argument and the callback.
  ; Only one callback can be set on a given socket, and there is no way
  ; to retrieve the old value.
  ; enum nng_pipe_ev
  (define NNG_PIPE_EV_ADD_PRE 0)  ; Called just before pipe added to socket
  (define NNG_PIPE_EV_ADD_POST 1) ; Called just after pipe added to socket
  (define NNG_PIPE_EV_REM_POST 2) ; Called just after pipe removed from socket
  (define NNG_PIPE_EV_NUM 3)      ; Used internally, must be last.

  ; typedef void (*nng_pipe_cb)(nng_pipe, nng_pipe_ev, void *)
  (define-callback make-nng-pipe-cb ((& nng_pipe) unsigned-8 void*) void)
  
  ; nng_pipe_notify registers a callback to be executed when the
  ; given event is triggered.  To watch for different events, register
  ; multiple times.  Each event can have at most one callback registered.
  ; NNG_DECL int nng_pipe_notify(nng_socket, nng_pipe_ev, nng_pipe_cb, void *);
  (define nng-pipe-notify (let ([f (foreign-procedure "nng_pipe_notify" ((& nng_socket) unsigned-8 void* void*) int)]) (lambda (socket ev cb arg) (f socket ev cb arg))))

  ; nng_listen creates a listening endpoint with no special options,
  ; and starts it listening.  It is functionally equivalent to the legacy
  ; nn_bind(). The underlying endpoint is returned back to the caller in the
  ; endpoint pointer, if it is not NULL.  The flags are ignored at present.
  ; NNG_DECL int nng_listen(nng_socket, const char *, nng_listener *, int);
  (define nng-listen (let ([f (foreign-procedure "nng_listen" ((& nng_socket) string (* nng_listener) int) int)]) (lambda (socket url lp flags) (f socket url lp flags))))

  ; nng_dial creates a dialing endpoint, with no special options, and
  ; starts it dialing.  Dialers have at most one active connection at a time
  ; This is similar to the legacy nn_connect().  The underlying endpoint
  ; is returned back to the caller in the endpoint pointer, if it is not NULL.
  ; The flags may be NNG_FLAG_NONBLOCK to indicate that the first attempt to
  ; dial will be made in the background, returning control to the caller
  ; immediately.  In this case, if the connection fails, the function will
  ; keep retrying in the background.  (If the connection is dropped in either
  ; case, it will still be reconnected in the background -- only the initial
  ; connection attempt is normally synchronous.)
  ; NNG_DECL int nng_dial(nng_socket, const char *, nng_dialer *, int);
  (define nng-dial (let ([f (foreign-procedure "nng_dial" ((& nng_socket) string (* nng_dialer) int) int)]) (lambda (socket url dp flags) (f socket url dp flags))))

  ; nng_dialer_create creates a new dialer, that is not yet started.
  ; NNG_DECL int nng_dialer_create(nng_dialer *, nng_socket, const char *);
  (define nng-dialer-create   (let ([f (foreign-procedure "nng_dialer_create"   ((* nng_dialer) (& nng_socket) string) int)])       (lambda (dialerp socket url)   (f dialerp socket url))))

  ; nng_listener_create creates a new listener, that is not yet started.
  ; NNG_DECL int nng_listener_create(nng_listener *, nng_socket, const char *);
  (define nng-listener-create (let ([f (foreign-procedure "nng_listener_create" ((* nng_listener) (& nng_socket) string) int)])     (lambda (listenerp socket url) (f listenerp socket url))))

  ; nng_dialer_start starts the endpoint dialing.  This is only possible if
  ; the dialer is not already dialing.
  ; NNG_DECL int nng_dialer_start(nng_dialer, int);
  (define nng-dialer-start    (let ([f (foreign-procedure "nng_dialer_start"    ((& nng_dialer) int) int)])                         (lambda (dialer flags)         (f dialer flags))))

  ; nng_listener_start starts the endpoint listening.  This is only possible if
  ; the listener is not already listening.
  ; NNG_DECL int nng_listener_start(nng_listener, int);
  (define nng-listener-start (let ([f (foreign-procedure "nng_listener_start" ((& nng_listener) int) int)])                       (lambda (listener flags)       (f listener flags))))

  ; nng_dialer_close closes the dialer, shutting down all underlying
  ; connections and releasing all associated resources.
  ; NNG_DECL int nng_dialer_close(nng_dialer);
  (define nng-dialer-close (let ([f (foreign-procedure "nng_dialer_close" ((& nng_dialer)) int)])                             (lambda (dialer)               (f dialer))))

  ; nng_listener_close closes the listener, shutting down all underlying
  ; connections and releasing all associated resources.
  ; NNG_DECL int nng_listener_close(nng_listener);
  (define nng-listener-close (let ([f (foreign-procedure "nng_listener_close" ((& nng_listener)) int)])                           (lambda (listener)             (f listener))))

  ; nng_dialer_id returns the positive dialer ID, or -1 if the dialer is invalid.
  ; NNG_DECL int nng_dialer_id(nng_dialer);
  (define nng-dialer-id (let ([f (foreign-procedure "nng_dialer_id" ((& nng_dialer)) int)])                             (lambda (dialer)               (f dialer))))

  ; nng_listener_id returns the positive listener ID, or -1 if the listener is invalid.
  ; NNG_DECL int nng_listener_id(nng_listener);
  (define nng-listener-id (let ([f (foreign-procedure "nng_listener_id" ((& nng_listener)) int)])                           (lambda (listener)             (f listener))))

  (define nng-dialer-set          (let ([f (foreign-procedure "nng_dialer_set"        ((& nng_dialer) string void* size_t) int)])     (lambda (dialer opt val valsz)  (f dialer opt val valsz))))
  (define nng-dialer-set-bool     (let ([f (foreign-procedure "nng_dialer_set_bool"   ((& nng_dialer) string boolean) int)])          (lambda (dialer opt bval)       (f dialer opt bval))))
  (define nng-dialer-set-int      (let ([f (foreign-procedure "nng_dialer_set_int"    ((& nng_dialer) string int) int)])              (lambda (dialer opt ival)       (f dialer opt ival))))
  (define nng-dialer-set-size     (let ([f (foreign-procedure "nng_dialer_set_size"   ((& nng_dialer) string size_t) int)])           (lambda (dialer opt z)          (f dialer opt z))))
  (define nng-dialer-set-uint64   (let ([f (foreign-procedure "nng_dialer_set_uint64" ((& nng_dialer) string unsigned-64) int)])      (lambda (dialer opt u64)        (f dialer opt u64))))
  (define nng-dialer-set-string   (let ([f (foreign-procedure "nng_dialer_set_string" ((& nng_dialer) string string) int)])           (lambda (dialer opt str)        (f dialer opt str))))
  (define nng-dialer-set-ptr      (let ([f (foreign-procedure "nng_dialer_set_ptr"    ((& nng_dialer) string void*) int)])            (lambda (dialer opt ptr)        (f dialer opt ptr))))
  (define nng-dialer-set-ms       (let ([f (foreign-procedure "nng_dialer_set_ms"     ((& nng_dialer) string (& nng_duration)) int)]) (lambda (dialer opt dur)        (f dialer opt dur))))
  (define nng-dialer-set-addr     (let ([f (foreign-procedure "nng_dialer_set_addr"   ((& nng_dialer) string (* nng_sockaddr)) int)]) (lambda (dialer opt addr)       (f dialer opt addr))))

  (define nng-dialer-get          (let ([f (foreign-procedure "nng_dialer_get"        ((& nng_dialer) string void* (* size_t)) int)]) (lambda (dialer opt val valszp) (f dialer opt val valszp))))
  (define nng-dialer-get-bool     (let ([f (foreign-procedure "nng_dialer_get_bool"   ((& nng_dialer) string (* boolean)) int)])      (lambda (dialer opt bvalp)      (f dialer opt bvalp))))
  (define nng-dialer-get-int      (let ([f (foreign-procedure "nng_dialer_get_int"    ((& nng_dialer) string (* int)) int)])          (lambda (dialer opt ivalp)      (f dialer opt ivalp))))
  (define nng-dialer-get-size     (let ([f (foreign-procedure "nng_dialer_get_size"   ((& nng_dialer) string (* size_t)) int)])       (lambda (dialer opt zp)         (f dialer opt zp))))
  (define nng-dialer-get-uint64   (let ([f (foreign-procedure "nng_dialer_get_uint64" ((& nng_dialer) string (* unsigned-64)) int)])  (lambda (dialer opt u64p)       (f dialer opt u64p))))
  (define nng-dialer-get-string   (let ([f (foreign-procedure "nng_dialer_get_string" ((& nng_dialer) string void*) int)])            (lambda (dialer opt strp)       (f dialer opt strp))))
  (define nng-dialer-get-ptr      (let ([f (foreign-procedure "nng_dialer_get_ptr"    ((& nng_dialer) string void*) int)])            (lambda (dialer opt ptr)        (f dialer opt ptr))))
  (define nng-dialer-get-ms       (let ([f (foreign-procedure "nng_dialer_get_ms"     ((& nng_dialer) string (* nng_duration)) int)]) (lambda (dialer opt durp)       (f dialer opt durp))))
  (define nng-dialer-get-addr     (let ([f (foreign-procedure "nng_dialer_get_addr"   ((& nng_dialer) string (* nng_sockaddr)) int)]) (lambda (dialer opt addrp)      (f dialer opt addrp))))

  (define nng-listener-set        (let ([f (foreign-procedure "nng_listener_set"        ((& nng_listener) string void* size_t) int)])     (lambda (listener opt val valsz) (f listener opt val valsz))))
  (define nng-listener-set-bool   (let ([f (foreign-procedure "nng_listener_set_bool"   ((& nng_listener) string boolean) int)])          (lambda (listener opt bval)      (f listener opt bval))))
  (define nng-listener-set-int    (let ([f (foreign-procedure "nng_listener_set_int"    ((& nng_listener) string int) int)])              (lambda (listener opt ival)      (f listener opt ival))))
  (define nng-listener-set-size   (let ([f (foreign-procedure "nng_listener_set_size"   ((& nng_listener) string size_t) int)])           (lambda (listener opt z)         (f listener opt z))))
  (define nng-listener-set-uint64 (let ([f (foreign-procedure "nng_listener_set_uint64" ((& nng_listener) string unsigned-64) int)])      (lambda (listener opt u64)       (f listener opt u64))))
  (define nng-listener-set-string (let ([f (foreign-procedure "nng_listener_set_string" ((& nng_listener) string string) int)])           (lambda (listener opt str)       (f listener opt str))))
  (define nng-listener-set-ptr    (let ([f (foreign-procedure "nng_listener_set_ptr"    ((& nng_listener) string void*) int)])            (lambda (listener opt ptr)       (f listener opt ptr))))
  (define nng-listener-set-ms     (let ([f (foreign-procedure "nng_listener_set_ms"     ((& nng_listener) string (& nng_duration)) int)]) (lambda (listener opt dur)       (f listener opt dur))))
  (define nng-listener-set-addr   (let ([f (foreign-procedure "nng_listener_set_addr"   ((& nng_listener) string (* nng_sockaddr)) int)]) (lambda (listener opt addr)      (f listener opt addr))))

  (define nng-listener-get        (let ([f (foreign-procedure "nng_listener_get"        ((& nng_listener) string void* (* size_t)) int)]) (lambda (listener opt val valszp) (f listener opt val valszp))))
  (define nng-listener-get-bool   (let ([f (foreign-procedure "nng_listener_get_bool"   ((& nng_listener) string (* boolean)) int)])      (lambda (listener opt bvalp)      (f listener opt bvalp))))
  (define nng-listener-get-int    (let ([f (foreign-procedure "nng_listener_get_int"    ((& nng_listener) string (* int)) int)])          (lambda (listener opt ivalp)      (f listener opt ivalp))))
  (define nng-listener-get-size   (let ([f (foreign-procedure "nng_listener_get_size"   ((& nng_listener) string (* size_t)) int)])       (lambda (listener opt zp)         (f listener opt zp))))
  (define nng-listener-get-uint64 (let ([f (foreign-procedure "nng_listener_get_uint64" ((& nng_listener) string (* unsigned-64)) int)])  (lambda (listener opt u64p)       (f listener opt u64p))))
  (define nng-listener-get-string (let ([f (foreign-procedure "nng_listener_get_string" ((& nng_listener) string void*) int)])            (lambda (listener opt strp)       (f listener opt strp))))
  (define nng-listener-get-ptr    (let ([f (foreign-procedure "nng_listener_get_ptr"    ((& nng_listener) string void*) int)])            (lambda (listener opt ptr)        (f listener opt ptr))))
  (define nng-listener-get-ms     (let ([f (foreign-procedure "nng_listener_get_ms"     ((& nng_listener) string (* nng_duration)) int)]) (lambda (listener opt durp)       (f listener opt durp))))
  (define nng-listener-get-addr   (let ([f (foreign-procedure "nng_listener_get_addr"   ((& nng_listener) string (* nng_sockaddr)) int)]) (lambda (listener opt addrp)      (f listener opt addrp))))
  
  ; nng_strerror returns a human-readable string associated with the error
  ; code supplied.
  ; NNG_DECL const char *nng_strerror(int);
  (define nng-strerror (let ([f (foreign-procedure "nng_strerror" (int) string)]) (lambda (err) (f err))))

  ; nng_send sends (or arranges to send) the data on the socket.  Note that
  ; this function may (will!) return before any receiver has actually
  ; received the data.  The return value will be zero to indicate that the
  ; socket has accepted the entire data for send, or an errno to indicate
  ; failure.  The flags may include NNG_FLAG_NONBLOCK or NNG_FLAG_ALLOC.
  ; If the flag includes NNG_FLAG_ALLOC, then the function will call
  ; nng_free() on the supplied pointer & size on success. (If the call
  ; fails then the memory is not freed.)
  ; NNG_DECL int nng_send(nng_socket, void *, size_t, int);
  (define nng-send (let ([f (foreign-procedure "nng_send" ((& nng_socket) void* size_t int) int)]) (lambda (socket data size flags) (f socket data size flags))))

  ; nng_recv receives message data into the socket, up to the supplied size.
  ; The actual size of the message data will be written to the value pointed
  ; to by size.  The flags may include NNG_FLAG_NONBLOCK and NNG_FLAG_ALLOC.
  ; If NNG_FLAG_ALLOC is supplied then the library will allocate memory for
  ; the caller.  In that case the pointer to the allocated will be stored
  ; instead of the data itself.  The caller is responsible for freeing the
  ; associated memory with nng_free().
  ; NNG_DECL int nng_recv(nng_socket, void *, size_t *, int);
  (define nng-recv (let ([f (foreign-procedure "nng_recv" ((& nng_socket) void* (* size_t) int) int)]) (lambda (socket data sizep flags) (f socket data sizep flags))))

  ; nng_sendmsg is like nng_send, but offers up a message structure, which
  ; gives the ability to provide more control over the message, including
  ; providing backtrace information.  It also can take a message that was
  ; obtained via nn_recvmsg, allowing for zero copy forwarding.
  ; NNG_DECL int nng_sendmsg(nng_socket, nng_msg *, int);
  (define nng-sendmsg (let ([f (foreign-procedure "nng_sendmsg" ((& nng_socket) (* nng_msg) int) int)]) (lambda (socket msg flags) (f socket msg flags))))

  ; nng_recvmsg is like nng_recv, but is used to obtain a message structure
  ; as well as the data buffer.  This can be used to obtain more information
  ; about where the message came from, access raw headers, etc.  It also
  ; can be passed off directly to nng_sendmsg.
  ; NNG_DECL int nng_recvmsg(nng_socket, nng_msg **, int);
  (define nng-recvmsg (let ([f (foreign-procedure "nng_recvmsg" ((& nng_socket) (* nng_msg) int) int)]) (lambda (socket msgp flags) (f socket msgp flags))))

  ; nng_send_aio sends data on the socket asynchronously.  As with nng_send,
  ; the completion may be executed before the data has actually been delivered,
  ; but only when it is accepted for delivery.  The supplied AIO must have
  ; been initialized, and have an associated message.  The message will be
  ; "owned" by the socket if the operation completes successfully.  Otherwise,
  ; the caller is responsible for freeing it.
  ; NNG_DECL void nng_send_aio(nng_socket, nng_aio *);
  (define nng-send-aio (let ([f (foreign-procedure "nng_send_aio" ((& nng_socket) (* nng_aio)) void)]) (lambda (socket aio) (f socket aio))))

  ; nng_recv_aio receives data on the socket asynchronously.  On a successful
  ; result, the AIO will have an associated message, that can be obtained
  ; with nng_aio_get_msg().  The caller takes ownership of the message at
  ; this point.
  ; NNG_DECL void nng_recv_aio(nng_socket, nng_aio *);
  (define nng-recv-aio (let ([f (foreign-procedure "nng_recv_aio" ((& nng_socket) (* nng_aio)) void)]) (lambda (socket aio) (f socket aio))))

  ; Context support.  User contexts are not supported by all protocols,
  ; but for those that do, they give a way to create multiple contexts
  ; on a single socket, each of which runs the protocol's state machinery
  ; independently, offering a way to achieve concurrent protocol support
  ; without resorting to raw mode sockets.  See the protocol specific
  ; documentation for further details.  (Note that at this time, only
  ; asynchronous send/recv are supported for contexts, but its easy enough
  ; to make synchronous versions with nng_aio_wait().)  Note that nng_close
  ; of the parent socket will *block* as long as any contexts are open.

  ; nng_ctx_open creates a context.  This returns NNG_ENOTSUP if the
  ; protocol implementation does not support separate contexts.
  ; NNG_DECL int nng_ctx_open(nng_ctx *, nng_socket);
  (define nng-ctx-open (let ([f (foreign-procedure "nng_ctx_open" ((* nng_ctx) (& nng_socket)) void)]) (lambda (ctx socket) (f ctx socket))))

  ; nng_ctx_close closes the context.
  ; NNG_DECL int nng_ctx_close(nng_ctx);
  (define nng-ctx-close (let ([f (foreign-procedure "nng_ctx_close" ((& nng_ctx)) void)]) (lambda (ctx) (f ctx))))

  ; nng_ctx_id returns the numeric id for the context; this will be
  ; a positive value for a valid context, or < 0 for an invalid context.
  ; A valid context is not necessarily an *open* context.
  ; NNG_DECL int nng_ctx_id(nng_ctx);
  (define nng-ctx-id (let ([f (foreign-procedure "nng_ctx_id" ((& nng_ctx)) void)]) (lambda (ctx) (f ctx))))

  ; nng_ctx_recv receives asynchronously.  It works like nng_recv_aio, but
  ; uses a local context instead of the socket global context.
  ; NNG_DECL void nng_ctx_recv(nng_ctx, nng_aio *);
  (define nng-ctx-recv (let ([f (foreign-procedure "nng_ctx_recv" ((& nng_ctx) (* nng_aio)) void)]) (lambda (ctx aio) (f ctx aio))))

  ; nng_ctx_recvmsg allows for receiving a message synchronously using
  ; a context.  It has the same semantics as nng_recvmsg, but operates
  ; on a context instead of a socket.
  ; NNG_DECL int nng_ctx_recvmsg(nng_ctx, nng_msg **, int);
  (define nng-ctx-recvmsg (let ([f (foreign-procedure "nng_ctx_recvmsg" ((& nng_ctx) (* nng_msg) int) int)]) (lambda (ctx msgp flags) (f ctx msgp flags))))

  ; nng_ctx_send sends asynchronously. It works like nng_send_aio, but
  ; uses a local context instead of the socket global context.
  ; NNG_DECL void nng_ctx_send(nng_ctx, nng_aio *);
  (define nng-ctx-send (let ([f (foreign-procedure "nng_ctx_send" ((& nng_ctx) (* nng_aio)) void)]) (lambda (ctx aio) (f ctx aio))))

  ; nng_ctx_sendmsg is allows for sending a message synchronously using
  ; a context.  It has the same semantics as nng_sendmsg, but operates
  ; on a context instead of a socket.
  ; NNG_DECL int nng_ctx_sendmsg(nng_ctx, nng_msg *, int);
  (define nng-ctx-sendmsg (let ([f (foreign-procedure "nng_ctx_sendmsg" ((& nng_ctx) (* nng_msg) int) int)]) (lambda (ctx msg flags) (f ctx msg flags))))

  (define nng-ctx-set        (let ([f (foreign-procedure "nng_ctx_set"        ((& nng_ctx) string void* size_t) int)])     (lambda (ctx opt val valsz) (f ctx opt val valsz))))
  (define nng-ctx-set-bool   (let ([f (foreign-procedure "nng_ctx_set_bool"   ((& nng_ctx) string boolean) int)])          (lambda (ctx opt bval)      (f ctx opt bval))))
  (define nng-ctx-set-int    (let ([f (foreign-procedure "nng_ctx_set_int"    ((& nng_ctx) string int) int)])              (lambda (ctx opt ival)      (f ctx opt ival))))
  (define nng-ctx-set-size   (let ([f (foreign-procedure "nng_ctx_set_size"   ((& nng_ctx) string size_t) int)])           (lambda (ctx opt z)         (f ctx opt z))))
  (define nng-ctx-set-uint64 (let ([f (foreign-procedure "nng_ctx_set_uint64" ((& nng_ctx) string unsigned-64) int)])      (lambda (ctx opt u64)       (f ctx opt u64))))
  (define nng-ctx-set-string (let ([f (foreign-procedure "nng_ctx_set_string" ((& nng_ctx) string string) int)])           (lambda (ctx opt str)       (f ctx opt str))))
  (define nng-ctx-set-ptr    (let ([f (foreign-procedure "nng_ctx_set_ptr"    ((& nng_ctx) string void*) int)])            (lambda (ctx opt ptr)       (f ctx opt ptr))))
  (define nng-ctx-set-ms     (let ([f (foreign-procedure "nng_ctx_set_ms"     ((& nng_ctx) string (& nng_duration)) int)]) (lambda (ctx opt dur)       (f ctx opt dur))))
  (define nng-ctx-set-addr   (let ([f (foreign-procedure "nng_ctx_set_addr"   ((& nng_ctx) string (* nng_sockaddr)) int)]) (lambda (ctx opt addr)      (f ctx opt addr))))

  (define nng-ctx-get        (let ([f (foreign-procedure "nng_ctx_get"        ((& nng_ctx) string void* (* size_t)) int)]) (lambda (ctx opt val valszp) (f ctx opt val valszp))))
  (define nng-ctx-get-bool   (let ([f (foreign-procedure "nng_ctx_get_bool"   ((& nng_ctx) string (* boolean)) int)])      (lambda (ctx opt bvalp)      (f ctx opt bvalp))))
  (define nng-ctx-get-int    (let ([f (foreign-procedure "nng_ctx_get_int"    ((& nng_ctx) string (* int)) int)])          (lambda (ctx opt ivalp)      (f ctx opt ivalp))))
  (define nng-ctx-get-size   (let ([f (foreign-procedure "nng_ctx_get_size"   ((& nng_ctx) string (* size_t)) int)])       (lambda (ctx opt zp)         (f ctx opt zp))))
  (define nng-ctx-get-uint64 (let ([f (foreign-procedure "nng_ctx_get_uint64" ((& nng_ctx) string (* unsigned-64)) int)])  (lambda (ctx opt u64p)       (f ctx opt u64p))))
  (define nng-ctx-get-string (let ([f (foreign-procedure "nng_ctx_get_string" ((& nng_ctx) string void*) int)])            (lambda (ctx opt strp)       (f ctx opt strp))))
  (define nng-ctx-get-ptr    (let ([f (foreign-procedure "nng_ctx_get_ptr"    ((& nng_ctx) string void*) int)])            (lambda (ctx opt ptr)        (f ctx opt ptr))))
  (define nng-ctx-get-ms     (let ([f (foreign-procedure "nng_ctx_get_ms"     ((& nng_ctx) string (* nng_duration)) int)]) (lambda (ctx opt durp)       (f ctx opt durp))))
  (define nng-ctx-get-addr   (let ([f (foreign-procedure "nng_ctx_get_addr"   ((& nng_ctx) string (* nng_sockaddr)) int)]) (lambda (ctx opt addrp)      (f ctx opt addrp))))
  
  ; nng_alloc is used to allocate memory.  It's intended purpose is for
  ; allocating memory suitable for message buffers with nng_send().
  ; Applications that need memory for other purposes should use their platform
  ; specific API.
  ; NNG_DECL void *nng_alloc(size_t);
  (define nng-alloc (let ([f (foreign-procedure "nng_alloc" (size_t) void*)]) (lambda (size) (f size))))

  ; nng_free is used to free memory allocated with nng_alloc, which includes
  ; memory allocated by nng_recv() when the NNG_FLAG_ALLOC message is supplied.
  ; As the application is required to keep track of the size of memory, this
  ; is probably less convenient for general uses than the C library malloc and
  ; calloc.
  ; NNG_DECL void nng_free(void *, size_t);
  (define nng-free (let ([f (foreign-procedure "nng_free" (void* size_t) void)]) (lambda (ptr size) (f ptr size))))

  ; nng_strdup duplicates the source string, using nng_alloc. The result
  ; should be freed with nng_strfree (or nng_free(strlen(s)+1)).
  ; NNG_DECL char *nng_strdup(const char *);
  (define nng-strdup (let ([f (foreign-procedure "nng_strdup" (string) string)]) (lambda (src) (f src))))

  ; nng_strfree is equivalent to nng_free(strlen(s)+1).
  ; NNG_DECL void nng_strfree(char *);
  (define nng-strfree (let ([f (foreign-procedure "nng_strfree" (string) void)]) (lambda (str) (f str))))



  ;; Async IO API.  AIO structures can be thought of as "handles" to
  ;; support asynchronous operations.  They contain the completion callback, and
  ;; a pointer to consumer data.  This is similar to how overlapped I/O
  ;; works in Windows, when used with a completion callback.
  ;;
  ;; AIO structures can carry up to 4 distinct input values, and up to
  ;; 4 distinct output values, and up to 4 distinct "private state" values.
  ;; The meaning of the inputs and the outputs are determined by the
  ;; I/O functions being called.

  ; nng_aio_alloc allocates a new AIO, and associated the completion
  ; callback and its opaque argument.  If NULL is supplied for the
  ; callback, then the caller must use nng_aio_wait() to wait for the
  ; operation to complete.  If the completion callback is not NULL, then
  ; when a submitted operation completes (or is canceled or fails) the
  ; callback will be executed, generally in a different thread, with no
  ; locks held.
  ; NNG_DECL int nng_aio_alloc(nng_aio **, void (*)(void *), void *);
  (define-callback make-nng-aio-alloc-cb (void*) void)
  (define nng-aio-alloc (let ([f (foreign-procedure "nng_aio_alloc" ((* nng_aio*) void* void*) int)]) (lambda (aiop cb arg) (f aiop cb arg))))

  ; nng_aio_free frees the AIO and any associated resources.
  ; It *must not* be in use at the time it is freed.
  ; NNG_DECL void nng_aio_free(nng_aio *);
  (define nng-aio-free (let ([f (foreign-procedure "nng_aio_free" ((* nng_aio)) void)]) (lambda (aio) (f aio))))

  ; nng_aio_reap is like nng_aio_free, but calls it from a background
  ; reaper thread.  This can be useful to free aio objects from aio
  ; callbacks (e.g. when the result of the callback is to discard
  ; the object in question.)  The aio object must be in further use
  ; when this is called.
  ; NNG_DECL void nng_aio_reap(nng_aio *);
  (define nng-aio-reap (let ([f (foreign-procedure "nng_aio_reap" ((* nng_aio)) void)]) (lambda (aio) (f aio))))

  ; nng_aio_stop stops any outstanding operation, and waits for the
  ; AIO to be free, including for the callback to have completed
  ; execution.  Therefore, the caller must NOT hold any locks that
  ; are acquired in the callback, or deadlock will occur.
  ; NNG_DECL void nng_aio_stop(nng_aio *);
  (define nng-aio-stop (let ([f (foreign-procedure "nng_aio_stop" ((* nng_aio)) void)]) (lambda (aio) (f aio))))

  ; nng_aio_result returns the status/result of the operation. This
  ; will be zero on successful completion, or an nng error code on
  ; failure.
  ; NNG_DECL int nng_aio_result(nng_aio *);
  (define nng-aio-result (let ([f (foreign-procedure "nng_aio_result" ((* nng_aio)) int)]) (lambda (aio) (f aio))))

  ; nng_aio_count returns the number of bytes transferred for certain
  ; I/O operations.  This is meaningless for other operations (e.g.
  ; DNS lookups or TCP connection setup).
  ; NNG_DECL size_t nng_aio_count(nng_aio *);
  (define nng-aio-count (let ([f (foreign-procedure "nng_aio_count" ((* nng_aio)) size_t)]) (lambda (aio) (f aio))))

  ; nng_aio_cancel attempts to cancel any in-progress I/O operation.
  ; The AIO callback will still be executed, but if the cancellation is
  ; successful then the status will be NNG_ECANCELED.
  ; NNG_DECL void nng_aio_cancel(nng_aio *);
  (define nng-aio-cancel (let ([f (foreign-procedure "nng_aio_cancel" ((* nng_aio)) void)]) (lambda (aio) (f aio))))

  ; nng_aio_abort is like nng_aio_cancel, but allows for a different
  ; error result to be returned.
  ; NNG_DECL void nng_aio_abort(nng_aio *, int);
  (define nng-aio-abort (let ([f (foreign-procedure "nng_aio_abort" ((* nng_aio) int) void)]) (lambda (aio err) (f aio err))))

  ; nng_aio_wait waits synchronously for any pending operation to complete.
  ; It also waits for the callback to have completed execution.  Therefore,
  ; the caller of this function must not hold any locks acquired by the
  ; callback or deadlock may occur.
  ; NNG_DECL void nng_aio_wait(nng_aio *);
  (define nng-aio-wait (let ([f (foreign-procedure "nng_aio_wait" ((* nng_aio)) void)]) (lambda (aio) (f aio))))

  ; nng_aio_busy returns true if the aio is still busy processing the
  ; operation, or executing associated completion functions.  Note that
  ; if the completion function schedules a new operation using the aio,
  ; then this function will continue to return true.
  ; NNG_DECL bool nng_aio_busy(nng_aio *);
  (define nng-aio-busy (let ([f (foreign-procedure "nng_aio_busy" ((* nng_aio)) boolean)]) (lambda (aio) (f aio))))

  ; nng_aio_set_msg sets the message structure to use for asynchronous
  ; message send operations.
  ; NNG_DECL void nng_aio_set_msg(nng_aio *, nng_msg *);
  (define nng-aio-set-msg (let ([f (foreign-procedure "nng_aio_set_msg" ((* nng_aio) (* nng_msg)) void)]) (lambda (aio msg) (f aio msg))))

  ; nng_aio_get_msg returns the message structure associated with a completed
  ; receive operation.
  ; NNG_DECL nng_msg *nng_aio_get_msg(nng_aio *);
  (define nng-aio-get-msg (let ([f (foreign-procedure "nng_aio_get_msg" ((* nng_aio)) (* nng_msg))]) (lambda (aio) (f aio))))

  ; nng_aio_set_input sets an input parameter at the given index.
  ; NNG_DECL int nng_aio_set_input(nng_aio *, unsigned, void *);
  (define nng-aio-set-input (let ([f (foreign-procedure "nng_aio_set_input" ((* nng_aio) unsigned-int void*) int)]) (lambda (aio index param) (f aio index param))))

  ; nng_aio_get_input retrieves the input parameter at the given index.
  ; NNG_DECL void *nng_aio_get_input(nng_aio *, unsigned);
  (define nng-aio-get-input (let ([f (foreign-procedure "nng_aio_get_input" ((* nng_aio) unsigned-int) void*)]) (lambda (aio index) (f aio index))))

  ; nng_aio_set_output sets an output result at the given index.
  ; NNG_DECL int nng_aio_set_output(nng_aio *, unsigned, void *);
  (define nng-aio-set-output (let ([f (foreign-procedure "nng_aio_set_output" ((* nng_aio) unsigned-int void*) int)]) (lambda (aio index result) (f aio index result))))

  ; nng_aio_get_output retrieves the output result at the given index.
  ; NNG_DECL void *nng_aio_get_output(nng_aio *, unsigned);
  (define nng-aio-get-output (let ([f (foreign-procedure "nng_aio_get_output" ((* nng_aio) unsigned-int) void*)]) (lambda (aio index) (f aio index))))

  ; nng_aio_set_timeout sets a timeout on the AIO.  This should be called for
  ; operations that should time out after a period.  The timeout should be
  ; either a positive number of milliseconds, or NNG_DURATION_INFINITE to
  ; indicate that the operation has no timeout.  A poll may be done by
  ; specifying NNG_DURATION_ZERO.  The value NNG_DURATION_DEFAULT indicates
  ; that any socket specific timeout should be used.
  ; NNG_DECL void nng_aio_set_timeout(nng_aio *, nng_duration);
  (define nng-aio-set-timeout (let ([f (foreign-procedure "nng_aio_set_timeout" ((* nng_aio) (& nng_duration)) void)]) (lambda (aio timeout) (f aio timeout))))

  ; nng_aio_set_expire is like nng_aio_set_timeout, except it sets an absolute
  ; expiration time.  This is useful when chaining actions on a single aio
  ; as part of a state machine.
  ; NNG_DECL void nng_aio_set_expire(nng_aio *, nng_time);
  (define nng-aio-set-expire (let ([f (foreign-procedure "nng_aio_set_expire" ((* nng_aio) (& nng_time)) void)]) (lambda (aio expiration) (f aio expiration))))

  ; nng_aio_set_iov sets a scatter/gather vector on the aio.  The iov array
  ; itself is copied. Data members (the memory regions referenced) *may* be
  ; copied as well, depending on the operation.  This operation is guaranteed
  ; to succeed if n <= 4, otherwise it may fail due to NNG_ENOMEM.
  ; NNG_DECL int nng_aio_set_iov(nng_aio *, unsigned, const nng_iov *);
  (define nng-aio-set-iov (let ([f (foreign-procedure "nng_aio_set_iov" ((* nng_aio) unsigned-int (* nng_iov)) int)]) (lambda (aio niov iov) (f aio niov iov))))

  ; nng_aio_begin is called by the provider to mark the operation as
  ; beginning.  If it returns false, then the provider must take no
  ; further action on the aio.
  ; NNG_DECL bool nng_aio_begin(nng_aio *);
  (define nng-aio-begin (let ([f (foreign-procedure "nng_aio_begin" ((* nng_aio)) boolean)]) (lambda (aio) (f aio))))

  ; nng_aio_finish is used to "finish" an asynchronous operation.
  ; It should only be called by "providers" (such as HTTP server API users).
  ; The argument is the value that nng_aio_result() should return.
  ; IMPORTANT: Callers must ensure that this is called EXACTLY ONCE on any
  ; given aio.
  ; NNG_DECL void nng_aio_finish(nng_aio *, int);
  (define nng-aio-finish (let ([f (foreign-procedure "nng_aio_finish" ((* nng_aio) int) void)]) (lambda (aio err) (f aio err))))

  ; nng_aio_defer is used to register a cancellation routine, and indicate
  ; that the operation will be completed asynchronously.  It must only be
  ; called once per operation on an aio, and must only be called by providers.
  ; If the operation is canceled by the consumer, the cancellation callback
  ; will be called.  The provider *must* still ensure that the nng_aio_finish()
  ; function is called EXACTLY ONCE.  If the operation cannot be canceled
  ; for any reason, the cancellation callback should do nothing.  The
  ; final argument is passed to the cancelfn.  The final argument of the
  ; cancellation function is the error number (will not be zero) corresponding
  ; to the reason for cancellation, e.g. NNG_ETIMEDOUT or NNG_ECANCELED.
  ; typedef void (*nng_aio_cancelfn)(nng_aio *, void *, int);
  ; NNG_DECL void nng_aio_defer(nng_aio *, nng_aio_cancelfn, void *);
  (define-callback make-nng-aio-cancelfn ((* nng_aio) void* int) void)  ; typedef void (*nng_aio_cancelfn)(nng_aio *aio, void *arg, int err);
  (define nng-aio-defer (let ([f (foreign-procedure "nng_aio_defer" ((* nng_aio) void* void*) void)]) (lambda (aio fn arg) (f aio fn arg))))

  ; nng_aio_sleep does a "sleeping" operation, basically does nothing
  ; but wait for the specified number of milliseconds to expire, then
  ; calls the callback.  This returns 0, rather than NNG_ETIMEDOUT.
  ; NNG_DECL void nng_sleep_aio(nng_duration, nng_aio *);
  (define nng-sleep-aio (let ([f (foreign-procedure "nng_sleep_aio" ((& nng_duration) (* nng_aio)) void)]) (lambda (msec aio) (f msec aio))))


  ;; Message API
  (define nng_msg_alloc             (let ([f (foreign-procedure "nng_msg_alloc"             ((* nng_msg) size_t) int)])                (lambda (msgp size)    (f msgp size))))
  (define nng_msg_free              (let ([f (foreign-procedure "nng_msg_free"              ((* nng_msg)) void)])                      (lambda (msg)          (f msg))))
  (define nng_msg_realloc           (let ([f (foreign-procedure "nng_msg_realloc"           ((* nng_msg) size_t) int)])                (lambda (msg size)     (f msg size))))
  (define nng_msg_reserve           (let ([f (foreign-procedure "nng_msg_reserve"           ((* nng_msg) size_t) int)])                (lambda (msg capacity) (f msg capacity))))
  (define nng_msg_capacity          (let ([f (foreign-procedure "nng_msg_capacity"          ((* nng_msg)) size_t)])                    (lambda (msg)          (f msg))))
  (define nng_msg_header            (let ([f (foreign-procedure "nng_msg_header"            ((* nng_msg)) void*)])                     (lambda (msg)          (f msg))))
  (define nng_msg_header_len        (let ([f (foreign-procedure "nng_msg_header_len"        ((* nng_msg)) size_t)])                    (lambda (msg)          (f msg))))
  (define nng_msg_body              (let ([f (foreign-procedure "nng_msg_body"              ((* nng_msg)) void*)])                     (lambda (msg)          (f msg))))
  (define nng_msg_len               (let ([f (foreign-procedure "nng_msg_len"               ((* nng_msg)) size_t)])                    (lambda (msg)          (f msg))))
  (define nng-msg-append            (let ([f (foreign-procedure "nng_msg_append"            ((* nng_msg) void* size_t) int)])          (lambda (msg val size) (f msg val size))))
  (define nng-msg-insert            (let ([f (foreign-procedure "nng_msg_insert"            ((* nng_msg) void* size_t) int)])          (lambda (msg val size) (f msg val size))))
  (define nng-msg-trim              (let ([f (foreign-procedure "nng_msg_trim"              ((* nng_msg) size_t) int)])                (lambda (msg size)     (f msg size))))
  (define nng-msg-chop              (let ([f (foreign-procedure "nng_msg_chop"              ((* nng_msg) size_t) int)])                (lambda (msg size)     (f msg size))))
  (define nng-msg-header-append     (let ([f (foreign-procedure "nng_msg_header_append"     ((* nng_msg) void* size_t) int)])          (lambda (msg val size) (f msg val size))))
  (define nng-msg-header-insert     (let ([f (foreign-procedure "nng_msg_header_insert"     ((* nng_msg) void* size_t) int)])          (lambda (msg val size) (f msg val size))))
  (define nng-msg-header-trim       (let ([f (foreign-procedure "nng_msg_header_trim"       ((* nng_msg) size_t) int)])                (lambda (msg size)     (f msg size))))
  (define nng-msg-header-chop       (let ([f (foreign-procedure "nng_msg_header_chop"       ((* nng_msg) size_t) int)])                (lambda (msg size)     (f msg size))))
  (define nng-msg-header-append-u16 (let ([f (foreign-procedure "nng_msg_header_append_u16" ((* nng_msg) unsigned-16) int)])           (lambda (msg val16)    (f msg val16))))
  (define nng-msg-header-append-u32 (let ([f (foreign-procedure "nng_msg_header_append_u32" ((* nng_msg) unsigned-32) int)])           (lambda (msg val32)    (f msg val32))))
  (define nng-msg-header-append-u64 (let ([f (foreign-procedure "nng_msg_header_append_u64" ((* nng_msg) unsigned-64) int)])           (lambda (msg val64)    (f msg val64))))
  (define nng-msg-header-insert-u16 (let ([f (foreign-procedure "nng_msg_header_insert_u16" ((* nng_msg) unsigned-16) int)])           (lambda (msg val16)    (f msg val16))))
  (define nng-msg-header-insert-u32 (let ([f (foreign-procedure "nng_msg_header_insert_u32" ((* nng_msg) unsigned-32) int)])           (lambda (msg val32)    (f msg val32))))
  (define nng-msg-header-insert-u64 (let ([f (foreign-procedure "nng_msg_header_insert_u64" ((* nng_msg) unsigned-64) int)])           (lambda (msg val64)    (f msg val64))))
  (define nng-msg-header-chop-u16   (let ([f (foreign-procedure "nng_msg_header_chop_u16"   ((* nng_msg) (* unsigned-16)) int)])       (lambda (msg val16)    (f msg val16))))
  (define nng-msg-header-chop-u32   (let ([f (foreign-procedure "nng_msg_header_chop_u32"   ((* nng_msg) (* unsigned-32)) int)])       (lambda (msg val32)    (f msg val32))))
  (define nng-msg-header-chop-u64   (let ([f (foreign-procedure "nng_msg_header_chop_u64"   ((* nng_msg) (* unsigned-64)) int)])       (lambda (msg val64)    (f msg val64))))
  (define nng-msg-header-trim-u16   (let ([f (foreign-procedure "nng_msg_header_trim_u16"   ((* nng_msg) (* unsigned-16)) int)])       (lambda (msg val16)    (f msg val16))))
  (define nng-msg-header-trim-u32   (let ([f (foreign-procedure "nng_msg_header_trim_u32"   ((* nng_msg) (* unsigned-32)) int)])       (lambda (msg val32)    (f msg val32))))
  (define nng-msg-header-trim-u64   (let ([f (foreign-procedure "nng_msg_header_trim_u64"   ((* nng_msg) (* unsigned-64)) int)])       (lambda (msg val64)    (f msg val64))))
  (define nng-msg-append-u16        (let ([f (foreign-procedure "nng_msg_append_u16"        ((* nng_msg) unsigned-16) int)])           (lambda (msg val16)    (f msg val16))))
  (define nng-msg-append-u32        (let ([f (foreign-procedure "nng_msg_append_u32"        ((* nng_msg) unsigned-32) int)])           (lambda (msg val32)    (f msg val32))))
  (define nng-msg-append-u64        (let ([f (foreign-procedure "nng_msg_append_u64"        ((* nng_msg) unsigned-64) int)])           (lambda (msg val64)    (f msg val64))))
  (define nng-msg-insert-u16        (let ([f (foreign-procedure "nng_msg_insert_u16"        ((* nng_msg) unsigned-16) int)])           (lambda (msg val16)    (f msg val16))))
  (define nng-msg-insert-u32        (let ([f (foreign-procedure "nng_msg_insert_u32"        ((* nng_msg) unsigned-32) int)])           (lambda (msg val32)    (f msg val32))))
  (define nng-msg-insert-u64        (let ([f (foreign-procedure "nng_msg_insert_u64"        ((* nng_msg) unsigned-64) int)])           (lambda (msg val64)    (f msg val64))))
  (define nng-msg-chop-u16          (let ([f (foreign-procedure "nng_msg_chop_u16"          ((* nng_msg) (* unsigned-16)) int)])       (lambda (msg val16)    (f msg val16))))
  (define nng-msg-chop-u32          (let ([f (foreign-procedure "nng_msg_chop_u32"          ((* nng_msg) (* unsigned-32)) int)])       (lambda (msg val32)    (f msg val32))))
  (define nng-msg-chop-u64          (let ([f (foreign-procedure "nng_msg_chop_u64"          ((* nng_msg) (* unsigned-64)) int)])       (lambda (msg val64)    (f msg val64))))
  (define nng-msg-trim-u16          (let ([f (foreign-procedure "nng_msg_trim_u16"          ((* nng_msg) (* unsigned-16)) int)])       (lambda (msg val16)    (f msg val16))))
  (define nng-msg-trim-u32          (let ([f (foreign-procedure "nng_msg_trim_u32"          ((* nng_msg) (* unsigned-32)) int)])       (lambda (msg val32)    (f msg val32))))
  (define nng-msg-trim-u64          (let ([f (foreign-procedure "nng_msg_trim_u64"          ((* nng_msg) (* unsigned-64)) int)])       (lambda (msg val64)    (f msg val64))))
  (define nng-msg-dup               (let ([f (foreign-procedure "nng_msg_dup"               ((* nng_msg) (* nng_msg)) int)])           (lambda (dup orig)     (f dup orig))))
  (define nng-msg-clear             (let ([f (foreign-procedure "nng_msg_clear"             ((* nng_msg)) void)])                      (lambda (msg)          (f msg))))
  (define nng-msg-header-clear      (let ([f (foreign-procedure "nng_msg_header_clear"      ((* nng_msg)) void)])                      (lambda (msg)          (f msg))))
  (define nng-msg-set-pipe          (let ([f (foreign-procedure "nng_msg_set_pipe"          ((* nng_msg) (& nng_pipe)) void)])         (lambda (msg pipe)     (f msg pipe))))
  ; (define nng-msg-get-pipe          (let ([f (foreign-procedure "nng_msg_get_pipe"          ((* nng_msg)) (& nng_pipe))])              (lambda (msg)          (f msg))))
  ;; (& ftype-name): The result is interpreted as a foreign object whose structure is described by the ftype identified by ftype-name, 
  ;; where the foreign procedure returns a ftype-name result, 
  ;; but the caller must provide an extra (* ftype-name) argument before all other arguments to receive the result.
  ;; An unspecified Scheme object is returned when the foreign procedure is called, 
  ;; since the result is instead written into storage referenced by the extra argument. The ftype-name cannot refer to an array type.
  (define nng-msg-get-pipe
    (let ([f (foreign-procedure "nng_msg_get_pipe" ((* nng_msg)) (& nng_pipe))])
      (case-lambda
        [(msg)
         (let ([fptr (make-ftype-pointer nng_pipe (foreign-alloc (ftype-sizeof nng_pipe)))])
           (f fptr msg)
           fptr)]
        [(fptr msg) (f fptr msg) fptr])))

  ; Pipe API. Generally pipes are only "observable" to applications, but
  ; we do permit an application to close a pipe. This can be useful, for
  ; example during a connection notification, to disconnect a pipe that
  ; is associated with an invalid or untrusted remote peer.
  (define nng-pipe-get        (let ([f (foreign-procedure "nng_pipe_get"        ((& nng_pipe) string void* (* size_t)) int)]) (lambda (pipe opt val valszp) (f pipe opt val valszp))))
  (define nng-pipe-get-bool   (let ([f (foreign-procedure "nng_pipe_get_bool"   ((& nng_pipe) string (* boolean)) int)])      (lambda (pipe opt bvalp)      (f pipe opt bvalp))))
  (define nng-pipe-get-int    (let ([f (foreign-procedure "nng_pipe_get_int"    ((& nng_pipe) string (* int)) int)])          (lambda (pipe opt ivalp)      (f pipe opt ivalp))))
  (define nng-pipe-get-ms     (let ([f (foreign-procedure "nng_pipe_get_ms"     ((& nng_pipe) string (* nng_duration)) int)]) (lambda (pipe opt durp)       (f pipe opt durp))))
  (define nng-pipe-get-size   (let ([f (foreign-procedure "nng_pipe_get_size"   ((& nng_pipe) string (* size_t)) int)])       (lambda (pipe opt zp)         (f pipe opt zp))))
  (define nng-pipe-get-uint64 (let ([f (foreign-procedure "nng_pipe_get_uint64" ((& nng_pipe) string (* unsigned-64)) int)])  (lambda (pipe opt u64p)       (f pipe opt u64p))))
  (define nng-pipe-get-string (let ([f (foreign-procedure "nng_pipe_get_string" ((& nng_pipe) string void*) int)])            (lambda (pipe opt strp)       (f pipe opt strp))))
  (define nng-pipe-get-ptr    (let ([f (foreign-procedure "nng_pipe_get_ptr"    ((& nng_pipe) string void*) int)])            (lambda (pipe opt ptr)        (f pipe opt ptr))))
  (define nng-pipe-get-addr   (let ([f (foreign-procedure "nng_pipe_get_addr"   ((& nng_pipe) string (* nng_sockaddr)) int)]) (lambda (pipe opt sap)        (f pipe opt sap))))

  (define nng-pipe-close    (let ([f (foreign-procedure "nng_pipe_close"    ((& nng_pipe)) int)])              (lambda (pipe) (f pipe))))
  (define nng-pipe-id       (let ([f (foreign-procedure "nng_pipe_id"       ((& nng_pipe)) int)])              (lambda (pipe) (f pipe))))
  ; (define nng-pipe-socket   (let ([f (foreign-procedure "nng_pipe_socket"   ((& nng_pipe)) (& nng_socket))])   (lambda (pipe) (f pipe))))
  ; (define nng-pipe-dialer   (let ([f (foreign-procedure "nng_pipe_dialer"   ((& nng_pipe)) (& nng_dialer))])   (lambda (pipe) (f pipe))))
  ; (define nng-pipe-listener (let ([f (foreign-procedure "nng_pipe_listener" ((& nng_pipe)) (& nng_listener))]) (lambda (pipe) (f pipe))))
  (define nng-pipe-socket
    (let ([f (foreign-procedure "nng_pipe_socket" ((& nng_pipe)) (& nng_socket))])
      (case-lambda
        [(pipe)
         (let ([fptr (make-ftype-pointer nng_socket (foreign-alloc (ftype-sizeof nng_socket)))])
           (f fptr pipe)
           fptr)]
        [(fptr pipe) (f fptr pipe) fptr])))
  (define nng-pipe-dialer
    (let ([f (foreign-procedure "nng_pipe_dialer" ((& nng_pipe)) (& nng_dialer))])
      (case-lambda
        [(pipe)
         (let ([fptr (make-ftype-pointer nng_dialer (foreign-alloc (ftype-sizeof nng_dialer)))])
           (f fptr pipe)
           fptr)]
        [(fptr pipe) (f fptr pipe) fptr])))
  (define nng-pipe-listener
    (let ([f (foreign-procedure "nng_pipe_listener" ((& nng_pipe)) (& nng_listener))])
      (case-lambda
        [(pipe)
         (let ([fptr (make-ftype-pointer nng_listener (foreign-alloc (ftype-sizeof nng_listener)))])
           (f fptr pipe)
           fptr)]
        [(fptr pipe) (f fptr pipe) fptr])))
  ; Flags.
  (define NNG_FLAG_ALLOC 1)    ; Recv to allocate receive buffer
  (define NNG_FLAG_NONBLOCK 2) ; Non-blocking operations

  ; Options.
  (define NNG_OPT_SOCKNAME "socket-name")
  (define NNG_OPT_RAW "raw")
  (define NNG_OPT_PROTO "protocol")
  (define NNG_OPT_PROTONAME "protocol-name")
  (define NNG_OPT_PEER "peer")
  (define NNG_OPT_PEERNAME "peer-name")
  (define NNG_OPT_RECVBUF "recv-buffer")
  (define NNG_OPT_SENDBUF "send-buffer")
  (define NNG_OPT_RECVFD "recv-fd")
  (define NNG_OPT_SENDFD "send-fd")
  (define NNG_OPT_RECVTIMEO "recv-timeout")
  (define NNG_OPT_SENDTIMEO "send-timeout")
  (define NNG_OPT_LOCADDR "local-address")
  (define NNG_OPT_REMADDR "remote-address")
  (define NNG_OPT_URL "url")
  (define NNG_OPT_MAXTTL "ttl-max")
  (define NNG_OPT_RECVMAXSZ "recv-size-max")
  (define NNG_OPT_RECONNMINT "reconnect-time-min")
  (define NNG_OPT_RECONNMAXT "reconnect-time-max")

  ; TLS options are only used when the underlying transport supports TLS.

  ; NNG_OPT_TLS_CONFIG is a pointer to a nng_tls_config object.  Generally
  ; this can be used with endpoints, although once an endpoint is started, or
  ; once a configuration is used, the value becomes read-only. Note that
  ; when configuring the object, a hold is placed on the TLS configuration,
  ; using a reference count.  When retrieving the object, no such hold is
  ; placed, and so the caller must take care not to use the associated object
  ; after the endpoint it is associated with is closed.
  (define NNG_OPT_TLS_CONFIG "tls-config")

  ; NNG_OPT_TLS_AUTH_MODE is a write-only integer (int) option that specifies
  ; whether peer authentication is needed.  The option can take one of the
  ; values of NNG_TLS_AUTH_MODE_NONE, NNG_TLS_AUTH_MODE_OPTIONAL, or
  ; NNG_TLS_AUTH_MODE_REQUIRED.  The default is typically NNG_TLS_AUTH_MODE_NONE
  ; for listeners, and NNG_TLS_AUTH_MODE_REQUIRED for dialers. If set to
  ; REQUIRED, then connections will be rejected if the peer cannot be verified.
  ; If set to OPTIONAL, then a verification step takes place, but the connection
  ; is still permitted.  (The result can be checked with NNG_OPT_TLS_VERIFIED).
  (define NNG_OPT_TLS_AUTH_MODE "tls-authmode")

  ; NNG_OPT_TLS_CERT_KEY_FILE names a single file that contains a certificate
  ; and key identifying the endpoint.  This is a write-only value.  This can be
  ; set multiple times for different keys/certs corresponding to
  ; different algorithms on listeners, whereas dialers only support one.  The
  ; file must contain both cert and key as PEM blocks, and the key must
  ; not be encrypted.  (If more flexibility is needed, use the TLS configuration
  ; directly, via NNG_OPT_TLS_CONFIG.)
  (define NNG_OPT_TLS_CERT_KEY_FILE "tls-cert-key-file")

  ; NNG_OPT_TLS_CA_FILE names a single file that contains certificate(s) for a
  ; CA, and optionally CRLs, which are used to validate the peer's certificate.
  ; This is a write-only value, but multiple CAs can be loaded by setting this
  ; multiple times.
  (define NNG_OPT_TLS_CA_FILE "tls-ca-file")

  ; NNG_OPT_TLS_SERVER_NAME is a write-only string that can typically be
  ; set on dialers to check the CN of the server for a match.  This
  ; can also affect SNI (server name indication).  It usually has no effect
  ; on listeners.
  (define NNG_OPT_TLS_SERVER_NAME "tls-server-name")

  ; NNG_OPT_TLS_VERIFIED returns a boolean indicating whether the peer has
  ; been verified (true) or not (false). Typically, this is read-only, and
  ; only available for pipes. This option may return incorrect results if
  ; peer authentication is disabled with `NNG_TLS_AUTH_MODE_NONE`.
  (define NNG_OPT_TLS_VERIFIED "tls-verified")

  ; NNG_OPT_TLS_PEER_CN returns the string with the common name
  ; of the peer certificate. Typically, this is read-only and
  ; only available for pipes. This option may return incorrect results if
  ; peer authentication is disabled with `NNG_TLS_AUTH_MODE_NONE`.
  (define NNG_OPT_TLS_PEER_CN "tls-peer-cn")

  ; NNG_OPT_TLS_PEER_ALT_NAMES returns string list with the
  ; subject alternative names of the peer certificate. Typically this is
  ; read-only and only available for pipes. This option may return
  ; incorrect results if peer authentication is disabled with
  ; `NNG_TLS_AUTH_MODE_NONE`.
  (define NNG_OPT_TLS_PEER_ALT_NAMES "tls-peer-alt-names")

  ; TCP options.  These may be supported on various transports that use
  ; TCP underneath such as TLS, or not.

  ; TCP nodelay disables the use of Nagle, so that messages are sent
  ; as soon as data is available. This tends to reduce latency, but
  ; can come at the cost of extra messages being sent, and may have
  ; a detrimental effect on performance. For most uses, we recommend
  ; enabling this. (Disable it if you are on a very slow network.)
  ; This is a boolean.
  (define NNG_OPT_TCP_NODELAY "tcp-nodelay")

  ; TCP keepalive causes the underlying transport to send keep-alive
  ; messages, and keep the session active. Keepalives are zero length
  ; messages with the ACK flag turned on. If we don't get an ACK back,
  ; then we know the other side is gone. This is useful for detecting
  ; dead peers, and is also used to prevent disconnections caused by
  ; middle boxes thinking the session has gone idle (e.g. keeping NAT
  ; state current). This is a boolean.
  (define NNG_OPT_TCP_KEEPALIVE "tcp-keepalive")

  ; Local TCP port number.  This is used on a listener, and is intended
  ; to be used after starting the listener in combination with a wildcard
  ; (0) local port.  This determines the actual ephemeral port that was
  ; selected and bound.  The value is provided as an int, but only the
  ; low order 16 bits will be set.  This is provided in native byte order,
  ; which makes it more convenient than using the NNG_OPT_LOCADDR option.
  (define NNG_OPT_TCP_BOUND_PORT "tcp-bound-port")

  ; IPC options.  These will largely vary depending on the platform,
  ; as POSIX systems have very different options than Windows.

  ; Security Descriptor.  This option may only be set on listeners
  ; on the Windows platform, where the object is a pointer to a
  ; a Windows SECURITY_DESCRIPTOR.
  (define NNG_OPT_IPC_SECURITY_DESCRIPTOR "ipc:security-descriptor")

  ; Permissions bits.  This option is only valid for listeners on
  ; POSIX platforms and others that honor UNIX style permission bits.
  ; Note that some platforms may not honor the permissions here, although
  ; at least Linux and macOS seem to do so.  Check before you rely on
  ; this for security.
  (define NNG_OPT_IPC_PERMISSIONS "ipc:permissions")

  ; IPC peer options may also be used in some cases with other socket types.

  ; Peer UID.  This is only available on POSIX style systems.
  (define NNG_OPT_PEER_UID "ipc:peer-uid")
  (define NNG_OPT_IPC_PEER_UID NNG_OPT_PEER_UID)

  ; Peer GID (primary group).  This is only available on POSIX style systems.
  (define NNG_OPT_PEER_GID "ipc:peer-gid")
  (define NNG_OPT_IPC_PEER_GID NNG_OPT_PEER_GID)

  ; Peer process ID.  Available on Windows, Linux, and SunOS.
  ; In theory, we could obtain this with the first message sent,
  ; but we have elected not to do this for now. (Nice RFE for a FreeBSD
  ; guru though.)
  (define NNG_OPT_PEER_PID "ipc:peer-pid")
  (define NNG_OPT_IPC_PEER_PID NNG_OPT_PEER_PID)

  ; Peer Zone ID.  Only on SunOS systems.  (Linux containers have no
  ; definable kernel identity; they are a user-land fabrication made up
  ; from various pieces of different namespaces. FreeBSD does have
  ; something called JailIDs, but it isn't obvious how to determine this,
  ; or even if processes can use IPC across jail boundaries.)
  (define NNG_OPT_PEER_ZONEID "ipc:peer-zoneid")
  (define NNG_OPT_IPC_PEER_ZONEID NNG_OPT_PEER_ZONEID)

  ; WebSocket Options.

  ; NNG_OPT_WS_REQUEST_HEADERS is a string containing the
  ; request headers, formatted as CRLF terminated lines.
  (define NNG_OPT_WS_REQUEST_HEADERS "ws:request-headers")

  ; NNG_OPT_WS_RESPONSE_HEADERS is a string containing the
  ; response headers, formatted as CRLF terminated lines.
  (define NNG_OPT_WS_RESPONSE_HEADERS "ws:response-headers")

  ; NNG_OPT_WS_REQUEST_HEADER is a prefix, for a dynamic
  ; property name.  This allows direct access to any named header.
  ; Concatenate this with the name of the property (case is not sensitive).
  ; Only the first such header is returned.
  (define NNG_OPT_WS_RESPONSE_HEADER "ws:response-header:")

  ; NNG_OPT_WS_RESPONSE_HEADER is like NNG_OPT_REQUEST_HEADER, but used for
  ; accessing the request headers.
  (define NNG_OPT_WS_REQUEST_HEADER "ws:request-header:")

  ; NNG_OPT_WS_REQUEST_URI is used to obtain the URI sent by the client.
  ; This can be useful when a handler supports an entire directory tree.
  (define NNG_OPT_WS_REQUEST_URI "ws:request-uri")

  ; NNG_OPT_WS_SENDMAXFRAME is used to configure the fragmentation size
  ; used for frames.  This has a default value of 64k.  Large values
  ; are good for throughput, but penalize latency.  They also require
  ; additional buffering on the peer.  This value must not be larger
  ; than what the peer will accept, and unfortunately there is no way
  ; to negotiate this.
  (define NNG_OPT_WS_SENDMAXFRAME "ws:txframe-max")

  ; NNG_OPT_WS_RECVMAXFRAME is the largest frame we will accept.  This should
  ; probably not be larger than NNG_OPT_RECVMAXSZ. If the sender attempts
  ; to send more data than this in a single message, it will be dropped.
  (define NNG_OPT_WS_RECVMAXFRAME "ws:rxframe-max")

  ; NNG_OPT_WS_PROTOCOL is the "websocket sub-protocol" -- it's a string.
  ; This is also known as the Sec-WebSocket-Protocol header. It is treated
  ; specially.  This is part of the websocket handshake.
  (define NNG_OPT_WS_PROTOCOL "ws:protocol")

  ; NNG_OPT_WS_SEND_TEXT is a boolean used to tell the WS stream
  ; transport to send text messages.  This is not supported for the
  ; core WebSocket transport, but when using streams it might be useful
  ; to speak with 3rd party WebSocket applications.  This mode should
  ; not be used unless absolutely required. No validation of the message
  ; contents is performed by NNG; applications are expected to honor
  ; the requirement to send only valid UTF-8.  (Compliant applications
  ; will close the socket if they see this message type with invalid UTF-8.)
  (define NNG_OPT_WS_SEND_TEXT "ws:send-text")

  ; NNG_OPT_WS_RECV_TEXT is a boolean that enables NNG to receive
  ; TEXT frames.  This is only useful for stream mode applications --
  ; SP protocol requires the use of binary frames.  Note also that
  ; NNG does not validate the message contents for valid UTF-8; this
  ; means it will not be conformant with RFC-6455 on it's own. Applications
  ; that need this should check the message contents themselves, and
  ; close the connection if invalid UTF-8 is received.  This option
  ; should not be used unless required to communication with 3rd party
  ; peers that cannot be coerced into sending binary frames.
  (define NNG_OPT_WS_RECV_TEXT "ws:recv-text")

  ; NNG_OPT_SOCKET_FD is a write-only integer property that is used to
  ; file descriptors (or FILE HANDLE objects on Windows) to a
  ; socket:; based listener.  This file descriptor will be taken
  ; over and used as a stream connection.  The protocol is compatible
  ; with SP over TCP.  This facility is experimental, and intended to
  ; allow use with descriptors created via socketpair() or similar.
  ; Note that unidirectional pipes (such as those from pipe(2) or mkfifo)
  ; are not supported.
  (define NNG_OPT_SOCKET_FD "socket:fd")


  ; XXX: TBD: priorities, ipv4only

  ; Statistics. These are for informational purposes only, and subject
  ; to change without notice. The API for accessing these is stable,
  ; but the individual statistic names, values, and meanings are all
  ; subject to change.

  ; nng_stats_get takes a snapshot of the entire set of statistics.
  ; While the operation can be somewhat expensive (allocations), it
  ; is done in a way that minimizes impact to running operations.
  ; Note that the statistics are provided as a tree, with parents
  ; used for grouping, and with child statistics underneath.  The
  ; top stat returned will be of type NNG_STAT_SCOPE with name "".
  ; Applications may choose to consider this root scope as "root", if
  ; the empty string is not suitable.
  ; NNG_DECL int nng_stats_get(nng_stat **);
  (define nng-stats-get (let ([f (foreign-procedure "nng_stats_get" ((* nng_stat)) int)]) (lambda (stat) (f stat))))

  ; nng_stats_free frees a previous list of snapshots.  This should only
  ; be called on the parent statistic that obtained via nng_stats_get.
  ; NNG_DECL void nng_stats_free(nng_stat *);
  (define nng-stats-free (let ([f (foreign-procedure "nng_stats_free" ((* nng_stat)) void)]) (lambda (stat) (f stat))))

  ; nng_stats_dump is a debugging function that dumps the entire set of
  ; statistics to stdout.
  ; NNG_DECL void nng_stats_dump(nng_stat *);
  (define nng-stats-dump (let ([f (foreign-procedure "nng_stats_dump" ((* nng_stat)) void)]) (lambda (stat) (f stat))))

  ; nng_stat_next finds the next sibling for the current stat.  If there
  ; are no more siblings, it returns NULL.
  ; NNG_DECL nng_stat *nng_stat_next(nng_stat *);
  (define nng-stat-next (let ([f (foreign-procedure "nng_stat_next" ((* nng_stat)) (* nng_stat))]) (lambda (stat) (f stat))))

  ; nng_stat_child finds the first child of the current stat.  If no children
  ; exist, then NULL is returned.
  ; NNG_DECL nng_stat *nng_stat_child(nng_stat *);
  (define nng-stat-child (let ([f (foreign-procedure "nng_stat_child" ((* nng_stat)) (* nng_stat))]) (lambda (stat) (f stat))))

  ; nng_stat_name is used to determine the name of the statistic.
  ; This is a human-readable name.  Statistic names, as well as the presence
  ; or absence or semantic of any particular statistic are not part of any
  ; stable API, and may be changed without notice in future updates.
  ; NNG_DECL const char *nng_stat_name(nng_stat *);
  (define nng-stat-name (let ([f (foreign-procedure "nng_stat_name" ((* nng_stat)) string)]) (lambda (stat) (f stat))))

  ; nng_stat_type is used to determine the type of the statistic.
  ; Counters generally increment, and therefore changes in the value over
  ; time are likely more interesting than the actual level.  Level
  ; values reflect some absolute state however, and should be presented to the
  ; user as is.
  ; NNG_DECL int nng_stat_type(nng_stat *);
  (define nng-stat-type (let ([f (foreign-procedure "nng_stat_type" ((* nng_stat)) int)]) (lambda (stat) (f stat))))

  ; nng_stat_find is used to find a specific named statistic within
  ; a statistic tree.  NULL is returned if no such statistic exists.
  ; NNG_DECL nng_stat *nng_stat_find(nng_stat *, const char *);
  (define nng-stat-find (let ([f (foreign-procedure "nng_stat_find" ((* nng_stat) (& nng_socket)) string)]) (lambda (stat name) (f stat name))))

  ; nng_stat_find_socket is used to find the stats for the given socket.
  ; NNG_DECL nng_stat *nng_stat_find_socket(nng_stat *, nng_socket);
  (define nng-stat-find-socket (let ([f (foreign-procedure "nng_stat_find_socket" ((* nng_stat) (& nng_socket)) (* nng_stat))]) (lambda (stat socket) (f stat socket))))

  ; nng_stat_find_dialer is used to find the stats for the given dialer.
  ; NNG_DECL nng_stat *nng_stat_find_dialer(nng_stat *, nng_dialer);
  (define nng-stat-find-dialer (let ([f (foreign-procedure "nng_stat_find_dialer" ((* nng_stat) (& nng_dialer)) (* nng_stat))]) (lambda (stat dialer) (f stat dialer))))
  
  ; nng_stat_find_listener is used to find the stats for the given listener.
  ; NNG_DECL nng_stat *nng_stat_find_listener(nng_stat *, nng_listener);
  (define nng-stat-find-listener (let ([f (foreign-procedure "nng_stat_find_listener" ((* nng_stat) (& nng_listener)) (* nng_stat))]) (lambda (stat listener) (f stat listener))))

  ;; nng_stat_type_enum
  (define NNG_STAT_SCOPE   0)  ; Stat is for scoping, and carries no value
	(define NNG_STAT_LEVEL   1)  ; Numeric "absolute" value, diffs meaningless
	(define NNG_STAT_COUNTER 2)  ; Incrementing value (diffs are meaningful)
	(define NNG_STAT_STRING  3)  ; Value is a string
	(define NNG_STAT_BOOLEAN 4)  ; Value is a boolean
	(define NNG_STAT_ID      5)  ; Value is a numeric ID

  ; nng_stat_unit provides information about the unit for the statistic,
  ; such as NNG_UNIT_BYTES or NNG_UNIT_BYTES.  If no specific unit is
  ; applicable, such as a relative priority, then NN_UNIT_NONE is returned.
  ; NNG_DECL int nng_stat_unit(nng_stat *);
  (define nng-stat-unit (let ([f (foreign-procedure "nng_stat_unit" ((* nng_stat)) int)]) (lambda (stat) (f stat))))

  ; enum nng_unit_enum
  (define NNG_UNIT_NONE     0)  ; No special units
  (define NNG_UNIT_BYTES    1)  ; Bytes, e.g. bytes sent, etc.
  (define NNG_UNIT_MESSAGES 2)  ; Messages, one per message
  (define NNG_UNIT_MILLIS   3)  ; Milliseconds
  (define NNG_UNIT_EVENTS   4)  ; Some other type of event

  ; nng_stat_value returns the actual value of the statistic.
  ; Statistic values reflect their value at the time that the corresponding
  ; snapshot was updated, and are undefined until an update is performed.
  ; NNG_DECL uint64_t nng_stat_value(nng_stat *);
  (define nng-stat-value (let ([f (foreign-procedure "nng_stat_value" ((* nng_stat)) unsigned-64)]) (lambda (stat) (f stat))))

  ; nng_stat_bool returns the boolean value of the statistic.
  ; NNG_DECL bool nng_stat_bool(nng_stat *);
  (define nng-stat-bool (let ([f (foreign-procedure "nng_stat_bool" ((* nng_stat)) boolean)]) (lambda (stat) (f stat))))

  ; nng_stat_string returns the string associated with a string statistic,
  ; or NULL if the statistic is not part of the string.  The value returned
  ; is valid until the associated statistic is freed.
  ; NNG_DECL const char *nng_stat_string(nng_stat *);
  (define nng-stat-string (let ([f (foreign-procedure "nng_stat_string" ((* nng_stat)) string)]) (lambda (stat) (f stat))))

  ; nng_stat_desc returns a human-readable description of the statistic.
  ; This may be useful for display in diagnostic interfaces, etc.
  ; NNG_DECL const char *nng_stat_desc(nng_stat *);
  (define nng-stat-desc (let ([f (foreign-procedure "nng_stat_desc" ((* nng_stat)) string)]) (lambda (stat) (f stat))))

  ; nng_stat_timestamp returns a timestamp (milliseconds) when the statistic
  ; was captured.  The base offset is the same as used by nng_clock().
  ; We don't use nng_time though, because that's in the supplemental header.
  ; NNG_DECL uint64_t nng_stat_timestamp(nng_stat *);
  (define nng-stat-timestamp (let ([f (foreign-procedure "nng_stat_timestamp" ((* nng_stat)) unsigned-64)]) (lambda (stat) (f stat))))

  ; Device functionality.  This connects two sockets together in a device,
  ; which means that messages from one side are forwarded to the other.
  ; This version is synchronous, which means the caller will block until
  ; one of the sockets is closed. Note that caller is responsible for
  ; finally closing both sockets when this function returns.
  ; NNG_DECL int nng_device(nng_socket, nng_socket);
  (define nng-device (let ([f (foreign-procedure "nng_device" ((& nng_socket) (& nng_socket)) int)]) (lambda (socket1 socket2) (f socket1 socket2))))

  ; Asynchronous form of nng_device.  When this succeeds, the device is
  ; left intact and functioning in the background, until one of the sockets
  ; is closed or the application exits.  The sockets may be shut down if
  ; the device fails, but the caller is responsible for ultimately closing
  ; the sockets properly after the device is torn down.
  ; NNG_DECL void nng_device_aio(nng_aio *, nng_socket, nng_socket);
  (define nng-device-aio (let ([f (foreign-procedure "nng_device_aio" ((* nng_aio) (& nng_socket) (& nng_socket)) void)]) (lambda (aio socket1 socket2) (f aio socket1 socket2))))

  ; Symbol name and visibility.  TBD.  The only symbols that really should
  ; be directly exported to runtimes IMO are the option symbols.  And frankly
  ; they have enough special logic around them that it might be best not to
  ; automate the promotion of them to other APIs.  This is an area open
  ; for discussion.

  ; Error codes.  These generally have different values from UNIX errnos,
  ; so take care about converting them.  The one exception is that 0 is
  ; unambiguously "success".
  ; 
  ; NNG_SYSERR is a special code, which allows us to wrap errors from the
  ; underlying operating system.  We generally prefer to map errors to one
  ; of the above, but if we cannot, then we just encode an error this way.
  ; The bit is large enough to accommodate all known UNIX and Win32 error
  ; codes.  We try hard to match things semantically to one of our standard
  ; errors.  For example, a connection reset or aborted we treat as a
  ; closed connection, because that's basically what it means.  (The remote
  ; peer closed the connection.)  For certain kinds of resource exhaustion
  ; we treat it the same as memory.  But for files, etc. that's OS-specific,
  ; and we use the generic below.  Some of the above error codes we use
  ; internally, and the application should never see (e.g. NNG_EINTR).
  ; //
  ; NNG_ETRANERR is like ESYSERR, but is used to wrap transport specific
  ; errors, from different transports.  It should only be used when none
  ; of the other options are available.

  ; enum nng_errno_enum {
  (define NNG_EINTR        1)
  (define NNG_ENOMEM       2)
  (define NNG_EINVAL       3)
  (define NNG_EBUSY        4)
  (define NNG_ETIMEDOUT    5)
  (define NNG_ECONNREFUSED 6)
  (define NNG_ECLOSED      7)
  (define NNG_EAGAIN       8)
  (define NNG_ENOTSUP      9)
  (define NNG_EADDRINUSE   10)
  (define NNG_ESTATE       11)
  (define NNG_ENOENT       12)
  (define NNG_EPROTO       13)
  (define NNG_EUNREACHABLE 14)
  (define NNG_EADDRINVAL   15)
  (define NNG_EPERM        16)
  (define NNG_EMSGSIZE     17)
  (define NNG_ECONNABORTED 18)
  (define NNG_ECONNRESET   19)
  (define NNG_ECANCELED    20)
  (define NNG_ENOFILES     21)
  (define NNG_ENOSPC       22)
  (define NNG_EEXIST       23)
  (define NNG_EREADONLY    24)
  (define NNG_EWRITEONLY   25)
  (define NNG_ECRYPTO      26)
  (define NNG_EPEERAUTH    27)
  (define NNG_ENOARG       28)
  (define NNG_EAMBIGUOUS   29)
  (define NNG_EBADTYPE     30)
  (define NNG_ECONNSHUT    31)
  (define NNG_EINTERNAL    1000)
  (define NNG_ESYSERR      #x10000000)
  (define NNG_ETRANERR     #x20000000)

  ; URL support.  We frequently want to process a URL, and these methods
  ; give us a convenient way of doing so.
  (define-ftype nng_url
    (struct
      [u_rawurl (* char)]     ; never NULL
      [u_scheme (* char)]     ; never NULL
      [u_userinfo (* char)]   ; will be NULL if not specified
      [u_host (* char)]       ; including colon and port
      [u_hostname (* char)]   ; name only, will be "" if not specified
      [u_port (* char)]       ; port, will be "" if not specified
      [u_path (* char)]       ; path, will be "" if not specified
      [u_query (* char)]      ; without '?', will be NULL if not specified
      [u_fragment (* char)]   ; without '#', will be NULL if not specified
      [u_requri (* char)]     ; includes query and fragment, "" if not specified
      ))
  (define-ftype nng_url* (* nng_url))

  ; nng_url_parse parses a URL string into a structured form.
  ; Note that the u_port member will be filled out with a numeric
  ; port if one isn't specified and a default port is appropriate for
  ; the scheme.  The URL structure is allocated, along with individual
  ; members.  It can be freed with nng_url_free.
  ; NNG_DECL int nng_url_parse(nng_url **, const char *);
  (define nng-url-parse (let ([f (foreign-procedure "nng_url_parse" ((* nng_url*) string) int)]) (lambda (urlp str) (f urlp str))))

  ; nng_url_free frees a URL structure that was created by nng_url_parse().
  ; NNG_DECL void nng_url_free(nng_url *);
  (define nng-url-free (let ([f (foreign-procedure "nng_url_free" ((* nng_url)) void)]) (lambda (url) (f url))))

  ; nng_url_clone clones a URL structure.
  ; NNG_DECL int nng_url_clone(nng_url **, const nng_url *);
  (define nng-url-clone (let ([f (foreign-procedure "nng_url_clone" ((* nng_url) (* nng_url)) int)]) (lambda (dup orig) (f dup orig))))

  ; nng_version returns the library version as a human readable string.
  ; NNG_DECL const char *nng_version(void);
  (define nng-version (let ([f (foreign-procedure "nng_version" () string)]) (lambda () (f))))

  ; nng_stream operations permit direct access to low level streams,
  ; which can have a variety of uses.  Internally most of the transports
  ; are built on top of these.  Streams are created by other dialers or
  ; listeners.  The API for creating dialers and listeners varies.
  (define-ftype nng_stream          (struct))
  (define-ftype nng_stream_dialer   (struct))
  (define-ftype nng_stream_listener (struct))

  (define nng-stream-free  (let ([f (foreign-procedure "nng_stream_free"  ((* nng_stream)) void)])             (lambda (stream)     (f stream))))
  (define nng-stream-close (let ([f (foreign-procedure "nng_stream_close" ((* nng_stream)) void)])             (lambda (stream)     (f stream))))
  (define nng-stream-send  (let ([f (foreign-procedure "nng_stream_send"  ((* nng_stream) (* nng_aio)) void)]) (lambda (stream aio) (f stream aio))))
  (define nng-stream-recv  (let ([f (foreign-procedure "nng_stream_recv"  ((* nng_stream) (* nng_aio)) void)]) (lambda (stream aio) (f stream aio))))

  (define nng-stream-set        (let ([f (foreign-procedure "nng_stream_set"        ((* nng_stream) string void* size_t) int)]) (lambda (stream name data size) (f stream name data size))))
  (define nng-stream-set-bool   (let ([f (foreign-procedure "nng_stream_set_bool"   ((* nng_stream) string boolean) int)])          (lambda (stream opt val)        (f stream opt val))))
  (define nng-stream-set-int    (let ([f (foreign-procedure "nng_stream_set_int"    ((* nng_stream) string int) int)])              (lambda (stream opt val)        (f stream opt val))))
  (define nng-stream-set-size   (let ([f (foreign-procedure "nng_stream_set_size"   ((* nng_stream) string size_t) int)])           (lambda (stream opt val)        (f stream opt val))))
  (define nng-stream-set-uint64 (let ([f (foreign-procedure "nng_stream_set_uint64" ((* nng_stream) string unsigned-64) int)])      (lambda (stream opt val)        (f stream opt val))))
  (define nng-stream-set-string (let ([f (foreign-procedure "nng_stream_set_string" ((* nng_stream) string string) int)])           (lambda (stream opt val)        (f stream opt val))))
  (define nng-stream-set-ptr    (let ([f (foreign-procedure "nng_stream_set_ptr"    ((* nng_stream) string void*) int)])            (lambda (stream opt val)        (f stream opt val))))
  (define nng-stream-set-ms     (let ([f (foreign-procedure "nng_stream_set_ms"     ((* nng_stream) string (& nng_duration)) int)]) (lambda (stream opt val)        (f stream opt val))))
  (define nng-stream-set-addr   (let ([f (foreign-procedure "nng_stream_set_addr"   ((* nng_stream) string (* nng_sockaddr)) int)]) (lambda (stream opt val)        (f stream opt val))))

  (define nng-stream-get        (let ([f (foreign-procedure "nng_stream_get"        ((* nng_stream) string void* (* size_t)) int)]) (lambda (stream opt val sizep)  (f stream opt val sizep))))
  (define nng-stream-get-bool   (let ([f (foreign-procedure "nng_stream_get_bool"   ((* nng_stream) string (* boolean)) int)])      (lambda (stream opt valp)       (f stream opt valp))))
  (define nng-stream-get-int    (let ([f (foreign-procedure "nng_stream_get_int"    ((* nng_stream) string (* int)) int)])          (lambda (stream opt valp)       (f stream opt valp))))
  (define nng-stream-get-size   (let ([f (foreign-procedure "nng_stream_get_size"   ((* nng_stream) string (* size_t)) int)])       (lambda (stream opt valp)       (f stream opt valp))))
  (define nng-stream-get-uint64 (let ([f (foreign-procedure "nng_stream_get_uint64" ((* nng_stream) string (* unsigned-64)) int)])  (lambda (stream opt valp)       (f stream opt valp))))
  (define nng-stream-get-string (let ([f (foreign-procedure "nng_stream_get_string" ((* nng_stream) string void*) int)])            (lambda (stream opt valp)       (f stream opt valp))))
  (define nng-stream-get-ptr    (let ([f (foreign-procedure "nng_stream_get_ptr"    ((* nng_stream) string void*) int)])            (lambda (stream opt valp)       (f stream opt valp))))
  (define nng-stream-get-ms     (let ([f (foreign-procedure "nng_stream_get_ms"     ((* nng_stream) string (* nng_duration)) int)]) (lambda (stream opt valp)       (f stream opt valp))))
  (define nng-stream-get-addr   (let ([f (foreign-procedure "nng_stream_get_addr"   ((* nng_stream) string (* nng_sockaddr)) int)]) (lambda (stream opt valp)       (f stream opt valp))))
  
  (define nng-stream-dialer-alloc     (let ([f (foreign-procedure "nng_stream_dialer_alloc"     ((* nng_stream_dialer) string) int)])       (lambda (dp addr) (f dp addr))))
  (define nng-stream-dialer-alloc-url (let ([f (foreign-procedure "nng_stream_dialer_alloc_url" ((* nng_stream_dialer) (* nng_url)) int)])  (lambda (dp url)  (f dp url))))
  (define nng-stream-dialer-free      (let ([f (foreign-procedure "nng_stream_dialer_free"      ((* nng_stream_dialer)) void)])             (lambda (d)       (f d))))
  (define nng-stream-dialer-close     (let ([f (foreign-procedure "nng_stream_dialer_close"     ((* nng_stream_dialer)) void)])             (lambda (d)       (f d))))
  (define nng-stream-dialer-dial      (let ([f (foreign-procedure "nng_stream_dialer_dial"      ((* nng_stream_dialer) (* nng_aio)) void)]) (lambda (d aio)   (f d aio))))

  (define nng-stream-dialer-set        (let ([f (foreign-procedure "nng_stream_dialer_set"        ((* nng_stream_dialer) string void* size_t) int)])     (lambda (d name data size) (f d name data size))))
  (define nng-stream-dialer-set-bool   (let ([f (foreign-procedure "nng_stream_dialer_set_bool"   ((* nng_stream_dialer) string boolean) int)])          (lambda (d opt val)        (f d opt val))))
  (define nng-stream-dialer-set-int    (let ([f (foreign-procedure "nng_stream_dialer_set_int"    ((* nng_stream_dialer) string int) int)])              (lambda (d opt val)        (f d opt val))))
  (define nng-stream-dialer-set-size   (let ([f (foreign-procedure "nng_stream_dialer_set_size"   ((* nng_stream_dialer) string size_t) int)])           (lambda (d opt val)        (f d opt val))))
  (define nng-stream-dialer-set-uint64 (let ([f (foreign-procedure "nng_stream_dialer_set_uint64" ((* nng_stream_dialer) string unsigned-64) int)])      (lambda (d opt val)        (f d opt val))))
  (define nng-stream-dialer-set-string (let ([f (foreign-procedure "nng_stream_dialer_set_string" ((* nng_stream_dialer) string string) int)])           (lambda (d opt val)        (f d opt val))))
  (define nng-stream-dialer-set-ptr    (let ([f (foreign-procedure "nng_stream_dialer_set_ptr"    ((* nng_stream_dialer) string void*) int)])            (lambda (d opt val)        (f d opt val))))
  (define nng-stream-dialer-set-ms     (let ([f (foreign-procedure "nng_stream_dialer_set_ms"     ((* nng_stream_dialer) string (& nng_duration)) int)]) (lambda (d opt val)        (f d opt val))))
  (define nng-stream-dialer-set-addr   (let ([f (foreign-procedure "nng_stream_dialer_set_addr"   ((* nng_stream_dialer) string (* nng_sockaddr)) int)]) (lambda (d opt val)        (f d opt val))))

  (define nng-stream-dialer-get        (let ([f (foreign-procedure "nng_stream_dialer_get"        ((* nng_stream_dialer) string void* (* size_t)) int)]) (lambda (d opt val sizep)  (f d opt val sizep))))
  (define nng-stream-dialer-get-bool   (let ([f (foreign-procedure "nng_stream_dialer_get_bool"   ((* nng_stream_dialer) string (* boolean)) int)])      (lambda (d opt valp)       (f d opt valp))))
  (define nng-stream-dialer-get-int    (let ([f (foreign-procedure "nng_stream_dialer_get_int"    ((* nng_stream_dialer) string (* int)) int)])          (lambda (d opt valp)       (f d opt valp))))
  (define nng-stream-dialer-get-size   (let ([f (foreign-procedure "nng_stream_dialer_get_size"   ((* nng_stream_dialer) string (* size_t)) int)])       (lambda (d opt valp)       (f d opt valp))))
  (define nng-stream-dialer-get-uint64 (let ([f (foreign-procedure "nng_stream_dialer_get_uint64" ((* nng_stream_dialer) string (* unsigned-64)) int)])  (lambda (d opt valp)       (f d opt valp))))
  (define nng-stream-dialer-get-string (let ([f (foreign-procedure "nng_stream_dialer_get_string" ((* nng_stream_dialer) string void*) int)])            (lambda (d opt valp)       (f d opt valp))))
  (define nng-stream-dialer-get-ptr    (let ([f (foreign-procedure "nng_stream_dialer_get_ptr"    ((* nng_stream_dialer) string void*) int)])            (lambda (d opt valp)       (f d opt valp))))
  (define nng-stream-dialer-get-ms     (let ([f (foreign-procedure "nng_stream_dialer_get_ms"     ((* nng_stream_dialer) string (* nng_duration)) int)]) (lambda (d opt valp)       (f d opt valp))))
  (define nng-stream-dialer-get-addr   (let ([f (foreign-procedure "nng_stream_dialer_get_addr"   ((* nng_stream_dialer) string (* nng_sockaddr)) int)]) (lambda (d opt valp)       (f d opt valp))))
  
  (define nng-stream-listener-alloc     (let ([f (foreign-procedure "nng_stream_listener_alloc"     ((* nng_stream_listener) string) int)])       (lambda (lp addr) (f lp addr))))
  (define nng-stream-listener-alloc-url (let ([f (foreign-procedure "nng_stream_listener_alloc_url" ((* nng_stream_listener) (* nng_url)) int)])  (lambda (lp url)  (f lp url))))
  (define nng-stream-listener-free      (let ([f (foreign-procedure "nng_stream_listener_free"      ((* nng_stream_listener)) void)])             (lambda (l)       (f l))))
  (define nng-stream-listener-close     (let ([f (foreign-procedure "nng_stream_listener_close"     ((* nng_stream_listener)) void)])             (lambda (l)       (f l))))
  (define nng-stream-listener-listen    (let ([f (foreign-procedure "nng_stream_listener_listen"    ((* nng_stream_listener)) int)])              (lambda (l)       (f l))))
  (define nng-stream-listener-accept    (let ([f (foreign-procedure "nng_stream_listener_accept"    ((* nng_stream_listener) (* nng_aio)) void)]) (lambda (l aio)   (f l aio))))

  (define nng-stream-listener-set        (let ([f (foreign-procedure "nng_stream_listener_set"        ((* nng_stream_listener) string void* size_t) int)])     (lambda (l name data size) (f l name data size))))
  (define nng-stream-listener-set-bool   (let ([f (foreign-procedure "nng_stream_listener_set_bool"   ((* nng_stream_listener) string boolean) int)])          (lambda (l opt val)        (f l opt val))))
  (define nng-stream-listener-set-int    (let ([f (foreign-procedure "nng_stream_listener_set_int"    ((* nng_stream_listener) string int) int)])              (lambda (l opt val)        (f l opt val))))
  (define nng-stream-listener-set-size   (let ([f (foreign-procedure "nng_stream_listener_set_size"   ((* nng_stream_listener) string size_t) int)])           (lambda (l opt val)        (f l opt val))))
  (define nng-stream-listener-set-uint64 (let ([f (foreign-procedure "nng_stream_listener_set_uint64" ((* nng_stream_listener) string unsigned-64) int)])      (lambda (l opt val)        (f l opt val))))
  (define nng-stream-listener-set-string (let ([f (foreign-procedure "nng_stream_listener_set_string" ((* nng_stream_listener) string string) int)])           (lambda (l opt val)        (f l opt val))))
  (define nng-stream-listener-set-ptr    (let ([f (foreign-procedure "nng_stream_listener_set_ptr"    ((* nng_stream_listener) string void*) int)])            (lambda (l opt val)        (f l opt val))))
  (define nng-stream-listener-set-ms     (let ([f (foreign-procedure "nng_stream_listener_set_ms"     ((* nng_stream_listener) string (& nng_duration)) int)]) (lambda (l opt val)        (f l opt val))))
  (define nng-stream-listener-set-addr   (let ([f (foreign-procedure "nng_stream_listener_set_addr"   ((* nng_stream_listener) string (* nng_sockaddr)) int)]) (lambda (l opt val)        (f l opt val))))
  (define nng-stream-listener-get        (let ([f (foreign-procedure "nng_stream_listener_get"        ((* nng_stream_listener) string void* (* size_t)) int)]) (lambda (l opt val sizep)  (f l opt val sizep))))
  (define nng-stream-listener-get-bool   (let ([f (foreign-procedure "nng_stream_listener_get_bool"   ((* nng_stream_listener) string (* boolean)) int)])      (lambda (l opt valp)       (f l opt valp))))
  (define nng-stream-listener-get-int    (let ([f (foreign-procedure "nng_stream_listener_get_int"    ((* nng_stream_listener) string (* int)) int)])          (lambda (l opt valp)       (f l opt valp))))
  (define nng-stream-listener-get-size   (let ([f (foreign-procedure "nng_stream_listener_get_size"   ((* nng_stream_listener) string (* size_t)) int)])       (lambda (l opt valp)       (f l opt valp))))
  (define nng-stream-listener-get-uint64 (let ([f (foreign-procedure "nng_stream_listener_get_uint64" ((* nng_stream_listener) string (* unsigned-64)) int)])  (lambda (l opt valp)       (f l opt valp))))
  (define nng-stream-listener-get-string (let ([f (foreign-procedure "nng_stream_listener_get_string" ((* nng_stream_listener) string void*) int)])            (lambda (l opt valp)       (f l opt valp))))
  (define nng-stream-listener-get-ptr    (let ([f (foreign-procedure "nng_stream_listener_get_ptr"    ((* nng_stream_listener) string void*) int)])            (lambda (l opt valp)       (f l opt valp))))
  (define nng-stream-listener-get-ms     (let ([f (foreign-procedure "nng_stream_listener_get_ms"     ((* nng_stream_listener) string (* nng_duration)) int)]) (lambda (l opt valp)       (f l opt valp))))
  (define nng-stream-listener-get-addr   (let ([f (foreign-procedure "nng_stream_listener_get_addr"   ((* nng_stream_listener) string (* nng_sockaddr)) int)]) (lambda (l opt valp)       (f l opt valp))))
  

  ;; Logging support.
  ;; not binding yet

  ;;
  ;; protocol
  ;;
  ; pubsub0
  (define NNG_OPT_SUB_SUBSCRIBE "sub:subscribe")
  (define NNG_OPT_SUB_UNSUBSCRIBE "sub:unsubscribe")
  (define NNG_OPT_SUB_PREFNEW "sub:prefnew")
  (define nng-pub-open (let ([f (foreign-procedure "nng_pub0_open" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-pub-open-raw (let ([f (foreign-procedure "nng_pub0_open_raw" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-sub-open (let ([f (foreign-procedure "nng_sub0_open" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-sub-open-raw (let ([f (foreign-procedure "nng_sub0_open_raw" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  
  ; pair0
  (define nng-pair0-open (let ([f (foreign-procedure "nng_pair0_open" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-pair0-open-raw (let ([f (foreign-procedure "nng_pair0_open_raw" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  
  ; pair1
  (define NNG_OPT_PAIR1_POLY "pair1:polyamorous")
  (define NNG_PAIR1_SELF #x11)
  (define NNG_PAIR1_PEER #x11)
  (define NNG_PAIR1_SELF_NAME "pair1")
  (define NNG_PAIR1_PEER_NAME "pair1")
  (define nng-pair1-open (let ([f (foreign-procedure "nng_pair1_open" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-pair1-open-raw (let ([f (foreign-procedure "nng_pair1_open_raw" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-pair1-open-poly (let ([f (foreign-procedure "nng_pair1_open_poly" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  
  ; bus0
  (define NNG_BUS0_SELF #x70)
  (define NNG_BUS0_PEER #x70)
  (define NNG_BUS0_SELF_NAME "bus")
  (define NNG_BUS0_PEER_NAME "bus")
  (define nng-bus-open (let ([f (foreign-procedure "nng_bus0_open" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-bus-open-raw (let ([f (foreign-procedure "nng_bus0_open_raw" ((* nng_socket)) int)]) (lambda (socket) (f socket))))

  ; pipeline0
  (define nng-push-open (let ([f (foreign-procedure "nng_push0_open" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-push-open-raw (let ([f (foreign-procedure "nng_push0_open_raw" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-pull-open (let ([f (foreign-procedure "nng_pull0_open" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-pull-open-raw (let ([f (foreign-procedure "nng_pull0_open_raw" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  
  ; reqrep0
  (define NNG_REP0_SELF #x31)
  (define NNG_REP0_PEER #x30)
  (define NNG_REP0_SELF_NAME "rep")
  (define NNG_REP0_PEER_NAME "req")
  (define NNG_REQ0_SELF #x30)
  (define NNG_REQ0_PEER #x31)
  (define NNG_REQ0_SELF_NAME "req")
  (define NNG_REQ0_PEER_NAME "rep")
  (define NNG_OPT_REQ_RESENDTIME "req:resend-time")
  (define NNG_OPT_REQ_RESENDTICK "req:resend-tick")
  (define nng-req-open (let ([f (foreign-procedure "nng_req0_open" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-req-open-raw (let ([f (foreign-procedure "nng_req0_open_raw" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-rep-open (let ([f (foreign-procedure "nng_rep0_open" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-rep-open-raw (let ([f (foreign-procedure "nng_rep0_open_raw" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  
  ; survey0
  (define NNG_RESPONDENT0_SELF #x63)
  (define NNG_RESPONDENT0_PEER #x62)
  (define NNG_RESPONDENT0_SELF_NAME "respondent")
  (define NNG_RESPONDENT0_PEER_NAME "surveyor")
  (define NNG_SURVEYOR0_SELF #x62)
  (define NNG_SURVEYOR0_PEER #x63)
  (define NNG_SURVEYOR0_SELF_NAME "surveyor")
  (define NNG_SURVEYOR0_PEER_NAME "respondent")
  (define NNG_OPT_SURVEYOR_SURVEYTIME "surveyor:survey-time")
  (define nng-respondent-open (let ([f (foreign-procedure "nng_respondent0_open" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-respondent-open-raw (let ([f (foreign-procedure "nng_respondent0_open_raw" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-surveyor-open (let ([f (foreign-procedure "nng_surveyor0_open" ((* nng_socket)) int)]) (lambda (socket) (f socket))))
  (define nng-surveyor-open-raw (let ([f (foreign-procedure "nng_surveyor0_open_raw" ((* nng_socket)) int)]) (lambda (socket) (f socket))))

  ;;
  ;; transport
  ;; transport apis deprecated, and may be removed from a future release.
  ;; It is no longer necessary to explicitly register transports.
  ;;

  ;;
  ;; http
  ;;
  (define-ftype nng_tls_config (struct))
  ; nng_http_status
  (define NNG_HTTP_STATUS_CONTINUE                 100)
  (define NNG_HTTP_STATUS_SWITCHING                101)
  (define NNG_HTTP_STATUS_PROCESSING               102)
  (define NNG_HTTP_STATUS_OK                       200)
  (define NNG_HTTP_STATUS_CREATED                  201)
  (define NNG_HTTP_STATUS_ACCEPTED                 202)
  (define NNG_HTTP_STATUS_NOT_AUTHORITATIVE        203)
  (define NNG_HTTP_STATUS_NO_CONTENT               204)
  (define NNG_HTTP_STATUS_RESET_CONTENT            205)
  (define NNG_HTTP_STATUS_PARTIAL_CONTENT          206)
  (define NNG_HTTP_STATUS_MULTI_STATUS             207)
  (define NNG_HTTP_STATUS_ALREADY_REPORTED         208)
  (define NNG_HTTP_STATUS_IM_USED                  226)
  (define NNG_HTTP_STATUS_MULTIPLE_CHOICES         300)
  (define NNG_HTTP_STATUS_STATUS_MOVED_PERMANENTLY 301)
  (define NNG_HTTP_STATUS_FOUND                    302)
  (define NNG_HTTP_STATUS_SEE_OTHER                303)
  (define NNG_HTTP_STATUS_NOT_MODIFIED             304)
  (define NNG_HTTP_STATUS_USE_PROXY                305)
  (define NNG_HTTP_STATUS_TEMPORARY_REDIRECT       307)
  (define NNG_HTTP_STATUS_PERMANENT_REDIRECT       308)
  (define NNG_HTTP_STATUS_BAD_REQUEST              400)
  (define NNG_HTTP_STATUS_UNAUTHORIZED             401)
  (define NNG_HTTP_STATUS_PAYMENT_REQUIRED         402)
  (define NNG_HTTP_STATUS_FORBIDDEN                403)
  (define NNG_HTTP_STATUS_NOT_FOUND                404)
  (define NNG_HTTP_STATUS_METHOD_NOT_ALLOWED       405)
  (define NNG_HTTP_STATUS_NOT_ACCEPTABLE           406)
  (define NNG_HTTP_STATUS_PROXY_AUTH_REQUIRED      407)
  (define NNG_HTTP_STATUS_REQUEST_TIMEOUT          408)
  (define NNG_HTTP_STATUS_CONFLICT                 409)
  (define NNG_HTTP_STATUS_GONE                     410)
  (define NNG_HTTP_STATUS_LENGTH_REQUIRED          411)
  (define NNG_HTTP_STATUS_PRECONDITION_FAILED      412)
  (define NNG_HTTP_STATUS_PAYLOAD_TOO_LARGE        413)
  (define NNG_HTTP_STATUS_ENTITY_TOO_LONG          414)
  (define NNG_HTTP_STATUS_UNSUPPORTED_MEDIA_TYPE   415)
  (define NNG_HTTP_STATUS_RANGE_NOT_SATISFIABLE    416)
  (define NNG_HTTP_STATUS_EXPECTATION_FAILED       417)
  (define NNG_HTTP_STATUS_TEAPOT                   418)
  (define NNG_HTTP_STATUS_UNPROCESSABLE_ENTITY     422)
  (define NNG_HTTP_STATUS_LOCKED                   423)
  (define NNG_HTTP_STATUS_FAILED_DEPENDENCY        424)
  (define NNG_HTTP_STATUS_UPGRADE_REQUIRED         426)
  (define NNG_HTTP_STATUS_PRECONDITION_REQUIRED    428)
  (define NNG_HTTP_STATUS_TOO_MANY_REQUESTS        429)
  (define NNG_HTTP_STATUS_HEADERS_TOO_LARGE        431)
  (define NNG_HTTP_STATUS_UNAVAIL_LEGAL_REASONS    451)
  (define NNG_HTTP_STATUS_INTERNAL_SERVER_ERROR    500)
  (define NNG_HTTP_STATUS_NOT_IMPLEMENTED          501)
  (define NNG_HTTP_STATUS_BAD_GATEWAY              502)
  (define NNG_HTTP_STATUS_SERVICE_UNAVAILABLE      503)
  (define NNG_HTTP_STATUS_GATEWAY_TIMEOUT          504)
  (define NNG_HTTP_STATUS_HTTP_VERSION_NOT_SUPP    505)
  (define NNG_HTTP_STATUS_VARIANT_ALSO_NEGOTIATES  506)
  (define NNG_HTTP_STATUS_INSUFFICIENT_STORAGE     507)
  (define NNG_HTTP_STATUS_LOOP_DETECTED            508)
  (define NNG_HTTP_STATUS_NOT_EXTENDED             510)
  (define NNG_HTTP_STATUS_NETWORK_AUTH_REQUIRED    511)

  (define-ftype nng_http_req (struct))
  (define-ftype nng_http_req* void*)
  (define nng-http-req-alloc       (let ([f (foreign-procedure "nng_http_req_alloc"       ((* nng_http_req*) (* nng_url)) int)])       (lambda (reqp url) (f reqp url))))
  (define nng-http-req-free        (let ([f (foreign-procedure "nng_http_req_free"        ((* nng_http_req)) void)])                  (lambda (req) (f req))))
  (define nng-http-req-get-method  (let ([f (foreign-procedure "nng_http_req_get_method"  ((* nng_http_req)) string)])                (lambda (req) (f req))))
  (define nng-http-req-get-version (let ([f (foreign-procedure "nng_http_req_get_version" ((* nng_http_req)) string)])                (lambda (req) (f req))))
  (define nng-http-req-get-uri     (let ([f (foreign-procedure "nng_http_req_get_uri"     ((* nng_http_req)) string)])                (lambda (req) (f req))))
  (define nng-http-req-set-header  (let ([f (foreign-procedure "nng_http_req_set_header"  ((* nng_http_req) string string) int)])     (lambda (req key val) (f req key val))))
  (define nng-http-req-add-header  (let ([f (foreign-procedure "nng_http_req_add_header"  ((* nng_http_req) string string) int)])     (lambda (req key val) (f req key val))))
  (define nng-http-req-del-header  (let ([f (foreign-procedure "nng_http_req_del_header"  ((* nng_http_req) string) int)])            (lambda (req key) (f req key))))
  (define nng-http-req-get-header  (let ([f (foreign-procedure "nng_http_req_get_header"  ((* nng_http_req) string) string)])         (lambda (req key) (f req key))))
  (define nng-http-req-set-method  (let ([f (foreign-procedure "nng_http_req_set_method"  ((* nng_http_req) string) int)])            (lambda (req method) (f req method))))
  (define nng-http-req-set-version (let ([f (foreign-procedure "nng_http_req_set_version" ((* nng_http_req) string) int)])            (lambda (req version) (f req version))))
  (define nng-http-req-set-uri     (let ([f (foreign-procedure "nng_http_req_set_uri"     ((* nng_http_req) string) int)])            (lambda (req uri) (f req uri))))
  (define nng-http-req-set-data    (let ([f (foreign-procedure "nng_http_req_set_data"    ((* nng_http_req) void* size_t) int)])      (lambda (req body size) (f req body size))))
  (define nng-http-req-copy-data   (let ([f (foreign-procedure "nng_http_req_copy_data"   ((* nng_http_req) void* size_t) int)])      (lambda (req body size) (f req body size))))
  (define nng-http-req-get-data    (let ([f (foreign-procedure "nng_http_req_get_data"    ((* nng_http_req) void* (* size_t)) void)]) (lambda (req body size) (f req body size))))
  (define-ftype nng_http_res (struct))
  (define-ftype nng_http_res* void*)
  (define nng-http-res-alloc       (let ([f (foreign-procedure "nng_http_res_alloc" ((* nng_http_res*)) int)])                         (lambda (resp)        (f resp))))
  (define nng-http-res-alloc-error (let ([f (foreign-procedure "nng_http_res_alloc_error" ((* nng_http_res) unsigned-16) int)])       (lambda (resp status) (f resp status))))
  (define nng-http-res-free        (let ([f (foreign-procedure "nng_http_res_free" ((* nng_http_res)) void)])                         (lambda (res)         (f res))))
  (define nng-http-res-get-status  (let ([f (foreign-procedure "nng_http_res_get_status" ((* nng_http_res)) unsigned-16)])            (lambda (res)         (f res))))
  (define nng-http-res-set-status  (let ([f (foreign-procedure "nng_http_res_set_status" ((* nng_http_res) unsigned-16) int)])        (lambda (res status)  (f res status))))
  (define nng-http-res-get-reason  (let ([f (foreign-procedure "nng_http_res_get_reason" ((* nng_http_res)) string)])                 (lambda (res)         (f res))))
  (define nng-http-res-set-reason  (let ([f (foreign-procedure "nng_http_res_set_reason" ((* nng_http_res) string) int)])             (lambda (res reason)  (f res reason))))
  (define nng-http-res-set-header  (let ([f (foreign-procedure "nng_http_res_set_header" ((* nng_http_res) string string) int)])      (lambda (res key val) (f res key val))))
  (define nng-http-res-add-header  (let ([f (foreign-procedure "nng_http_res_add_header" ((* nng_http_res) string string) int)])      (lambda (res key val) (f res key val))))
  (define nng-http-res-del-header  (let ([f (foreign-procedure "nng_http_res_del_header" ((* nng_http_res) string) int)])             (lambda (res key) (f res key))))
  (define nng-http-res-get-header  (let ([f (foreign-procedure "nng_http_res_get_header" ((* nng_http_res) string) string)])          (lambda (res key) (f res key))))
  (define nng-http-res-set-version (let ([f (foreign-procedure "nng_http_res_set_version" ((* nng_http_res) string) int)])            (lambda (res version) (f res version))))
  (define nng-http-res-get-version (let ([f (foreign-procedure "nng_http_res_get_version" ((* nng_http_res)) string)])                (lambda (res) (f res))))
  (define nng-http-res-get-data    (let ([f (foreign-procedure "nng_http_res_get_data" ((* nng_http_res) void* (* size_t)) void)])    (lambda (res body size) (f res body size))))
  (define nng-http-res-set-data    (let ([f (foreign-procedure "nng_http_res_set_data" ((* nng_http_res) void* size_t) int)])         (lambda (res body size) (f res body size))))
  (define nng-http-res-copy-data   (let ([f (foreign-procedure "nng_http_res_copy_data" ((* nng_http_res) void* size_t) int)])        (lambda (res body size) (f res body size))))
  (define-ftype nng_http_conn (struct))
  (define nng_http_conn_close     (let ([f (foreign-procedure "nng_http_conn_close"     ((* nng_http_conn)) void)])                              (lambda (conn)     (f conn))))
  (define nng_http_conn_read      (let ([f (foreign-procedure "nng_http_conn_read"      ((* nng_http_conn) (* nng_aio)) void)])                  (lambda (conn aio) (f conn aio))))
  (define nng_http_conn_read_all  (let ([f (foreign-procedure "nng_http_conn_read_all"  ((* nng_http_conn) (* nng_aio)) void)])                  (lambda (conn aio) (f conn aio))))
  (define nng_http_conn_write     (let ([f (foreign-procedure "nng_http_conn_write"     ((* nng_http_conn) (* nng_aio)) void)])                  (lambda (conn aio) (f conn aio))))
  (define nng_http_conn_write_all (let ([f (foreign-procedure "nng_http_conn_write_all" ((* nng_http_conn) (* nng_aio)) void)])                  (lambda (conn aio) (f conn aio))))
  (define nng_http_conn_write_req (let ([f (foreign-procedure "nng_http_conn_write_req" ((* nng_http_conn) (* nng_http_req) (* nng_aio)) void)]) (lambda (conn req aio) (f conn req aio))))
  (define nng_http_conn_write_res (let ([f (foreign-procedure "nng_http_conn_write_res" ((* nng_http_conn) (* nng_http_res) (* nng_aio)) void)]) (lambda (conn res aio) (f conn res aio))))
  (define nng_http_conn_read_req  (let ([f (foreign-procedure "nng_http_conn_read_req"  ((* nng_http_conn) (* nng_http_req) (* nng_aio)) void)]) (lambda (conn req aio) (f conn req aio))))
  (define nng_http_conn_read_res  (let ([f (foreign-procedure "nng_http_conn_read_res"  ((* nng_http_conn) (* nng_http_res) (* nng_aio)) void)]) (lambda (conn res aio) (f conn res aio))))
  (define nng_http_req_reset      (let ([f (foreign-procedure "nng_http_req_reset"      ((* nng_http_req)) void)])                               (lambda (req) (f req))))
  (define nng_http_res_reset      (let ([f (foreign-procedure "nng_http_res_reset"      ((* nng_http_res)) void)])                               (lambda (res) (f res))))
  (define-ftype nng_http_handler (struct))
  (define nng_http_handler_alloc              (let ([f (foreign-procedure "nng_http_handler_alloc"              ((* nng_http_handler) string void*) int)])                 (lambda (handler  path cb) (f handler path cb))))
  (define nng_http_handler_free               (let ([f (foreign-procedure "nng_http_handler_free"               ((* nng_http_handler)) void)])                             (lambda (handler) (f handler))))
  (define nng_http_handler_alloc_file         (let ([f (foreign-procedure "nng_http_handler_alloc_file"         ((* nng_http_handler) string string) int)])                (lambda (handler path file-name) (f handler path file-name))))
  (define nng_http_handler_alloc_static       (let ([f (foreign-procedure "nng_http_handler_alloc_static"       ((* nng_http_handler) string void* size_t string) int)])   (lambda (handler path data size content-type) (f handler path data size content-type))))
  (define nng_http_handler_alloc_redirect     (let ([f (foreign-procedure "nng_http_handler_alloc_redirect"     ((* nng_http_handler) string unsigned-16 string) int)])    (lambda (handler path status location) (f handler path status location))))
  (define nng_http_handler_alloc_directory    (let ([f (foreign-procedure "nng_http_handler_alloc_directory"    ((* nng_http_handler) string string) int)])                (lambda (handler path dir-name) (f handler path dir-name))))
  (define nng_http_handler_set_method         (let ([f (foreign-procedure "nng_http_handler_set_method"         ((* nng_http_handler) string) int)])                       (lambda (handler method) (f handler method))))
  (define nng_http_handler_set_host           (let ([f (foreign-procedure "nng_http_handler_set_host"           ((* nng_http_handler) string) int)])                       (lambda (handler host) (f handler host))))
  (define nng_http_handler_collect_body       (let ([f (foreign-procedure "nng_http_handler_collect_body"       ((* nng_http_handler) boolean size_t) int)])               (lambda (handler want maxsz) (f handler want maxsz))))
  (define nng_http_handler_set_tree           (let ([f (foreign-procedure "nng_http_handler_set_tree"           ((* nng_http_handler)) int)])                              (lambda (handler) (f handler))))
  (define nng_http_handler_set_tree_exclusive (let ([f (foreign-procedure "nng_http_handler_set_tree_exclusive" ((* nng_http_handler)) int)])                              (lambda (handler) (f handler))))
  (define nng_http_handler_set_data           (let ([f (foreign-procedure "nng_http_handler_set_data"           ((* nng_http_handler) void* void*) int)])                  (lambda (handler data cb) (f handler data cb))))
  (define nng_http_handler_get_data           (let ([f (foreign-procedure "nng_http_handler_get_data"           ((* nng_http_handler)) void*)])                            (lambda (handler) (f handler))))
  (define-ftype nng_http_server (struct))
  (define nng_http_server_hold           (let ([f (foreign-procedure "nng_http_server_hold"           ((* nng_http_server) (* nng_url)) int)])          (lambda (server url)       (f server url))))
  (define nng_http_server_release        (let ([f (foreign-procedure "nng_http_server_release"        ((* nng_http_server)) void)])                     (lambda (server)           (f server))))
  (define nng_http_server_start          (let ([f (foreign-procedure "nng_http_server_start"          ((* nng_http_server)) int)])                      (lambda (server)           (f server))))
  (define nng_http_server_stop           (let ([f (foreign-procedure "nng_http_server_stop"           ((* nng_http_server)) void)])                     (lambda (server)           (f server))))
  (define nng_http_server_add_handler    (let ([f (foreign-procedure "nng_http_server_add_handler"    ((* nng_http_server) (* nng_http_handler)) int)]) (lambda (server handler)   (f server handler))))
  (define nng_http_server_del_handler    (let ([f (foreign-procedure "nng_http_server_del_handler"    ((* nng_http_server) (* nng_http_handler)) int)]) (lambda (server handler)   (f server handler))))
  (define nng_http_server_set_tls        (let ([f (foreign-procedure "nng_http_server_set_tls"        ((* nng_http_server) (* nng_tls_config)) int)])   (lambda (server cfg)       (f server cfg))))
  (define nng_http_server_get_tls        (let ([f (foreign-procedure "nng_http_server_get_tls"        ((* nng_http_server) (* nng_tls_config)) int)])   (lambda (server cfg)       (f server cfg))))
  (define nng_http_server_get_addr       (let ([f (foreign-procedure "nng_http_server_get_addr"       ((* nng_http_server) (* nng_sockaddr)) int)])     (lambda (server socket)    (f server socket))))
  (define nng_http_server_set_error_page (let ([f (foreign-procedure "nng_http_server_set_error_page" ((* nng_http_server) unsigned-16 string) int)])   (lambda (server code html) (f server code html))))
  (define nng_http_server_set_error_file (let ([f (foreign-procedure "nng_http_server_set_error_file" ((* nng_http_server) unsigned-16 string) int)])   (lambda (server code path) (f server code path))))
  (define nng_http_server_res_error      (let ([f (foreign-procedure "nng_http_server_res_error"      ((* nng_http_server) (* nng_http_res)) int)])     (lambda (server res)       (f server res))))
  (define nng_http_hijack                (let ([f (foreign-procedure "nng_http_hijack"                ((* nng_http_conn)) int)])                        (lambda (conn)             (f conn))))
  ; (alias nni_aio nng_aio)
  (define-ftype nng_http_client
    (struct
      [aios void*]
      [mtx void*]
      [closed boolean]
      [aio void*]
      [dialer void*]
      ))
  (define-ftype nng_http_client* (* nng_http_client))
  ; NNG_DECL int nng_http_client_alloc(nng_http_client **, const nng_url *);
  (define nng-http-client-alloc    (let ([f (foreign-procedure "nng_http_client_alloc"     ((* nng_http_client*) (* nng_url)) int)])                                    (lambda (clientp url)        (f clientp url))))
  (define nng-http-client-free     (let ([f (foreign-procedure "nng_http_client_free"      ((* nng_http_client)) void)])                                               (lambda (client)             (f client))))
  (define nng-http-client-set-tls  (let ([f (foreign-procedure "nng_http_client_set_tls"   ((* nng_http_client) (* nng_tls_config)) int)])                             (lambda (client cfg)         (f client cfg))))
  (define nng-http-client-get-tls  (let ([f (foreign-procedure "nng_http_client_get_tls"   ((* nng_http_client) (* nng_tls_config)) int)])                             (lambda (client cfgp)        (f client cfgp))))
  (define nng-http-client-connect  (let ([f (foreign-procedure "nng_http_client_connect"   ((* nng_http_client) (* nng_aio)) void)])                                   (lambda (client aio)         (f client aio))))
  (define nng-http-conn-transact   (let ([f (foreign-procedure "nng_http_conn_transact"    ((* nng_http_conn) (* nng_http_req) (* nng_http_res) (* nng_aio)) void)])   (lambda (conn req res aio)   (f conn req res aio))))
  (define nng-http-client-transact (let ([f (foreign-procedure "nng_http_client_transact"  ((* nng_http_client) (* nng_http_req) (* nng_http_res) (* nng_aio)) void)]) (lambda (client req res aio) (f client req res aio))))

  )
