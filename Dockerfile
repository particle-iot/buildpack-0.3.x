FROM particle/buildpack-base:0.3.4

RUN apk add --no-cache curl make perl && \
  curl -o gcc-arm-none-eabi.tar.bz2 --progress-bar -sSL https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2 && \
  tar xjvf gcc-arm-none-eabi.tar.bz2 -C /usr/local && \
  mv /usr/local/gcc-arm-none-eabi-4_8-2014q3/ /usr/local/gcc-arm-embedded && \
  rm -rf /usr/share/man /tmp/* /var/cache/apk/* \
    gcc-arm-none-eabi.tar.bz2 /usr/local/gcc-arm-embedded/share

ENV PATH /usr/local/gcc-arm-embedded/bin:$PATH
ADD workspace /workspace
ADD bin /bin
