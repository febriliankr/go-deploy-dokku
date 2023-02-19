FROM golang:1.19

LABEL version="1.0"

LABEL maintainer="Febrilian <febrilian.kr@gmail.com>"

WORKDIR $GOPATH/src/github.com/febriliankr/go-deploy-dokku

COPY . .

RUN go mod download

RUN go mod verify

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin main.go

EXPOSE 8080

ENTRYPOINT ["/go/bin"]
