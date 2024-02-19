echo "Step 1. Installing grpcio-tools"
pip3 install grpcio-tools

echo "Step 2. Generating code by running compile steps"
python3 -m grpc_tools.protoc -I./protos --python_out=. --pyi_out=. --grpc_python_out=. ./protos/*.proto