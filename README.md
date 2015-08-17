# Buildpack for 0.3.x firmware
In little bit more than 100 lines of code.

## Building image

**Before building this image, build [buildpack-base](https://github.com/suda/buildpack-base).**

```bash
$ export BUILDPACK_IMAGE=0.3.x
$ git clone "git@github.com:suda/buildpack-${BUILDPACK_IMAGE}.git"
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

**Files only available if compilation succeeded:**
* `core-firmware.bin` - compiled firmware
* `memory-use.log` - firmware memory use
