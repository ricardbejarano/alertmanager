FROM debian AS build

ARG ALERTMANAGER_VERSION="0.18.0"
ARG ALERTMANAGER_CHECKSUM="5f17155d669a8d2243b0d179fa46e609e0566876afd0afb09311a8bc7987ab15"

ADD https://github.com/prometheus/alertmanager/releases/download/v$ALERTMANAGER_VERSION/alertmanager-$ALERTMANAGER_VERSION.linux-amd64.tar.gz /tmp/alertmanager.tar.gz

RUN [ "$ALERTMANAGER_CHECKSUM" = "$(sha256sum /tmp/alertmanager.tar.gz | awk '{print $1}')" ] && \
    tar -C /tmp -xf /tmp/alertmanager.tar.gz && \
    mv /tmp/alertmanager-$ALERTMANAGER_VERSION.linux-amd64 /tmp/alertmanager

RUN apt update && \
    apt install -y ca-certificates


FROM scratch

COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build /tmp/alertmanager/alertmanager.yml /etc/alertmanager/
COPY --from=build /tmp/alertmanager/alertmanager /

COPY rootfs /

USER 100:100
VOLUME ["/data"]
EXPOSE 9093/tcp
ENTRYPOINT ["/alertmanager"]
CMD ["--config.file=/etc/alertmanager/alertmanager.yml"]
