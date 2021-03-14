build:
	go build -o bin/main.go

run:
	go run main.go

init:
	terraform init infra

plan:
	terraform plan infra

apply:
	terraform apply --auto-approve infra

destroy:
	terraform destroy --auto-approve infra

network: 
	docker network create overlay

compile:
	docker run -d --network overlay --expose 8080 -e GOOS=linux \
	-e GOARCH=amd64 -p 8080:8080 -v $$(pwd):/app -w /app golang:1.13 \
	go run main.go

#	GOOS=freebsd GOARCH=386 go build -o bin/main-freebsd-386 main.go
#	GOOS=linux GOARCH=386 go build -o bin/main-linux-386 main.go
#	GOOS=windows GOARCH=386 go build -o bin/main-windows-386 main.go

all: build run