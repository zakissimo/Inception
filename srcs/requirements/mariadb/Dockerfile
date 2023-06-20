FROM alpine:3.17.3

RUN : \
    && apk update \
    && apk add mariadb mariadb-common mariadb-server-utils mariadb-client \
    && addgroup root mysql \
    && rm -rf /var/cache/apk/* /var/lib/mysql /etc/my.cnf \
    && mkdir -p /var/lib/mysql /var/run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld \
    && :

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]

CMD ["mysqld"]
