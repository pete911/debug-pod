FROM golang:1.16.3-alpine AS build
RUN apk add --no-cache gcc libc-dev git

RUN GO111MODULE=on go get github.com/pete911/certinfo@0.12

FROM alpine:3.12

RUN apk add --no-cache curl bind-tools openssl netcat-openbsd iputils busybox-extras
COPY --from=build /go/bin/certinfo /bin/certinfo
