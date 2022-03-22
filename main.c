#include <stm32f401xc.h>
#include <stm32f4xx_ll_rcc.h>
#include <stm32f4xx_ll_system.h>
#include <stm32f4xx_ll_bus.h>
#include <stm32f4xx_ll_gpio.h>
//#include <stm32f4xx.h>



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
void delay (void)
{
    int i = 0;
    for (i = 0; i < 1000000; i++);
    i = 0;
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
