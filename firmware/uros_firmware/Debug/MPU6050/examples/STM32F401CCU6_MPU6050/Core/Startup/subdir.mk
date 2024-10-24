################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../MPU6050/examples/STM32F401CCU6_MPU6050/Core/Startup/startup_stm32f401ccux.s 

OBJS += \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Startup/startup_stm32f401ccux.o 

S_DEPS += \
./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Startup/startup_stm32f401ccux.d 


# Each subdirectory must supply rules for building sources it contributes
MPU6050/examples/STM32F401CCU6_MPU6050/Core/Startup/%.o: ../MPU6050/examples/STM32F401CCU6_MPU6050/Core/Startup/%.s MPU6050/examples/STM32F401CCU6_MPU6050/Core/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-MPU6050-2f-examples-2f-STM32F401CCU6_MPU6050-2f-Core-2f-Startup

clean-MPU6050-2f-examples-2f-STM32F401CCU6_MPU6050-2f-Core-2f-Startup:
	-$(RM) ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Startup/startup_stm32f401ccux.d ./MPU6050/examples/STM32F401CCU6_MPU6050/Core/Startup/startup_stm32f401ccux.o

.PHONY: clean-MPU6050-2f-examples-2f-STM32F401CCU6_MPU6050-2f-Core-2f-Startup

