generate-rpc:
	protoc --go_out=generated/protobuf/api --go-grpc_out=generated/protobuf/api protobuf/finances/schema.proto