FROM alpine:3.6

ENV PACKAGES libreswan

RUN apk update && apk add $PACKAGES && rm -rf /var/cache/apk/*

COPY template.conf /tmp/ipsec.conf
COPY template.secrets /tmp/ipsec.secrets

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [/entrypoint.sh]