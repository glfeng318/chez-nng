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

(define (panic-on-error r who)
  (unless (= r 0)
    (error who (nng-strerror r))))

(define socket-front (nng-socket-initializer))
(define socket-back (nng-socket-initializer))

(define ls-front (nng-listener-initializer))
(define ls-back (nng-listener-initializer))

(panic-on-error (nng-sub-open-raw socket-front) "Failed to open front end socket")
(panic-on-error (nng-pub-open-raw socket-back) "Failed to open back end socket")
(panic-on-error (nng-listener-create ls-front socket-front "tcp://localhost:3327") "Failed to create front listener")
(panic-on-error (nng-listener-create ls-back socket-back "tcp://localhost:3328") "Failed to create back listener")

(panic-on-error (nng-listener-start ls-front 0) "Failed to start front listener")
(panic-on-error (nng-listener-start ls-back 0) "Failed to start back listener")

; (panic-on-error (nng-device socket-front socket-back) "Failed to connect sockets with nng-device")

(fork-thread (lambda () (panic-on-error (nng-device socket-front socket-back) "Failed to connect sockets with nng-device")))
(fork-thread (lambda () (system "sleep 1") (system "nngcat --sub --dial \"tcp://localhost:3328\" --quoted")))
(fork-thread (lambda () (system "sleep 1") (system "nngcat --sub --dial \"tcp://localhost:3328\" --quoted")))
(thread-join (fork-thread (lambda () (system "sleep 2") (system "for n in $(seq 1 10);do nngcat --pub --dial \"tcp://localhost:3327\" --data \"$n\";done"))))

(printf "done\n")
