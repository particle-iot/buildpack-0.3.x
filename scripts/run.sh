#!/bin/bash
TIME_START=`date +%s.%N`

# Setup constants
export INPUT_DIR=/input
export OUTPUT_DIR=/output
export CACHE_DIR=/cache
export WORKSPACE_DIR=/workspace
# 0.3.x specific
export USER_DIR=workspace
export TARGET=core-firmware
export TARGETDIR=$WORKSPACE_DIR/

# Start logging to file
exec > >(tee $OUTPUT_DIR/run.log)
exec 2> >(tee $OUTPUT_DIR/stderr.log)

FIRMWARE_HASH=`echo -n $FIRMWARE_REPO | md5sum | awk '{ print $1 }'`
FIRMWARE_PATH="$CACHE_DIR/$FIRMWARE_HASH/core-firmware"

# Download fimware to cache dir
mkdir -p "$CACHE_DIR/$FIRMWARE_HASH"
/scripts/clone.sh $FIRMWARE_REPO $FIRMWARE_PATH

# Old firmware requires those two dependencies
# As we won't support this anymore, branches can be hardcoded
/scripts/clone.sh https://github.com/spark/core-common-lib.git#compile-server2 "$FIRMWARE_PATH/../core-common-lib"
/scripts/clone.sh https://github.com/spark/core-communication-lib.git#compile-server2 "$FIRMWARE_PATH/../core-communication-lib"

source /scripts/pre-build.sh
source /scripts/build.sh
source /scripts/post-build.sh

TIME_END=`date +%s.%N`
RUNTIME=`echo "$TIME_END $TIME_START" | awk '{print $1-$2}'`
echo "Finished in: $RUNTIME seconds"
