FROM alpine:3.19.1

RUN apk add --no-cache \
    bash \
    go

WORKDIR /opt

RUN GOBIN=/usr/local/bin/ go install github.com/codesenberg/bombardier@latest

COPY entrypoint.sh .

ENTRYPOINT ["/opt/entrypoint.sh"]
