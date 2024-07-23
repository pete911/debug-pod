FROM golang:1.23rc2-alpine AS build
RUN apk add --no-cache gcc libc-dev git

RUN go install github.com/pete911/certinfo@v1.0.18
RUN go install github.com/pete911/jwt@v1.0.5

FROM alpine:3.20.2

RUN apk add --no-cache curl bind-tools openssl netcat-openbsd iputils busybox-extras jq
COPY --from=build /go/bin/certinfo /bin/certinfo
COPY --from=build /go/bin/jwt /bin/jwt
