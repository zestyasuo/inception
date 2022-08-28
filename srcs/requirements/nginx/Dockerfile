FROM alpine:3.16

RUN	apk update && apk upgrade && apk add --no-cache \
        nginx \
        openssl

COPY ./tools/start.sh /var/www/start.sh
COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf
# COPY ./conf/index.html /var/www/index.html

EXPOSE 443
CMD [ "sh", "/var/www/start.sh" ]