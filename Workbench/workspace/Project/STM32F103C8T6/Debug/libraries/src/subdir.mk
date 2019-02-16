################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libraries/src/misc.c \
../libraries/src/stm32f10x_adc.c \
../libraries/src/stm32f10x_bkp.c \
../libraries/src/stm32f10x_can.c \
../libraries/src/stm32f10x_cec.c \
../libraries/src/stm32f10x_crc.c \
../libraries/src/stm32f10x_dac.c \
../libraries/src/stm32f10x_dbgmcu.c \
../libraries/src/stm32f10x_dma.c \
../libraries/src/stm32f10x_exti.c \
../libraries/src/stm32f10x_flash.c \
../libraries/src/stm32f10x_fsmc.c \
../libraries/src/stm32f10x_gpio.c \
../libraries/src/stm32f10x_i2c.c \
../libraries/src/stm32f10x_iwdg.c \
../libraries/src/stm32f10x_pwr.c \
../libraries/src/stm32f10x_rcc.c \
../libraries/src/stm32f10x_rtc.c \
../libraries/src/stm32f10x_sdio.c \
../libraries/src/stm32f10x_spi.c \
../libraries/src/stm32f10x_tim.c \
../libraries/src/stm32f10x_usart.c \
../libraries/src/stm32f10x_wwdg.c 

OBJS += \
./libraries/src/misc.o \
./libraries/src/stm32f10x_adc.o \
./libraries/src/stm32f10x_bkp.o \
./libraries/src/stm32f10x_can.o \
./libraries/src/stm32f10x_cec.o \
./libraries/src/stm32f10x_crc.o \
./libraries/src/stm32f10x_dac.o \
./libraries/src/stm32f10x_dbgmcu.o \
./libraries/src/stm32f10x_dma.o \
./libraries/src/stm32f10x_exti.o \
./libraries/src/stm32f10x_flash.o \
./libraries/src/stm32f10x_fsmc.o \
./libraries/src/stm32f10x_gpio.o \
./libraries/src/stm32f10x_i2c.o \
./libraries/src/stm32f10x_iwdg.o \
./libraries/src/stm32f10x_pwr.o \
./libraries/src/stm32f10x_rcc.o \
./libraries/src/stm32f10x_rtc.o \
./libraries/src/stm32f10x_sdio.o \
./libraries/src/stm32f10x_spi.o \
./libraries/src/stm32f10x_tim.o \
./libraries/src/stm32f10x_usart.o \
./libraries/src/stm32f10x_wwdg.o 

C_DEPS += \
./libraries/src/misc.d \
./libraries/src/stm32f10x_adc.d \
./libraries/src/stm32f10x_bkp.d \
./libraries/src/stm32f10x_can.d \
./libraries/src/stm32f10x_cec.d \
./libraries/src/stm32f10x_crc.d \
./libraries/src/stm32f10x_dac.d \
./libraries/src/stm32f10x_dbgmcu.d \
./libraries/src/stm32f10x_dma.d \
./libraries/src/stm32f10x_exti.d \
./libraries/src/stm32f10x_flash.d \
./libraries/src/stm32f10x_fsmc.d \
./libraries/src/stm32f10x_gpio.d \
./libraries/src/stm32f10x_i2c.d \
./libraries/src/stm32f10x_iwdg.d \
./libraries/src/stm32f10x_pwr.d \
./libraries/src/stm32f10x_rcc.d \
./libraries/src/stm32f10x_rtc.d \
./libraries/src/stm32f10x_sdio.d \
./libraries/src/stm32f10x_spi.d \
./libraries/src/stm32f10x_tim.d \
./libraries/src/stm32f10x_usart.d \
./libraries/src/stm32f10x_wwdg.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/src/%.o: ../libraries/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DSTM32F10X_HD -DUSE_STDPERIPH_DRIVER -I"/home/ysh/eclipse-workspace/f103c8t6/bsp/inc" -I"/home/ysh/eclipse-workspace/f103c8t6/cmsis" -I"/home/ysh/eclipse-workspace/f103c8t6/libraries/inc" -I"/home/ysh/eclipse-workspace/f103c8t6/user" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


