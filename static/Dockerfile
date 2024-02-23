FROM golang:1.22.0-alpine3.19 as base

FROM base as builder

WORKDIR /opt

COPY webserver.go .

RUN go build -o webserver webserver.go

FROM busybox

WORKDIR /opt

COPY favicon.ico .
COPY hello.txt .
COPY --from=builder /opt/webserver .

ENTRYPOINT ["/opt/webserver"]

HEALTHCHECK --interval=1s --timeout=1s --retries=3 CMD wget --no-verbose --tries=1 --spider http://localhost:8080/hello.txt || exit 1
