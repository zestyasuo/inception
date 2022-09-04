FROM alpine:3.16

RUN apk add --update --no-cache \
	python3 py3-pip openssl

EXPOSE 8443
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools pyTelegramBotAPI 

COPY ./tools/ /var/www/bot

WORKDIR /var/www/bot

CMD python3 bot.py
