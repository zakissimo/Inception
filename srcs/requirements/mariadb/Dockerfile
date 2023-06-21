FROM alpine:3.17.3

RUN : \
    && apk update \
    && apk add mariadb mariadb-client --no-cache \
    && :

COPY ./mariadb-setup.sh /usr/local/bin/mariadb-setup

RUN : \
    && chmod +x /usr/local/bin/mariadb-setup \
    && :

ENTRYPOINT [ "mariadb-setup" ]

CMD ["mysqld", "--user=mysql", "--console"]
