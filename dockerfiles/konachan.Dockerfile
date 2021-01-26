FROM rust:latest AS builder
WORKDIR /app
COPY . .
RUN rustup component add rustfmt
RUN cargo build --release

FROM rust:alpine
COPY --from=builder /app/target/release/konachan .
EXPOSE 50051
ENTRYPOINT ["./konachan"]
