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

COPY ./mariadb-setup.sh /usr/local/bin/mariadb-setup

RUN : \
    && chmod +x /usr/local/bin/mariadb-setup \
    && mariadb-setup \
    && :

CMD ["mysqld"]
