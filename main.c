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

void RCC_configuration (void)
{
    LL_FLASH_SetLatency (LL_FLASH_LATENCY_2);
    /* Enable HSE and wait for activation*/
    LL_RCC_HSE_Enable ();
    while (LL_RCC_HSE_IsReady () != 1);

    LL_RCC_PLL_Disable ();
    LL_RCC_PLL_ConfigDomain_SYS (LL_RCC_PLLSOURCE_HSE, LL_RCC_PLLM_DIV_25, 336, LL_RCC_PLLP_DIV_4); //336 is PLLN
    L_RCC_PLL_ConfigDomain_48M (LL_RCC_PLLSOURCE_HSE, LL_RCC_PLLM_DIV_25, 336, LL_RCC_PLLQ_DIV_7);
    LL_RCC_PLL_Enable ();
    while (LL_RCC_PLL_IsReady () != 1);
    LL_RCC_SetAHBPrescaler (LL_RCC_SYSCLK_DIV_1);
    LL_RCC_SetAPB1Prescaler (LL_RCC_APB1_DIV_2);
    LL_RCC_SetAPB2Prescaler (LL_RCC_APB2_DIV_1);
    L_RCC_SetSysClkSource (LL_RCC_SYS_CLKSOURCE_PLL);
    while (LL_RCC_GetSysClkSource() != LL_RCC_SYS_CLKSOURCE_STATUS_PLL);

    while (LL_RCC_GetUSBClockFreq (LL_RCC_USB_CLKSOURCE) == LL_RCC_PERIPH_FREQUENCY_NO);

    LL_RCC_ConfigMCO (LL_RCC_MCO2SOURCE_SYSCLK, LL_RCC_MCO2_DIV_2);
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
