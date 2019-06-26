FROM alpine:3.9.4
VOLUME ["./log",/var/log]
EXPOSE 53
RUN apk --update add unbound curl bind-tools ldns
RUN curl -L https://internic.net/domain/named.cache -o /etc/unbound/root.hints
RUN touch /var/log/unbound.log
COPY ./conf/unbound.conf /etc/unbound
CMD [ "/usr/sbin/unbound","-c","/etc/unbound/unbound.conf" ]