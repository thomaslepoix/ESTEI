/**
  ******************************************************************************
  * @file    main.c
  * @author  Ac6
  * @version V1.0
  * @date    01-December-2013
  * @brief   Default main function.
  ******************************************************************************
*/


#include "stm32f4xx.h"
#include "stm32f411e_discovery.h"

//Duty cycles in percent [0-100]
#define    DUTY_CYCLE_1    75
#define    DUTY_CYCLE_2    25
			
void init(void) {
	//enable clock for portD & timer4
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;
	RCC->APB1ENR |= RCC_APB1ENR_TIM4EN;

	//alternate function mode
	GPIOD->MODER &= ~(GPIO_MODER_MODER12
                     |GPIO_MODER_MODER13);
	GPIOD->MODER |= (GPIO_MODER_MODER12_1
                    |GPIO_MODER_MODER13_1);
	//push-pull
	GPIOD->OTYPER &= ~(GPIO_OTYPER_OT12
                      |GPIO_OTYPER_OT13);
	//alternate function 2 (timer 4)
	GPIOD->AFR[1] &= ~(GPIO_AFRH_AFSEL12
                      |GPIO_AFRH_AFSEL13);
	GPIOD->AFR[1] |= (GPIO_AFRH_AFSEL12_1
                     |GPIO_AFRH_AFSEL13_1);

	//divide frequency
//	TIM4->PSC = 0xFFFFFFFF;
	//frequency 100*systick
	TIM4->ARR = 100;
	//duty cycle
	TIM4->CCR1 = (TIM4->ARR*DUTY_CYCLE_1/100);
	TIM4->CCR2 = (TIM4->ARR*DUTY_CYCLE_2/100);
	//channels 1 & 2 in PWM positive mode, protect untimely duty cycle update
	TIM4->CCMR1 |= (TIM_CCMR1_OC1M_2
                   |TIM_CCMR1_OC1M_1
                   |TIM_CCMR1_OC1PE
                   |TIM_CCMR1_OC2M_2
                   |TIM_CCMR1_OC2M_1
                   |TIM_CCMR1_OC2PE);
	//edge aligned
	TIM4->CR1 &= ~(TIM_CR1_CMS);
	//enable timer4, protect untimely frequency update
	TIM4->CR1 |= (TIM_CR1_ARPE
                 |TIM_CR1_CEN);
	//start channels 1 & 2 in high polarity
	TIM4->CCER &= ~(TIM_CCER_CC1P
                   |TIM_CCER_CC2P);
	TIM4->CCER |= (TIM_CCER_CC1E
                  |TIM_CCER_CC2E);
	}

int main(void) {
	init();
	while(1);
	}
