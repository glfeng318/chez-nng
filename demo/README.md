demos are derived from [nng/demo](https://github.com/nanomsg/nng/tree/master/demo) and [Getting Started with nng](https://nanomsg.org/gettingstarted/nng/index.html) by Tim Dysinger

## http-client
```
scheme --script http-client.ss http://httpbin.org/ip
```

## pipeline
```
# node 0
chez --script ./demo/pipeline.ss ipc:///tmp/pipeline.ipc

# node 1
chez --script ./demo/pipeline.ss ipc:///tmp/pipeline.ipc hello
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
