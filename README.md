# Buildpack for 0.3.x firmware
Buildpack for legacy (0.3.x) Particle firmware.

[![Build Status](https://travis-ci.org/particle-iot/buildpack-0.3.x.svg)](https://travis-ci.org/particle-iot/buildpack-0.3.x) [![](https://imagelayers.io/badge/particle/buildpack-0.3.x:latest.svg)](https://imagelayers.io/?images=particle/buildpack-0.3.x:latest 'Get your own badge on imagelayers.io')

| |
|---|
|  [Particle firmware](https://github.com/particle-iot/firmware-buildpack-builder)  |
| [HAL](https://github.com/particle-iot/buildpack-hal) / **Legacy (you are here)** |
| [Base](https://github.com/particle-iot/buildpack-base) |

This image inherits [base buildpack](https://github.com/particle-iot/buildpack-base).

## Building image

**Before building this image, build or pull [buildpack-base](https://github.com/particle-iot/buildpack-base).**

```bash
$ export BUILDPACK_IMAGE=0.3.x
$ git clone "git@github.com:particle-iot/buildpack-${BUILDPACK_IMAGE}.git"
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
  -e FIRMWARE_REPO=https://github.com/particle-iot/core-firmware.git#compile-server2 \
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
