FROM debian:stable-slim
LABEL maintainer "Gustavo Lichti <gustavo.lichti@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
RUN apt update \
  && apt install -qqy strongswan iptables bash openrc procps kmod \
	&& rm -rf /var/lib/apt/lists/* 

COPY template.conf /tmp/ipsec.conf
COPY template.secrets /tmp/ipsec.secrets

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]