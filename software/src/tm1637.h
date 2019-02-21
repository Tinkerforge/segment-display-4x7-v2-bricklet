/* segment-display-4x7-v2-bricklet
 * Copyright (C) 2019 Olaf Lüke <olaf@tinkerforge.com>
 *
 * tm1637.h: Driver for TM1637
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

#ifndef TM1637_H
#define TM1637_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib2/hal/i2c_fifo/i2c_fifo.h"

#define TM1637_SEGMENT_NUM (8*4+2+1)

typedef struct {
	I2CFifo i2c_fifo;
	bool segments[TM1637_SEGMENT_NUM];
	uint8_t brightness;

	int16_t counter_from;
	int16_t counter_to;
	int16_t counter_current;
	int16_t counter_increment;
	uint32_t counter_last_time;
	uint32_t counter_length;
	bool counter_finished;

	bool update;
} TM1637;

extern TM1637 tm1637;

void tm1637_tick(void);
void tm1637_init(void);
void tm1637_set_digits(const int8_t digits[]);
void tm1637_update_counter(void);

#define TM1637_ADDRESS_AUTO    0x40 
#define TM1637_ADDRESS_FIXED   0x44
#define TM1637_ADDERSS_DIGITS  0xC0
#define TM1637_ADDRESS_SHOW    0x88

#define TM1637_COLON_ON  0x80
#define TM1637_COLON_OFF 0

#endif