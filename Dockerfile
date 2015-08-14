FROM particle/buildpack-base

RUN apt-get -y install gcc-arm-none-eabi make isomd5sum

ADD . /
