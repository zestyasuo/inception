FROM alpine:3.16

RUN apk --update --no-cache add \
	redis

EXPOSE 6379
RUN mkdir /etc/redis
RUN mkdir /var/redis
COPY ./tools/start.sh /tmp/start.sh

CMD sh /tmp/start.sh