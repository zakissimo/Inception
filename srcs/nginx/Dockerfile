FROM alpine:3.17

COPY ./nginx-setup /usr/local/bin/nginx-setup

RUN : \
    && apk update \
    && apk upgrade \
    && apk add openssl curl nginx --no-cache \
    && chmod +x /usr/local/bin/nginx-setup \
    && :

ENTRYPOINT ["nginx-setup"]
