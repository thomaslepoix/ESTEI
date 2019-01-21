/*
 * interrupt.c
 *
 *  Created on: 24 nov. 2018
 *      Author: hernie
 */


#include "stm32f4xx.h"
#include "stm32f411e_discovery.h"

void init(void) {
    //enable clock for portA & portD
    RCC->AHB1ENR |= (RCC_AHB1ENR_GPIOAEN
                    |RCC_AHB1ENR_GPIODEN);

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
    }

void delay(unsigned int time) {
    for(int i=0;i<time*4000;i++);
    }

int main(void) {
    init();
    while(1) {
        if(GPIOA->IDR & GPIO_IDR_ID0) {
            if(GPIOD->ODR & GPIO_ODR_OD12) {
                GPIOD->ODR &= ~(GPIO_ODR_OD12);
                GPIOD->ODR |= GPIO_ODR_OD14;
            } else if(GPIOD->ODR & GPIO_ODR_OD14) {
                GPIOD->ODR &= ~(GPIO_ODR_OD14);
                GPIOD->ODR |= GPIO_ODR_OD13;
            } else if(GPIOD->ODR & GPIO_ODR_OD13) {
                GPIOD->ODR &= ~(GPIO_ODR_OD13);
                GPIOD->ODR |= GPIO_ODR_OD15;
            } else if(GPIOD->ODR & GPIO_ODR_OD15) {
                GPIOD->ODR &= ~(GPIO_ODR_OD15);
                GPIOD->ODR |= GPIO_ODR_OD12;
            } else {
                GPIOD->ODR &= ~(GPIO_ODR_OD12
                               |GPIO_ODR_OD13
                               |GPIO_ODR_OD14
                               |GPIO_ODR_OD15);
                GPIOD->ODR |= GPIO_ODR_OD12;
                }
            while(GPIOA->IDR & GPIO_IDR_ID0);
            delay(50);
            }
        }
    }
