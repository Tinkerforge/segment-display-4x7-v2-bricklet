/* segment-display-4x7-v2-bricklet
 * Copyright (C) 2019 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.h: TFP protocol message handling
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

#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/bootloader/bootloader.h"

// Default functions
BootloaderHandleMessageResponse handle_message(const void *data, void *response);
void communication_tick(void);
void communication_init(void);

// Constants
#define SEGMENT_DISPLAY_4X7_V2_BOOTLOADER_MODE_BOOTLOADER 0
#define SEGMENT_DISPLAY_4X7_V2_BOOTLOADER_MODE_FIRMWARE 1
#define SEGMENT_DISPLAY_4X7_V2_BOOTLOADER_MODE_BOOTLOADER_WAIT_FOR_REBOOT 2
#define SEGMENT_DISPLAY_4X7_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_REBOOT 3
#define SEGMENT_DISPLAY_4X7_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_ERASE_AND_REBOOT 4

#define SEGMENT_DISPLAY_4X7_V2_BOOTLOADER_STATUS_OK 0
#define SEGMENT_DISPLAY_4X7_V2_BOOTLOADER_STATUS_INVALID_MODE 1
#define SEGMENT_DISPLAY_4X7_V2_BOOTLOADER_STATUS_NO_CHANGE 2
#define SEGMENT_DISPLAY_4X7_V2_BOOTLOADER_STATUS_ENTRY_FUNCTION_NOT_PRESENT 3
#define SEGMENT_DISPLAY_4X7_V2_BOOTLOADER_STATUS_DEVICE_IDENTIFIER_INCORRECT 4
#define SEGMENT_DISPLAY_4X7_V2_BOOTLOADER_STATUS_CRC_MISMATCH 5

#define SEGMENT_DISPLAY_4X7_V2_STATUS_LED_CONFIG_OFF 0
#define SEGMENT_DISPLAY_4X7_V2_STATUS_LED_CONFIG_ON 1
#define SEGMENT_DISPLAY_4X7_V2_STATUS_LED_CONFIG_SHOW_HEARTBEAT 2
#define SEGMENT_DISPLAY_4X7_V2_STATUS_LED_CONFIG_SHOW_STATUS 3

// Function and callback IDs and structs
#define FID_SET_SEGMENTS 1
#define FID_GET_SEGMENTS 2
#define FID_SET_BRIGHTNESS 3
#define FID_GET_BRIGHTNESS 4
#define FID_SET_NUMERIC_VALUE 5
#define FID_SET_SELECTED_SEGMENT 6
#define FID_GET_SELECTED_SEGMENTS 7
#define FID_START_COUNTER 8
#define FID_GET_COUNTER_VALUE 9

#define FID_CALLBACK_COUNTER_FINISHED 10

typedef struct {
	TFPMessageHeader header;
	uint8_t digit0;
	uint8_t digit1;
	uint8_t digit2;
	uint8_t digit3;
	uint8_t colon;
	bool tick;
} __attribute__((__packed__)) SetSegments;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetSegments;

typedef struct {
	TFPMessageHeader header;
	uint8_t digit0;
	uint8_t digit1;
	uint8_t digit2;
	uint8_t digit3;
	uint8_t colon;
	bool tick;
} __attribute__((__packed__)) GetSegments_Response;

typedef struct {
	TFPMessageHeader header;
	uint8_t brightness;
} __attribute__((__packed__)) SetBrightness;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetBrightness;

typedef struct {
	TFPMessageHeader header;
	uint8_t brightness;
} __attribute__((__packed__)) GetBrightness_Response;

typedef struct {
	TFPMessageHeader header;
	int8_t value[4];
} __attribute__((__packed__)) SetNumericValue;

typedef struct {
	TFPMessageHeader header;
	uint8_t segment;
	bool value;
} __attribute__((__packed__)) SetSelectedSegment;

typedef struct {
	TFPMessageHeader header;
	bool segment;
} __attribute__((__packed__)) GetSelectedSegments;

typedef struct {
	TFPMessageHeader header;
	uint8_t value;
} __attribute__((__packed__)) GetSelectedSegments_Response;

typedef struct {
	TFPMessageHeader header;
	int16_t value_from;
	int16_t value_to;
	int16_t increment;
	uint32_t length;
} __attribute__((__packed__)) StartCounter;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetCounterValue;

typedef struct {
	TFPMessageHeader header;
	uint16_t value;
} __attribute__((__packed__)) GetCounterValue_Response;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) CounterFinished_Callback;


// Function prototypes
BootloaderHandleMessageResponse set_segments(const SetSegments *data);
BootloaderHandleMessageResponse get_segments(const GetSegments *data, GetSegments_Response *response);
BootloaderHandleMessageResponse set_brightness(const SetBrightness *data);
BootloaderHandleMessageResponse get_brightness(const GetBrightness *data, GetBrightness_Response *response);
BootloaderHandleMessageResponse set_numeric_value(const SetNumericValue *data);
BootloaderHandleMessageResponse set_selected_segment(const SetSelectedSegment *data);
BootloaderHandleMessageResponse get_selected_segments(const GetSelectedSegments *data, GetSelectedSegments_Response *response);
BootloaderHandleMessageResponse start_counter(const StartCounter *data);
BootloaderHandleMessageResponse get_counter_value(const GetCounterValue *data, GetCounterValue_Response *response);

// Callbacks
bool handle_counter_finished_callback(void);

#define COMMUNICATION_CALLBACK_TICK_WAIT_MS 1
#define COMMUNICATION_CALLBACK_HANDLER_NUM 1
#define COMMUNICATION_CALLBACK_LIST_INIT \
	handle_counter_finished_callback, \


#endif
