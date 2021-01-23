# Dockerfile: hombre-minica

FROM hombrelab/hombre-golang AS builder

RUN apk add --no-cache \
    git \
    build-base

RUN go get github.com/jsha/minica

FROM hombrelab/hombre-alpine

ARG version

LABEL version="${version}"
LABEL description="Customized Minica (private registrar) Docker image"
LABEL maintainer="Hombrelab <me@hombrelab.com>"
LABEL inspiration="getting things done my way"

COPY --from=builder /go/bin/minica /usr/bin/minica

RUN mkdir /output

WORKDIR /output

ENTRYPOINT ["/usr/bin/minica"]