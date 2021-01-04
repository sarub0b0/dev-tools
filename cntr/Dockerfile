# Example for a slim/fat container setup

FROM rust:latest as cntr
RUN rustup target add x86_64-unknown-linux-musl
RUN curl -sL https://github.com/Mic92/docker-pid/releases/download/1.0.0/docker-pid-linux-amd64 \
      > /usr/bin/docker-pid && \
      chmod 755 /usr/bin/docker-pid

RUN cargo install cntr

FROM ubuntu:focal
WORKDIR /var/lib/cntr

ENV DEBIAN_FRONTEND noninteractive

# build-essential
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y build-essential gdb

COPY --from=cntr /usr/local/cargo/bin/cntr /usr/bin/cntr
COPY --from=cntr /usr/bin/docker-pid /usr/bin/docker-pid

ENTRYPOINT ["/usr/bin/cntr"]
