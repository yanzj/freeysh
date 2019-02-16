################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../bsp/src/common.c \
../bsp/src/delay.c \
../bsp/src/gpio.c \
../bsp/src/rcc.c \
../bsp/src/usart1.c 

OBJS += \
./bsp/src/common.o \
./bsp/src/delay.o \
./bsp/src/gpio.o \
./bsp/src/rcc.o \
./bsp/src/usart1.o 

C_DEPS += \
./bsp/src/common.d \
./bsp/src/delay.d \
./bsp/src/gpio.d \
./bsp/src/rcc.d \
./bsp/src/usart1.d 


# Each subdirectory must supply rules for building sources it contributes
bsp/src/%.o: ../bsp/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DSTM32F10X_HD -DUSE_STDPERIPH_DRIVER -I"/home/ysh/eclipse-workspace/f103c8t6/bsp/inc" -I"/home/ysh/eclipse-workspace/f103c8t6/cmsis" -I"/home/ysh/eclipse-workspace/f103c8t6/libraries/inc" -I"/home/ysh/eclipse-workspace/f103c8t6/user" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


