FROM ubuntu:vivid

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install gcc-arm-none-eabi make git
RUN apt-get -y install isomd5sum

ADD . /
VOLUME ["/input", "/ouput", "/cache"]
CMD ["/scripts/run.sh"]
