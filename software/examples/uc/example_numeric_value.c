// This example is not self-contained.
// It requres usage of the example driver specific to your platform.
// See the HAL documentation.

#include "bindings/hal_common.h"
#include "bindings/bricklet_segment_display_4x7_v2.h"

#define UID "XYZ" // Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0

void check(int rc, const char* msg);

void example_setup(TF_HalContext *hal);
void example_loop(TF_HalContext *hal);


static TF_SegmentDisplay4x7V2 sd;

void example_setup(TF_HalContext *hal) {
	// Create device object
	check(tf_segment_display_4x7_v2_create(&sd, UID, hal), "create device object");

	check(tf_segment_display_4x7_v2_set_brightness(&sd,
	                                               7), "call set_brightness"); // Set to full brightness

	// Show "- 42" on the Display
	int8_t value[4] = {-2, -1, 4, 2};
	check(tf_segment_display_4x7_v2_set_numeric_value(&sd,
	                                                  value), "call set_numeric_value");
}

void example_loop(TF_HalContext *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
