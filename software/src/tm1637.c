/* segment-display-4x7-v2-bricklet
 * Copyright (C) 2019 Olaf Lüke <olaf@tinkerforge.com>
 *
 * tm1637.c: Driver for TM1637
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include "tm1637.h"

#include "configs/config_tm1637.h"

#include "bricklib2/os/coop_task.h"
#include "bricklib2/hal/i2c_fifo/i2c_fifo.h"
#include "bricklib2/hal/system_timer/system_timer.h"

#include "bricklib2/logging/logging.h"

#include "bricklib2/utility/util_definitions.h"

const bool tm1637_numeric_values[18][8] = {
	{0,0,0,0,0,0,1,0}, // minus
	{0,0,0,0,0,0,0,0}, // space
	{1,1,1,1,1,1,0,0}, // 0
	{0,1,1,0,0,0,0,0}, // 1
	{1,1,0,1,1,0,1,0}, // 2
	{1,1,1,1,0,0,1,0}, // 3
	{0,1,1,0,0,1,1,0}, // 4
	{1,0,1,1,0,1,1,0}, // 5
	{1,0,1,1,1,1,1,0}, // 6
	{1,1,1,0,0,0,0,0}, // 7
	{1,1,1,1,1,1,1,0}, // 8
	{1,1,1,0,0,1,1,0}, // 9
	{1,1,1,0,1,1,1,0}, // A
	{0,0,1,1,1,1,1,0}, // b
	{1,0,0,1,1,1,0,0}, // C
	{0,1,1,1,1,0,1,0}, // d
	{1,0,0,1,1,1,1,0}, // E
	{1,0,0,0,1,1,1,0}, // F
};

TM1637 tm1637;
CoopTask tm1637_task;

bool i2c_clk_value(void) {
	return XMC_GPIO_GetInput(TM1637_CLK_PIN);
}

void i2c_clk_high(void) {
	XMC_GPIO_SetOutputHigh(TM1637_CLK_PIN);
}

void i2c_clk_low(void) {
	XMC_GPIO_SetOutputLow(TM1637_CLK_PIN);
}

bool i2c_dio_value(void) {
	return XMC_GPIO_GetInput(TM1637_DIO_PIN);
}

void i2c_dio_high(void) {
	XMC_GPIO_SetOutputHigh(TM1637_DIO_PIN);
}

void i2c_dio_low(void) {
	XMC_GPIO_SetOutputLow(TM1637_DIO_PIN);
}

// Create a clock that is around ~400kHz
void i2c_sleep_halfclock(void) {
	__NOP(); __NOP(); __NOP(); __NOP();
	__NOP(); __NOP(); __NOP(); __NOP();
	__NOP(); __NOP(); __NOP(); __NOP();
	__NOP(); __NOP(); __NOP(); __NOP();
}

void i2c_stop(void) {
	i2c_clk_low();
	i2c_dio_low();
	i2c_sleep_halfclock();
	i2c_clk_high();
	i2c_sleep_halfclock();
	i2c_dio_high();
	i2c_sleep_halfclock();
}

void i2c_start(void) {
	i2c_clk_high();
	i2c_sleep_halfclock();
	i2c_dio_low();
	i2c_sleep_halfclock();
}

uint8_t i2c_recv_byte(void) {
	uint8_t value;

	for(int8_t i = 0; i < 8; i++) {
		i2c_clk_low();
		i2c_sleep_halfclock();
		i2c_clk_high();
		value |= (1 << i);
		i2c_sleep_halfclock();
	}

	// Wait for ACK
	bool ret = false;

	i2c_clk_low();
	i2c_sleep_halfclock();
	i2c_clk_high();
	if(!i2c_dio_value()) {
		ret = true;
	}

	i2c_sleep_halfclock();
	return ret;
}

bool i2c_send_byte(const uint8_t value) {
	for(int8_t i = 0; i < 8; i++) {
		i2c_clk_low();
		if((value >> i) & 1) {
			i2c_dio_high();
		} else {
			i2c_dio_low();
		}
		i2c_sleep_halfclock();
		i2c_clk_high();
		i2c_sleep_halfclock();
	}

	// Wait for ACK
	bool ret = false;

	i2c_clk_low();
	i2c_sleep_halfclock();
	i2c_clk_high();
	if(!i2c_dio_value()) {
		ret = true;
	}

	i2c_sleep_halfclock();
	return ret;
}

void tm1637_set_digits(const int8_t digits[4]) {
	for(uint8_t i = 0; i < 8; i++) {
		for(uint8_t j = 0; j < 4; j++) {
			tm1637.segments[i + j*8] = tm1637_numeric_values[digits[j] + 2][i];
		}
	}
}

void tm1637_update_counter(void) {
	int16_t value = BETWEEN(-999, tm1637.counter_current, 9999);
	int8_t digits[4] = {
		value >= 0 ? (ABS(value)/1000) % 10 : -2,
		(ABS(value)/100) % 10,
		(ABS(value)/10) % 10,
		ABS(value) % 10
	};

	// Remove leading zeroes
	if((digits[0] == 0) && (digits[1] == 0) && (digits[2] == 0)) {
		digits[0] = -1;
		digits[1] = -1;
		digits[2] = -1;
	} else if((digits[0] == -2) && (digits[1] == 0) && (digits[2] == 0)) {
		digits[1] = -1;
		digits[2] = -1;
	} else if((digits[0] == 0) && (digits[1] == 0)) {
		digits[0] = -1;
		digits[1] = -1;
	} else if((digits[0] == -2) && (digits[1] == 0)) {
		digits[1] = -1;
	} else if(digits[0] == 0) {
		digits[0] = -1;
	}

	tm1637_set_digits(digits);
	tm1637.update = true;
}

inline uint8_t tm1637_make_data(bool v0, bool v1, bool v2, bool v3, bool v4, bool v5, bool v6, bool v7) {
	return (v0 << 0) | (v1 << 1) | (v2 << 2) | (v3 << 3) | (v4 << 4) | (v5 << 5) | (v6 << 6) | (v7 << 7);
}

void tm1637_task_update(void) {
	uint8_t data[5];
	data[0] = tm1637_make_data(
		tm1637.segments[27],
		tm1637.segments[28],
		tm1637.segments[31],
		tm1637.segments[29],
		tm1637.segments[26],
		tm1637.segments[24],
		tm1637.segments[30],
		tm1637.segments[25]
	);

	data[1] = tm1637_make_data(
		tm1637.segments[19],
		tm1637.segments[20],
		tm1637.segments[23],
		tm1637.segments[21],
		tm1637.segments[18],
		tm1637.segments[16],
		tm1637.segments[22],
		tm1637.segments[17]
	);

	data[2] = tm1637_make_data(
		0,
		0,
		0,
		0,
		tm1637.segments[34], // ?
		tm1637.segments[32], // ?
		0,
		tm1637.segments[33] // ?
	);

	data[3] = tm1637_make_data(
		tm1637.segments[11],
		tm1637.segments[12],
		tm1637.segments[15],
		tm1637.segments[13],
		tm1637.segments[10],
		tm1637.segments[8],
		tm1637.segments[14],
		tm1637.segments[9]
	);

	data[4] = tm1637_make_data(
		tm1637.segments[3],
		tm1637.segments[4],
		tm1637.segments[7],
		tm1637.segments[5],
		tm1637.segments[2],
		tm1637.segments[0],
		tm1637.segments[6],
		tm1637.segments[1] 
	);

	i2c_start();
	i2c_send_byte(TM1637_ADDRESS_AUTO);
	i2c_stop();

	i2c_sleep_halfclock();
	i2c_sleep_halfclock();

	i2c_start();
	i2c_send_byte(TM1637_ADDERSS_DIGITS);
	i2c_send_byte(data[0]);
	i2c_send_byte(data[1]);
	i2c_send_byte(data[2]);
	i2c_send_byte(data[3]);
	i2c_send_byte(data[4]);
	i2c_stop();

	i2c_sleep_halfclock();
	i2c_sleep_halfclock();

	i2c_start();
	i2c_send_byte(TM1637_ADDRESS_SHOW + tm1637.brightness);
	i2c_stop();
}

void tm1637_task_tick(void) {
    while(true) {
		if(tm1637.counter_last_time != 0) {
			if(system_timer_is_time_elapsed_ms(tm1637.counter_last_time, tm1637.counter_length)) {
				tm1637.counter_last_time += tm1637.counter_length;
				tm1637.counter_current += tm1637.counter_increment;
				tm1637_update_counter();

				if(tm1637.counter_increment > 0) {
					if(tm1637.counter_current + tm1637.counter_increment > tm1637.counter_to) {
						tm1637.counter_finished = true;
						tm1637.counter_last_time = 0;
					}
				} else if (tm1637.counter_increment < 0) {
					if(tm1637.counter_current + tm1637.counter_increment < tm1637.counter_to) {
						tm1637.counter_finished = true;
						tm1637.counter_last_time = 0;
					}
				}
			}
		}

		if(tm1637.update) {
			tm1637_task_update();
			tm1637.update = false;
		}
		coop_task_yield();
    }
}

void tm1637_tick(void) {
    coop_task_tick(&tm1637_task);
}

void tm1637_init(void) {
    memset(&tm1637, 0, sizeof(TM1637));

	tm1637.brightness = 7;
	tm1637.update = true;

	XMC_GPIO_CONFIG_t output_open_drain = {
		.mode = XMC_GPIO_MODE_OUTPUT_OPEN_DRAIN,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_LOW
	};
	XMC_GPIO_Init(TM1637_DIO_PIN, &output_open_drain);
	XMC_GPIO_Init(TM1637_CLK_PIN, &output_open_drain);

    coop_task_init(&tm1637_task, tm1637_task_tick);
}
