#!/bin/bash

for file in $WORKSPACE_DIR/*.bin; do cp $file $OUTPUT_DIR;done
arm-none-eabi-size $WORKSPACE_DIR/core-firmware.elf > $OUTPUT_DIR/memory-use.log
