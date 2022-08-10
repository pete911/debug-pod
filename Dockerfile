FROM golang:1.19.0-alpine AS build
RUN apk add --no-cache gcc libc-dev git

RUN go install github.com/pete911/certinfo@v1.0.7
RUN go install github.com/pete911/jwt@v1.0.3

FROM alpine:3.16.2

RUN apk add --no-cache curl bind-tools openssl netcat-openbsd iputils busybox-extras
COPY --from=build /go/bin/certinfo /bin/certinfo
COPY --from=build /go/bin/jwt /bin/jwt

