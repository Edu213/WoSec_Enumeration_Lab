FROM alpine

# Upgrade existing packages in the base image
RUN apk --no-cache upgrade
# Install apache from packages with out caching install files
RUN apk add --no-cache apache2
CMD ["-D","FOREGROUND"]
# Srart httpd when container runs
ENTRYPOINT ["/usr/sbin/httpd"]
