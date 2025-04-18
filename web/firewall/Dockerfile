FROM ubuntu
RUN apt update && apt install -y apache2 iptables iproute2 curl && apt clean
EXPOSE 80
CMD service apache2 start && tail -f /dev/null
