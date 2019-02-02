FROM alpine:3.5

ENV INTERFACES= 

RUN apk add --update --no-cache dhcp

COPY start-dhcp.sh /start-dhcp.sh

VOLUME /var/lib/dhcp

ENTRYPOINT ["/start-dhcp.sh"]