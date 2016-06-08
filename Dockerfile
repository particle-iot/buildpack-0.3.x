FROM particle/buildpack-base:0.3.6

RUN dpkg --add-architecture i386 \
  && apt-get update -q && apt-get install -qy make bzip2 libc6:i386 \
  && curl -o /tmp/gcc-arm-none-eabi.tar.bz2 -sSL https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2 \
  && tar xjvf /tmp/gcc-arm-none-eabi.tar.bz2 -C /usr/local \
  && mv /usr/local/gcc-arm-none-eabi-4_8-2014q3/ /usr/local/gcc-arm-embedded \
  && apt-get remove -qy bzip2 && apt-get clean && apt-get purge \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/local/gcc-arm-embedded/share

ENV PATH /usr/local/gcc-arm-embedded/bin:$PATH
ADD workspace /workspace
ADD bin /bin
