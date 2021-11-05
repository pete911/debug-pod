FROM golang:1.17.3-alpine AS build
RUN apk add --no-cache gcc libc-dev git

RUN GO111MODULE=on go get github.com/pete911/certinfo@v1.0.0
RUN GO111MODULE=on go get github.com/pete911/jwt@v1.0.2

FROM alpine:3.14.2

RUN apk add --no-cache curl bind-tools openssl netcat-openbsd iputils busybox-extras
COPY --from=build /go/bin/certinfo /bin/certinfo
COPY --from=build /go/bin/jwt /bin/jwt

