#!/bin/bash

for file in $FIRMWARE_PATH/build/*.bin; do cp $file $OUTPUT_DIR;done
arm-none-eabi-size $FIRMWARE_PATH/build/core-firmware.elf > $OUTPUT_DIR/memory-use.log
