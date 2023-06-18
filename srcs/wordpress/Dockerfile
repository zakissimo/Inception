FROM alpine:3.17.3

RUN : \
    && apk update \
    && apk add php php-curl php-json php-xml php-mbstring php-openssl php-phar php-fpm php-mysqli curl \
    && rm -rf /var/cache/apk/* \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && :

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]

CMD ["php-fpm", "-F"]
