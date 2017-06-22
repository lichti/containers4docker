FROM debian:stable-slim
LABEL maintainer "Gustavo Lichti <gustavo.lichti@gmail.com>"

# docker run -it --rm \
#            -v /tmp/.X11-unix:/tmp/.X11-unix \
#            -v $HOME/Downloads:/home/bank/Downloads \
#            -e DISPLAY=unix$DISPLAY \
#            --name warsaw-browser \
#            lichti/warsaw-browser

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
  firefox-esr \
  && apt clean \
	&& rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 -r bank
RUN useradd -u 1000 -r -g bank -G audio,video bank
RUN mkdir -p /home/bank
RUN chown -R bank:bank /home/bank
RUN echo "bank ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN chmod 0440 /etc/sudoers
RUN passwd -d root

ADD https://cloud.gastecnologia.com.br/bb/downloads/ws/warsaw_setup64.deb /warsaw_setup64.deb
COPY start.sh /start.sh
COPY local.conf /etc/fonts/local.conf

RUN chmod 755 /start.sh
RUN ln -s /start.sh /usr/local/bin/start.sh

USER bank
ENV HOME /home/bank

ENTRYPOINT ["start.sh"]
