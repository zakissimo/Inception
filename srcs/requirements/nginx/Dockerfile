FROM alpine:3.17.3

RUN : \
    && apk update \
    && apk add openssl curl ca-certificates --no-cache \
    && printf "%s%s%s%s\n" \
        "@nginx " \
        "http://nginx.org/packages/alpine/v" \
        `egrep -o '^[0-9]+\.[0-9]+' /etc/alpine-release` \
        "/main" \
        | tee -a /etc/apk/repositories \
    && curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub \
    && mv /tmp/nginx_signing.rsa.pub /etc/apk/keys \
    && apk add nginx@nginx --no-cache \
    && mkdir -p /var/www/html \
    && openssl req \
        -x509 \
        -nodes \
        -days 365 \
        -newkey rsa:2048 \
        -out /etc/ssl/certs/nginx-selfsigned.crt \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
        -subj "/C=FR/L=ANG/O=42/OU=stud/CN=zhabri" \
    && :

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

RUN echo "Hello World" > /var/www/html/index.html

CMD ["nginx", "-g", "daemon off;"]
