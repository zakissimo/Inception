FROM alpine:3.17

COPY ./run-nginx /usr/local/bin/run-nginx

RUN : \
    && apk update \
    && apk add --no-cache openssl nginx \
    && rm -rf /var/cache/apk/* \
    && chmod +x /usr/local/bin/run-nginx \
    && :

ENTRYPOINT ["run-nginx"]
