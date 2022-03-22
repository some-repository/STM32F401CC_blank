#include <stm32f4xx_ll_rcc.h>
#include <stm32f4xx_ll_system.h>
#include <stm32f4xx_ll_bus.h>
#include <stm32f4xx_ll_gpio.h>


/*
 * Clock on GPIOC and set led pin
 */
static void gpio_config(void)
{
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_13, LL_GPIO_MODE_OUTPUT);
}

/*
 * Just set of commands to waste CPU power for 10ms
 * (basically it is a simple cycle with a predefined number
 * of loops)
 */
__attribute__((naked)) static void delay (void)
{
    asm ("push {r7, lr}");
    asm ("ldr r6, [pc, #8]");
    asm ("sub r6, #1");
    asm ("cmp r6, #0");
    asm ("bne delay_10ms+0x4");
    asm ("pop {r7, pc}");
    asm (".word 0x5b8d80"); //
}

int main(void)
{
    gpio_config();

    while (1) 
    {
        LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_13);
        delay();
        LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_13);
        delay();
    }
}
