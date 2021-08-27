FROM golang:1-alpine AS build

ARG VERSION="0.23.0"
ARG CHECKSUM="62c18c4d6cfc78958b67140dded371b2942fd96841d3d6e29c7c77dfa98e6d6a"

ADD https://github.com/prometheus/alertmanager/archive/v$VERSION.tar.gz /tmp/alertmanager.tar.gz

RUN [ "$(sha256sum /tmp/alertmanager.tar.gz | awk '{print $1}')" = "$CHECKSUM" ] && \
    apk add ca-certificates curl make && \
    tar -C /tmp -xf /tmp/alertmanager.tar.gz && \
    mkdir -p /go/src/github.com/prometheus && \
    mv /tmp/alertmanager-$VERSION /go/src/github.com/prometheus/alertmanager && \
    cd /go/src/github.com/prometheus/alertmanager && \
      make build

RUN mkdir -p /rootfs/bin && \
      cp /go/src/github.com/prometheus/alertmanager/alertmanager /rootfs/bin/ && \
    mkdir -p /rootfs/etc && \
      echo "nogroup:*:10000:nobody" > /rootfs/etc/group && \
      echo "nobody:*:10000:10000:::" > /rootfs/etc/passwd && \
    mkdir -p /rootfs/etc/ssl/certs && \
      cp /etc/ssl/certs/ca-certificates.crt /rootfs/etc/ssl/certs/


FROM scratch

COPY --from=build --chown=10000:10000 /rootfs /

USER 10000:10000
VOLUME ["/data"]
EXPOSE 9093/tcp
ENTRYPOINT ["/bin/alertmanager"]
