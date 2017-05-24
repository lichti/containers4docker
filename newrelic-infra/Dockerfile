FROM debian:jessie

MAINTAINER Gustavo Lichti <gustavo@lichti.com>

RUN apt-get update && \
    apt-get install curl -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -o /tmp/newrelic-infra.gpg  https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg && \
    apt-key add /tmp/newrelic-infra.gpg && \
    rm /tmp/newrelic-infra.gpg

ADD newrelic-infra.list /etc/apt/sources.list.d/

RUN apt-get update && \
    apt-get install newrelic-infra -y 2> /dev/null; \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ADD newrelic-infra.yml /etc/
ENV NRIA_OVERRIDE_HOST_ROOT="/mnt/ROOT"
ENV NRIA_LOGLEVEL="info"
ENV NRIA_VERBOSE=0
ENV NRIA_LICENSE_KEY="null"

CMD ["/usr/bin/newrelic-infra","-config","/etc/newrelic-infra.yml"]
