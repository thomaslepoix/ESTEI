/*
 * interrupt.c
 *
 *  Created on: 24 nov. 2018
 *      Author: hernie
 */


#include "stm32f4xx.h"
#include "stm32f411e_discovery.h"

void init(void) {
    //enable clock for portA & portD & system configuration controller
    RCC->AHB1ENR |= (RCC_AHB1ENR_GPIOAEN
                    |RCC_AHB1ENR_GPIODEN);
    RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;

    //user button in input
    GPIOA->MODER &= ~(GPIO_MODER_MODER0);
    //user button in pull-down
    GPIOA->PUPDR &= ~(GPIO_PUPDR_PUPDR0);
    GPIOA->PUPDR |= GPIO_PUPDR_PUPDR0_1;

    //4 LEDs in output
    GPIOD->MODER &= ~(GPIO_MODER_MODER12
                     |GPIO_MODER_MODER13
                     |GPIO_MODER_MODER14
                     |GPIO_MODER_MODER15);
    GPIOD->MODER |= (GPIO_MODER_MODER12_0
                    |GPIO_MODER_MODER13_0
                    |GPIO_MODER_MODER14_0
                    |GPIO_MODER_MODER15_0);
    //4 LEDs in push-pull
    GPIOD->OTYPER &= ~(GPIO_OTYPER_OT12
                      |GPIO_OTYPER_OT13
                      |GPIO_OTYPER_OT14
                      |GPIO_OTYPER_OT15);

    //external interrupt line 0 is user button
    SYSCFG->EXTICR[0] &= ~(SYSCFG_EXTICR1_EXTI0);
    SYSCFG->EXTICR[0] |= SYSCFG_EXTICR1_EXTI0_PA;
    //trigger on falling edge
    EXTI->FTSR |= EXTI_FTSR_TR0;
    //enable interrupt for line 0
    EXTI->IMR |= EXTI_IMR_MR0;
    //interrupt priority 13
//    NVIC_SetPriority(EXTI0_IRQn, 13);
    NVIC->IP[EXTI0_IRQn] = 13<<4;
    //enable interrupt for line 0
//    NVIC_EnableIRQ(EXTI0_IRQn);
    NVIC->ISER[0] |= (1<<EXTI0_IRQn);
    }

void delay(unsigned int time) {
    for(int i=0;i<time*4000;i++);
    }

void EXTI0_IRQHandler(void) {
    if(GPIOD->ODR & GPIO_ODR_OD15) {
        GPIOD->ODR &= ~(GPIO_ODR_OD15);
        GPIOD->ODR |= GPIO_ODR_OD14;
    } else if(GPIOD->ODR & GPIO_ODR_OD14) {
        GPIOD->ODR &= ~(GPIO_ODR_OD14);
        GPIOD->ODR |= GPIO_ODR_OD13;
    } else if(GPIOD->ODR & GPIO_ODR_OD13) {
        GPIOD->ODR &= ~(GPIO_ODR_OD13);
        GPIOD->ODR |= GPIO_ODR_OD12;
    } else if(GPIOD->ODR & GPIO_ODR_OD12) {
        GPIOD->ODR &= ~(GPIO_ODR_OD12);
        GPIOD->ODR |= GPIO_ODR_OD15;
    } else {
        GPIOD->ODR &= ~(GPIO_ODR_OD12
                       |GPIO_ODR_OD13
                       |GPIO_ODR_OD14
                       |GPIO_ODR_OD15);
        GPIOD->ODR |= GPIO_ODR_OD14;
        }
    delay(50);
    //interrupt is done -> clear its pending state
//    NVIC_ClearPendingIRQ(EXTI0_IRQn);
    NVIC->ICPR[0] |= (1 << EXTI0_IRQn);
    EXTI->PR |= EXTI_PR_PR0;
    }

int main(void) {
    init();
    while(1);
    }
