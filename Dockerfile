FROM golang:latest AS builder

WORKDIR /src

COPY rocks.go /src

RUN go build rocks.go

FROM hello-world
COPY --from=builder /src/rocks .

ENTRYPOINT ["./rocks" ]
