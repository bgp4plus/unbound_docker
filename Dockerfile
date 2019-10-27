FROM alpine:latest
EXPOSE 53 53/udp
COPY ./conf/unbound.conf /etc/unbound/unbound.conf
RUN set -x && \
  apk add -U --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main unbound && \
  curl -L internic.net/domain/named.cache -o /etc/unbound/named.cache && \
  /usr/sbin/unbound-anchor -a /etc/unbound/root.key; \
  chown -R unbound:unbound /etc/unbound
CMD [ "/usr/sbin/unbound", "-c", "/etc/unbound/unbound.conf", "-d"]