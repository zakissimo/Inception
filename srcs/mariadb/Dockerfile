FROM alpine:3.17.3

RUN : \
    && addgroup -S mysql && adduser root mysql \
    && apk update \
    && apk add mariadb mariadb-common mariadb-server-utils mariadb-client \
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/lib/mysql \
    && mkdir -p /var/lib/mysql /var/run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld \
    && :


# COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint
#
# ENTRYPOINT ["docker-entrypoint"]
