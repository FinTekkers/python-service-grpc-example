# Steps

## Install dependencies and compile code

Run: 

`./compile.sh`

This will generate some python files called compile_*.py:

compiled_helloworld_pb2.py - The proto contents copmiled into Python. Note: it uses a lot of auto-wiring code so is not very readable
compiled_helloworld_pb2.pyi - An interface file that provides help understanding the compiled output
compiled_helloworld_pb2_grpc.py - A stubbed version of the GRPC service that can be imported and implemented

## Run Server

`python3 handcoded_server.py`

This code is handcoded (hence the name). Notice that the server extends the GRPC compiled definition called Greeter Servicer:


```
class Greeter(compiled_helloworld_pb2_grpc.GreeterServicer):
    def SayHello(self, request, context):
        return compiled_helloworld_pb2.HelloReply(message="Hello, %s!" % request.name)
```

The greeter service implements all the methods and throws an error saying unimplemented. So the handcoded version simply overrides this and implements a behavior. 

The other service endpoints could be called but will claim of being unimplemented.

## Run Client

Run 

`python3 handcoded_client.py`

Constructs a proto and sends it to the server
