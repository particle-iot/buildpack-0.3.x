#!/bin/bash

INPUT_DIR=/input
OUTPUT_DIR=/ouput
CACHE_DIR=/cache

FIRMWARE_HASH=`echo -n $FIRMWARE_REPO | md5sum | awk '{ print $1 }'`
FIRMWARE_PATH="$CACHE_DIR/$FIRMWARE_HASH/core-firmware"

# Download fimware to cache dir
mkdir -p "$CACHE_DIR/$FIRMWARE_HASH"
/scripts/clone.sh $FIRMWARE_REPO $FIRMWARE_PATH

# Old firmware requires those two dependencies
# As we won't support this anymore, branches can be hardcoded
/scripts/clone.sh https://github.com/spark/core-common-lib.git#compile-server2 "$FIRMWARE_PATH/../core-common-lib"
/scripts/clone.sh https://github.com/spark/core-communication-lib.git#compile-server2 "$FIRMWARE_PATH/../core-communication-lib"
