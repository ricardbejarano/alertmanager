FROM golang:1-alpine AS build

ARG VERSION="0.21.0"
ARG CHECKSUM="1e7749588de13ff3dcf90bd7813ada69b92f5469c15d5dface19d1a279480e50"

ADD https://github.com/prometheus/alertmanager/archive/v$VERSION.tar.gz /tmp/alertmanager.tar.gz

RUN [ "$CHECKSUM" = "$(sha256sum /tmp/alertmanager.tar.gz | awk '{print $1}')" ] && \
    mkdir -p /go/src/github.com/prometheus && \
    tar -C /go/src/github.com/prometheus -xf /tmp/alertmanager.tar.gz && \
    apk add \
    	ca-certificates \
    	curl \
    	make && \
    cd /go/src/github.com/prometheus/alertmanager-$VERSION && \
      make build

RUN mkdir -p /rootfs/bin /rootfs/etc/ssl/certs /rootfs/data && \
    cp /go/src/github.com/prometheus/alertmanager-$VERSION/alertmanager /rootfs/bin/ && \
    echo "nogroup:*:10000:nobody" > /rootfs/etc/group && \
    echo "nobody:*:10000:10000:::" > /rootfs/etc/passwd && \
    cp /etc/ssl/certs/ca-certificates.crt /rootfs/etc/ssl/certs/


FROM scratch

COPY --from=build --chown=10000:10000 /rootfs /

USER 10000:10000
VOLUME ["/data"]
EXPOSE 9093/tcp
ENTRYPOINT ["/bin/alertmanager"]
