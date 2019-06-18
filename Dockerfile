FROM debian AS build

ARG ALERTMANAGER_VERSION="0.17.0"
ARG ALERTMANAGER_CHECKSUM="7c8d2cfeb021c80881ae9904d959131091b8785b6fda9800f84ddef148fe0a4f"

ADD https://github.com/prometheus/alertmanager/releases/download/v$ALERTMANAGER_VERSION/alertmanager-$ALERTMANAGER_VERSION.linux-amd64.tar.gz /tmp/alertmanager.tar.gz

RUN if [ "$ALERTMANAGER_CHECKSUM" != "$(sha256sum /tmp/alertmanager.tar.gz | awk '{print $1}')" ]; then exit 1; fi && \
    tar -C /tmp -xf /tmp/alertmanager.tar.gz && \
    mv /tmp/alertmanager-$ALERTMANAGER_VERSION.linux-amd64 /tmp/alertmanager

RUN apt update && \
    apt install -y ca-certificates


FROM scratch

COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build /tmp/alertmanager/alertmanager.yml /etc/alertmanager/
COPY --from=build /tmp/alertmanager/alertmanager /

COPY rootfs /

USER alertmanager:alertmanager
VOLUME ["/data"]
EXPOSE 9093/tcp
ENTRYPOINT ["/alertmanager"]
CMD ["--config.file=/etc/alertmanager/alertmanager.yml"]
