################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../user/main.c \
../user/stm32f4xx_it.c 

OBJS += \
./user/main.o \
./user/stm32f4xx_it.o 

C_DEPS += \
./user/main.d \
./user/stm32f4xx_it.d 


# Each subdirectory must supply rules for building sources it contributes
user/%.o: ../user/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DUSE_STDPERIPH_DRIVER -DSTM32F411xE -I"/home/freeysh/eclipse-workspace/stm32f4xx/cmsis" -I"/home/freeysh/eclipse-workspace/stm32f4xx/libraries/inc" -I"/home/freeysh/eclipse-workspace/stm32f4xx/user" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


