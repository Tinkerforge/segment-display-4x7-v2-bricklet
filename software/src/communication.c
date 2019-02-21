/* segment-display-4x7-v2-bricklet
 * Copyright (C) 2019 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.c: TFP protocol message handling
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

#include "communication.h"

#include "bricklib2/utility/communication_callback.h"
#include "bricklib2/utility/util_definitions.h"
#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/hal/system_timer/system_timer.h"

#include "tm1637.h"

extern const bool tm1637_numeric_values[18][8];

BootloaderHandleMessageResponse handle_message(const void *message, void *response) {
	switch(tfp_get_fid_from_message(message)) {
		case FID_SET_SEGMENTS: return set_segments(message);
		case FID_GET_SEGMENTS: return get_segments(message, response);
		case FID_SET_BRIGHTNESS: return set_brightness(message);
		case FID_GET_BRIGHTNESS: return get_brightness(message, response);
		case FID_SET_NUMERIC_VALUE: return set_numeric_value(message);
		case FID_SET_SELECTED_SEGMENT: return set_selected_segment(message);
		case FID_GET_SELECTED_SEGMENTS: return get_selected_segments(message, response);
		case FID_START_COUNTER: return start_counter(message);
		case FID_GET_COUNTER_VALUE: return get_counter_value(message, response);
		default: return HANDLE_MESSAGE_RESPONSE_NOT_SUPPORTED;
	}
}


BootloaderHandleMessageResponse set_segments(const SetSegments *data) {
	uint32_t digits = data->digit0 | (data->digit1 << 8) | (data->digit2 << 16) | (data->digit3 << 24);
	for(uint8_t i = 0; i < 32; i++) {
		tm1637.segments[i] = digits & (1 << i);
	}
	tm1637.segments[32] = data->colon & 0b01;
	tm1637.segments[33] = data->colon & 0b10;
	tm1637.segments[34] = data->tick;

	tm1637.update = true;

	tm1637.counter_last_time = 0;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_segments(const GetSegments *data, GetSegments_Response *response) {
	response->header.length = sizeof(GetSegments_Response);

	uint32_t digits = 0;
	for(uint8_t i = 0; i < 32; i++) {
		digits |= tm1637.segments[i] << i;
	}

	response->digit0 = (digits >> 0)  & 0xFF;
	response->digit1 = (digits >> 8)  & 0xFF;
	response->digit2 = (digits >> 16) & 0xFF;
	response->digit3 = (digits >> 24) & 0xFF;

	response->colon  = tm1637.segments[32] | (tm1637.segments[33] << 1);
	response->tick   = tm1637.segments[34];

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_brightness(const SetBrightness *data) {
	if(data->brightness > 7) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	tm1637.brightness = data->brightness;
	tm1637.update     = true;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_brightness(const GetBrightness *data, GetBrightness_Response *response) {
	response->header.length = sizeof(GetBrightness_Response);
	response->brightness    = tm1637.brightness;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_numeric_value(const SetNumericValue *data) {
	if((data->value[0] < -2) || (data->value[0] > 15) ||
	   (data->value[1] < -2) || (data->value[1] > 15) ||
	   (data->value[2] < -2) || (data->value[2] > 15) ||
	   (data->value[3] < -2) || (data->value[3] > 15)) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	tm1637_set_digits(data->value);
	tm1637.update = true;

	tm1637.counter_last_time = 0;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse set_selected_segment(const SetSelectedSegment *data) {
	if(data->segment >= TM1637_SEGMENT_NUM) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	tm1637.segments[data->segment] = data->value;
	tm1637.update                  = true;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_selected_segments(const GetSelectedSegments *data, GetSelectedSegments_Response *response) {
	if(data->segment >= TM1637_SEGMENT_NUM) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	response->header.length = sizeof(GetSelectedSegments_Response);
	response->value         = tm1637.segments[data->segment];

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse start_counter(const StartCounter *data) {
	int16_t counter_from      = BETWEEN(-999, data->value_from, 9999);
	int16_t counter_to        = BETWEEN(-999, data->value_to, 9999);
	int16_t counter_increment = BETWEEN(-999, data->increment, 9999);

	if((data->length == 0) ||
	   (counter_increment == 0) ||
	   ((counter_increment > 0) && (counter_from > counter_to)) ||
	   ((counter_increment < 0) && (counter_from < counter_to))) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	tm1637.counter_from           = counter_from;
	tm1637.counter_to             = counter_to;
	tm1637.counter_increment      = counter_increment;
	tm1637.counter_length         = data->length;
	tm1637.counter_current        = counter_from;
	tm1637.counter_last_time      = system_timer_get_ms();

	tm1637_update_counter();

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_counter_value(const GetCounterValue *data, GetCounterValue_Response *response) {
	response->header.length = sizeof(GetCounterValue_Response);
	response->value         = tm1637.counter_current;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}


bool handle_counter_finished_callback(void) {
	static bool is_buffered = false;
	static CounterFinished_Callback cb;

	if(!is_buffered) {
		if(tm1637.counter_finished) {
			tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(CounterFinished_Callback), FID_CALLBACK_COUNTER_FINISHED);
			tm1637.counter_finished = false;
		} else {
			return false;
		}
	}

	if(bootloader_spitfp_is_send_possible(&bootloader_status.st)) {
		bootloader_spitfp_send_ack_and_message(&bootloader_status, (uint8_t*)&cb, sizeof(CounterFinished_Callback));
		is_buffered = false;
		return true;
	} else {
		is_buffered = true;
	}

	return false;
}

void communication_tick(void) {
	communication_callback_tick();
}

void communication_init(void) {
	communication_callback_init();
}
