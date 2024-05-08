;; This example shows how to use raw sockets to set up a forwarder or proxy for
;; pub/sub.
;;
;; An example setup for running this example would involve the following:
;;
;;  - Run this example `scheme --script nng-pubsub-forwarder.ss` (in the background or a terminal, etc)
;;  - In a new terminal, run `nngcat --sub --dial "tcp://localhost:3328" --quoted`
;;  - In a new terminal, run `nngcat --sub --dial "tcp://localhost:3328" --quoted`
;;  - In a new terminal, run `for n in $(seq 0 99);do nngcat --pub --dial "tcp://localhost:3327" --data "$n";done`

(library-directories "lib")
(import (libnng nng))

(define (panic-on-error r msg)
  (unless (= r 0)
    (error "~s: ~d => ~a\n" msg r (nng-strerror r))))

(define socket-front (make-ftype-pointer nng_socket (foreign-alloc (ftype-sizeof nng_socket))))
(define socket-back (make-ftype-pointer nng_socket (foreign-alloc (ftype-sizeof nng_socket))))
(ftype-set! nng_socket (id) socket-front NNG_SOCKET_INITIALIZER)
(ftype-set! nng_socket (id) socket-back NNG_SOCKET_INITIALIZER)

(define ls-front (make-ftype-pointer nng_listener (foreign-alloc (ftype-sizeof nng_listener))))
(define ls-back (make-ftype-pointer nng_listener (foreign-alloc (ftype-sizeof nng_listener))))
(ftype-set! nng_listener (id) ls-front NNG_LISTENER_INITIALIZER)
(ftype-set! nng_listener (id) ls-back NNG_LISTENER_INITIALIZER)

(panic-on-error (nng-sub-open-raw socket-front) "Failed to open front end socket")
(panic-on-error (nng-pub-open-raw socket-back) "Failed to open back end socket")
(panic-on-error (nng-listener-create ls-front socket-front "tcp://localhost:3327") "Failed to create front listener")
(panic-on-error (nng-listener-create ls-back socket-back "tcp://localhost:3328") "Failed to create back listener")

(panic-on-error (nng-listener-start ls-front 0) "Failed to start front listener")
(panic-on-error (nng-listener-start ls-back 0) "Failed to start back listener")

(panic-on-error (nng-device socket-front socket-back) "Failed to connect sockets with nng-device")


(printf "done\n")
