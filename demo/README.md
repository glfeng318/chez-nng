demos are derived from [nng/demo](https://github.com/nanomsg/nng/tree/master/demo) and [Getting Started with nng](https://nanomsg.org/gettingstarted/nng/index.html) by Tim Dysinger

## http-client
```
scheme --script http-client.ss http://httpbin.org/ip
```

## pubsub-forwarder
```
scheme --script pubsub-forwarder.ss

# in a new terminal
nngcat --sub --dial "tcp://localhost:3328" --quoted
# in a new terminal
nngcat --sub --dial "tcp://localhost:3328" --quoted

# an a new terminal
for n in $(seq 0 99);do nngcat --pub --dial "tcp://localhost:3327" --data "$n";done
```

## raw
```
# start the server
scheme --script raw.ss tcp://127.0.0.1:5555 -s

# start a bunch of clients
# Note that these all run concurrently!
scheme --script raw.ss tcp://127.0.0.1:5555 2 &
scheme --script raw.ss tcp://127.0.0.1:5555 2 &
scheme --script raw.ss tcp://127.0.0.1:5555 2 &
```

## Pipeline (A One-Way Pipe)

![](https://nanomsg.org/gettingstarted/pipeline.png)

This pattern is useful for solving producer/consumer problems, including load-balancing. Messages flow from the push side to the pull side. If multiple peers are connected, the pattern attempts to distribute fairly.

```
# node 0
chez --script ./demo/pipeline.ss ipc:///tmp/pipeline.ipc

# node 1
chez --script ./demo/pipeline.ss ipc:///tmp/pipeline.ipc hello
```

## Request/Reply (I ask, you answer)

![](https://nanomsg.org/gettingstarted/reqrep.png)

Request/Reply is used for synchronous communications where each question is responded with a single answer, for example remote procedure calls (RPCs). Like Pipeline, it also can perform load-balancing. This is the only reliable messaging pattern in the suite, as it automatically will retry if a request is not matched with a response.
```
scheme --script req-rep.ss node0 ipc:///tmp/req-rep.ipc
scheme --script req-rep.ss node1 ipc:///tmp/req-rep.ipc
```

## Pair (Two Way Radio)

![](https://nanomsg.org/gettingstarted/pair.png)

The pair pattern is used when there a one-to-one peer relationship. Only one peer may be connected to another peer at a time, but both may speak freely.

```
scheme --script pair.ss node0 ipc:///tmp/pair.ipc
scheme --script pair.ss node1 ipc:///tmp/pair.ipc
```
