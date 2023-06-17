FROM alpine:3.17.3

RUN : \
    && apk update \
    && apk add php php-curl php-json php-xml php-mbstring php-openssl php-phar php-fpm curl \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /var/www/html \
    && cd /var/www/html \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && wp core download --allow-root \
    && :

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["php-fpm"]
