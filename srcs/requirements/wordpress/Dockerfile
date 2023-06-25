FROM alpine:3.17

COPY ./run-wp /usr/local/bin/run-wp

RUN : \
    && apk update \
    && apk add --no-cache curl php-curl php-fpm php-mbstring php-mysqli php-phar php-zip mariadb-client \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /var/www/wordpress \
    && chmod +x /usr/local/bin/run-wp \
    && :

WORKDIR /var/www/wordpress

ENTRYPOINT ["run-wp"]
