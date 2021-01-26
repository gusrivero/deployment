FROM rust:latest AS builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM rust:alpine
COPY --from=builder /app/main .
EXPOSE 50051
ENTRYPOINT ["./konachan"]
