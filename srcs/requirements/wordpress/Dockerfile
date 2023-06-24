FROM alpine:3.17

COPY ./run-wp /usr/local/bin/run-wp

RUN : \
    && apk update \
    && apk add --no-cache curl php-phar php-curl php-mysqli php-zip mariadb-client \
    && rm -rf /var/cache/apk/* \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && mkdir -p /var/www/wordpress \
    && chmod +x /usr/local/bin/run-wp \
    && :

WORKDIR /var/www/wordpress

# ENTRYPOINT ["run-wp"]
