FROM alpine:3.17.3

RUN : \
    && apk update \
    && apk add mariadb-client php php-curl php-json php-xml php-mbstring php-openssl php-phar php-fpm php-mysqli curl --no-cache \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && adduser -S nginx \
    && addgroup -S nginx \
    && :

COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf
COPY ./wp-setup.sh /usr/local/bin/wp-setup
COPY conf/index.html /tmp/index.html

RUN : \
    && chmod +x /usr/local/bin/wp-setup \
    && :

WORKDIR /var/www/html/wordpress

ENTRYPOINT [ "wp-setup" ]

CMD ["php-fpm", "-F"]
