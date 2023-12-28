FROM golang:1.21 AS builder

# Magic line, notice in use that the lib name is different!
RUN apt-get update 
RUN apt-get install -y gcc-aarch64-linux-gnu
RUN apt-get install -y mingw-w64

WORKDIR /app
RUN CGO_ENABLED=1 CC=aarch64-linux-gnu-gcc GOOS=linux GOARCH=arm64 go build -o app .

