# Buildpack for 0.3.x firmware

## Building image

```bash
$ git clone git@github.com:suda/buildpack-0.3.x.git
$ cd buildpack-0.3.x
$ docker build -t particle/buildpack-0.3.x .
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
