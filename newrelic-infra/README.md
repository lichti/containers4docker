newrelic-infra
==============

Building
--------
```
$ docker build -t lichti/newrelic-infra .
    Sending build context to Docker daemon 8.192 kB
    Step 1/12 : FROM debian:jessie
    ---> 978d85d02b87
    Step 2/12 : MAINTAINER Gustavo Lichti <gustavo@lichti.com>
    ---> Using cache
    ---> e13882edf08d
    Step 3/12 : RUN apt-get update &&     apt-get install curl -y &&     apt-get clean && rm -rf /var/lib/apt/lists/*
    ---> Using cache
    ---> 52afec108e76
    Step 4/12 : RUN curl -o /tmp/newrelic-infra.gpg  https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg &&         apt-key add /tmp/newrelic-infra.gpg &&     rm /tmp/newrelic-infra.gpg
    ---> Using cache
    ---> 63dcd860ed95
    Step 5/12 : ADD newrelic-infra.list /etc/apt/sources.list.d/
    ---> Using cache
    ---> 3770ba13acef
    Step 6/12 : RUN apt-get update &&     apt-get install newrelic-infra -y 2> /dev/null;     apt-get clean && rm -rf     /var/lib/apt/lists/*
    ---> Using cache
    ---> e0d47e76a8cf
    Step 7/12 : ADD newrelic-infra.yml /etc/
    ---> Using cache
    ---> 1a6e2cbe3c98
    Step 8/12 : ENV NRIA_OVERRIDE_HOST_ROOT "/mnt/ROOT"
    ---> Running in e57e81bd3f8f
    ---> 61c63dbd3ada
    Removing intermediate container e57e81bd3f8f
    Step 9/12 : ENV NRIA_LOGLEVEL "info"
    ---> Running in 7536157d248f
    ---> a3db3095d356
    Removing intermediate container 7536157d248f
    Step 10/12 : ENV NRIA_VERBOSE 0
    ---> Running in 270ca3462462
    ---> bed0ed5a930a
    Removing intermediate container 270ca3462462
    Step 11/12 : ENV NRIA_LICENSE_KEY "null"
    ---> Running in 79133582b805
    ---> 0b894b1e1292
    Removing intermediate container 79133582b805
    Step 12/12 : CMD /usr/bin/newrelic-infra -config /etc/newrelic-infra.yml
    ---> Running in 4bbf7e2c1c1b
    ---> 0dd8f4bbb901
    Removing intermediate container 4bbf7e2c1c1b
    Successfully built 0dd8f4bbb901
```
Running
-------
```
docker run --rm \
       --uts=host \
       --pid=host \
       --net=host \
       --privileged=true \
       -e NRIA_LICENSE_KEY="$YOUR_KEY" \
       -v /sys:/sys \
       -v /dev:/dev \
       -v /var/run/docker.sock:/var/run/docker.sock \
       -v /var/log:/var/log:rw \
       -v /:/mnt/ROOT:ro \
       lichti/nr-infra-teste
```
