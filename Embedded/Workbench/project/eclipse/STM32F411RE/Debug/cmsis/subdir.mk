################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../cmsis/system_stm32f4xx.c 

OBJS += \
./cmsis/system_stm32f4xx.o 

C_DEPS += \
./cmsis/system_stm32f4xx.d 


# Each subdirectory must supply rules for building sources it contributes
cmsis/%.o: ../cmsis/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DUSE_STDPERIPH_DRIVER -DSTM32F411xE -I"/home/freeysh/eclipse-workspace/stm32f4xx/cmsis" -I"/home/freeysh/eclipse-workspace/stm32f4xx/libraries/inc" -I"/home/freeysh/eclipse-workspace/stm32f4xx/user" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


