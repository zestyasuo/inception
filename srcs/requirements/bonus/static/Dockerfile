FROM alpine:3.16
ENV PYTHONUNBUFFERED=1

RUN apk add --update --no-cache \
	python3 py3-pip make 

EXPOSE 8000
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools pelican Markdown
COPY ./src/ /var/www/html/pelican
WORKDIR /var/www/html/pelican/

# RUN make publish 
CMD make html devserver-global
