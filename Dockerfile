FROM particle/buildpack-arduino-preprocessor:0.0.1

RUN apt-get -y install gcc-arm-none-eabi make isomd5sum

COPY hooks /hooks
ADD workspace /workspace
