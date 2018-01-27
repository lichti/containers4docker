FROM debian:stable-slim
LABEL maintainer "Gustavo Lichti <gustavo.lichti@gmail.com>"

# docker run -it --rm \
#            -v /tmp/.X11-unix:/tmp/.X11-unix \
#            -v $HOME/Downloads:/home/bank/Downloads \
#            -e DISPLAY=unix$DISPLAY \
#            --name warsaw-browser \
#            lichti/warsaw-browser

COPY start.sh /start.sh

ENV DEBIAN_FRONTEND noninteractive
RUN apt update \
  && apt install -qqy \
  x11-utils \
  x11-apps \
  openssl \
  libcurl3 \
  libnss3-tools \
  apt-transport-https \
  ca-certificates \
  sudo \
  gnupg \
  hicolor-icon-theme \
  libgl1-mesa-dri \
  libgl1-mesa-glx \
  libpango1.0-0 \
  libpulse0 \
  libv4l-0 \
  fonts-symbola \
  xauth \
  language-pack-pt \
  firefox-esr \
  --no-install-recommends \
  && apt clean \
  && rm -rf /var/lib/apt/lists/* \
  && groupadd -g 1000 -r bank \
  && useradd -u 1000 -r -g bank -G audio,video bank \
  && mkdir -p /home/bank/Downloads \
  && chown -R bank:bank /home/bank \
  && echo "bank ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
  && chmod 0440 /etc/sudoers \
  && passwd -d root \
  && chmod 755 /start.sh \
  && ln -s /start.sh /usr/local/bin/start.sh

ADD https://cloud.gastecnologia.com.br/bb/downloads/ws/warsaw_setup64.deb /warsaw_setup64.deb
COPY local.conf /etc/fonts/local.conf

USER bank
ENV HOME /home/bank

ENTRYPOINT ["start.sh"]
