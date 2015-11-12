FROM particle/buildpack-wiring-preprocessor:0.0.3

RUN apt-get update
RUN apt-get -y install gcc-arm-none-eabi make isomd5sum

COPY hooks /hooks
ADD workspace /workspace
