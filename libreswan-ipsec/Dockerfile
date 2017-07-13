FROM alpine:3.3

ENV PACKAGES "libreswan"

RUN apk add --update $PACKAGES && rm -rf /var/cache/apk/*

COPY template.conf /tmp/ipsec.conf
COPY template.secrets /tmp/ipsec.secrets

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [/entrypoint.sh]