FROM alpine:latest

RUN apk update && apk add --no-cache iptables curl apache2

COPY upfw.sh /upfw.sh
RUN chmod +x /upfw.sh

RUN mkdir -p /run/apache2

CMD /usr/sbin/httpd -D FOREGROUND & /upfw.sh && tail -f /dev/null
