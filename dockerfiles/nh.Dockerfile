FROM golang:latest AS builder
WORKDIR /app
COPY . .
RUN go build main.go

FROM scratch
COPY --from=builder /app/main .
EXPOSE 50051
ENTRYPOINT ["./main"]
