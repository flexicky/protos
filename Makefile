PROTO_DIR = ./proto
GEN_DIR = ./gen

.PHONY: proto
proto:
	@echo ">> Removing old generated files..."
	@if exist $(GEN_DIR) rmdir /s /q $(GEN_DIR)
	@echo ">> Regenerating gRPC and Protobuf code..."
	@protoc \
		--proto_path=$(PROTO_DIR) \
		--go_out=. --go_opt=paths=source_relative \
		--go-grpc_out=. --go-grpc_opt=paths=source_relative \
		$(PROTO_DIR)/*.proto
	@echo ">> Done!"