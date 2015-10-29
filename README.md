# Buildpack for 0.3.x firmware
Buildpack for legacy (0.3.x) Particle firmware.

[![Build Status](https://magnum.travis-ci.com/spark/buildpack-0.3.x.svg?token=M4rP8W5QPGszZyem6TGE&branch=master)](https://magnum.travis-ci.com/spark/buildpack-0.3.x)

| |
|---|
|  [Particle firmware](https://github.com/spark/firmware-buildpack-builder)  |
| [HAL](https://github.com/spark/buildpack-hal) / **Legacy (you are here)** |
| [Wiring preprocessor](https://github.com/spark/buildpack-arduino-preprocessor) |
| [Base](https://github.com/spark/buildpack-base) |

This image inherits [Wiring preprocessor](https://github.com/spark/buildpack-arduino-preprocessor) and calls [`preprocess-ino` function](https://github.com/spark/buildpack-arduino-preprocessor#running) before doing build.

## Building image

**Before building this image, build or pull [buildpack-arduino-preprocessor](https://github.com/spark/buildpack-arduino-preprocessor).**

```bash
$ export BUILDPACK_IMAGE=0.3.x
$ git clone "git@github.com:spark/buildpack-${BUILDPACK_IMAGE}.git"
$ cd buildpack-$BUILDPACK_IMAGE
$ docker build -t particle/buildpack-$BUILDPACK_IMAGE .
```

## Running

```bash
$ mkdir -p ~/tmp/input && mkdir -p ~/tmp/output && mkdir -p ~/tmp/cache
$ docker run --rm \
  --privileged \
  -v ~/tmp/input:/input \
  -v ~/tmp/output:/output \
  -v ~/tmp/cache:/cache \
  -e FIRMWARE_REPO=https://github.com/spark/core-firmware.git#compile-server2 \
  particle/buildpack-0.3.x
```

### Input files
Source files have to be placed in `~/tmp/input`

### Output files
After build `~/tmp/output` will be propagated with:

* `run.log` - `stdout` combined with `stderr`
* `stderr.log` - contents of `stderr`, usefull to parse `gcc` errors

**Files only available if compilation succeeds:**
* `firmware.bin` - compiled firmware
* `memory-use.log` - firmware memory use
