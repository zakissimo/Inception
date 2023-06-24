FROM alpine:3.17

COPY ./run-mariadb /usr/local/bin/run-mariadb

RUN : \
    && apk update \
    && apk add --no-cache mariadb mariadb-client mariadb-server-utils \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld \
    && mkdir -p /var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql \
    && chmod +x /usr/local/bin/run-mariadb \
    && :

ENTRYPOINT ["run-mariadb"]
