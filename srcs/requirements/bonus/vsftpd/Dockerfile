FROM alpine:3.16

RUN apk update\
	&& apk upgrade\
	&& apk add --no-cache \
	vsftpd

EXPOSE 20
EXPOSE 21
EXPOSE 990
COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN mkdir -p /var/www/ftp/
RUN adduser zyasuo --disabled-password
RUN echo "zyasuo:123123" | /usr/sbin/chpasswd &> dev/null
RUN mkdir -p var/www/ftp/files
RUN touch /var/www/ftp/files/test.md
RUN chown -R zyasuo:zyasuo /var/www/ftp
RUN echo zyasuo | tee -a /etc/vsftpd.userlist &> dev/null
# RUN chmod a-w /var/www/ftp
RUN echo "Test file " > /var/www/ftp/files/test.md

CMD /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
