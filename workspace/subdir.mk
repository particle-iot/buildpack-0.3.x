# Add inputs and outputs from these tool invocations to the build variables
$(info Compiling workspace)
CPP_SRCS += $(shell find $(INPUT_DIR) -name *.cpp)
ALLOBJ   += $(CPP_SRCS:$(INPUT_DIR)/%.cpp=$(WORKSPACE_DIR)/%.o)
ALLDEPS += $(CPP_SRCS:$(INPUT_DIR)/%.cpp=$(WORKSPACE_DIR)/%.d)

$(info $(CPP_SRCS))
# Each subdirectory must supply rules for building sources it contributes
$(WORKSPACE_DIR)/%.o: $(INPUT_DIR)/%.cpp
	@echo 'Building user file: $<'
	arm-none-eabi-g++ -DUSE_STDPERIPH_DRIVER -DSTM32F10X_MD -DDFU_BUILD_ENABLE -DSPARK -I"../../core-common-lib/CMSIS/Include" -I"../../core-common-lib/CMSIS/Device/ST/STM32F10x/Include" -I"../../core-common-lib/STM32F10x_StdPeriph_Driver/inc" -I"../../core-common-lib/STM32_USB-FS-Device_Driver/inc" -I"../../core-common-lib/CC3000_Host_Driver" -I"../../core-common-lib/SPARK_Firmware_Driver/inc" -I"../../core-common-lib/SPARK_Services/inc" -I"../libraries" -I"../../core-communication-lib/lib/tropicssl/include" -I"../../core-communication-lib/src" -I"../inc" -Os -ffunction-sections -Wall -std=gnu++0x -fno-exceptions -fno-rtti -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -mcpu=cortex-m3 -mthumb -g3 -gdwarf-2 -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '
