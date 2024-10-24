################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/gpio.c \
../MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/i2c.c \
../MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/main.c \
../MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/mpu6050.c \
../MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_hal_msp.c \
../MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_it.c \
../MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sys.c \
../MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/syscalls.c \
../MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sysmem.c \
../MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/system_stm32f4xx.c 

OBJS += \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/gpio.o \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/i2c.o \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/main.o \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/mpu6050.o \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_hal_msp.o \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_it.o \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sys.o \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/syscalls.o \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sysmem.o \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/system_stm32f4xx.o 

C_DEPS += \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/gpio.d \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/i2c.d \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/main.d \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/mpu6050.d \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_hal_msp.d \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_it.d \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sys.d \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/syscalls.d \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sysmem.d \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/system_stm32f4xx.d 


# Each subdirectory must supply rules for building sources it contributes
MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/%.o MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/%.su MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/%.cyclo: ../MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/%.c MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../MPU6050 -I../micro_ros_stm32cubemx_utils/microros_static_library_ide/libmicroros/include -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-MPU6050-2f-examples-2f-STM32F401CCU6_MPU6050-2f-Core-2f-Src

clean-MPU6050-2f-examples-2f-STM32F401CCU6_MPU6050-2f-Core-2f-Src:
	-$(RM) ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/gpio.cyclo ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/gpio.d ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/gpio.o ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/gpio.su ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/i2c.cyclo ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/i2c.d ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/i2c.o ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/i2c.su ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/main.cyclo ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/main.d ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/main.o ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/main.su ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/mpu6050.cyclo ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/mpu6050.d ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/mpu6050.o ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/mpu6050.su ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_hal_msp.cyclo ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_hal_msp.d ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_hal_msp.o ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_hal_msp.su ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_it.cyclo ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_it.d ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_it.o ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/stm32f4xx_it.su ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sys.cyclo ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sys.d ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sys.o ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sys.su ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/syscalls.cyclo ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/syscalls.d ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/syscalls.o ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/syscalls.su ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sysmem.cyclo ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sysmem.d ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sysmem.o ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/sysmem.su ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/system_stm32f4xx.cyclo ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/system_stm32f4xx.d ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/system_stm32f4xx.o ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Src/system_stm32f4xx.su

.PHONY: clean-MPU6050-2f-examples-2f-STM32F401CCU6_MPU6050-2f-Core-2f-Src

