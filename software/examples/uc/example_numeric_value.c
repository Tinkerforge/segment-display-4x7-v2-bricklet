// This example is not self-contained.
// It requires usage of the example driver specific to your platform.
// See the HAL documentation.

#include "src/bindings/hal_common.h"
#include "src/bindings/bricklet_segment_display_4x7_v2.h"

void check(int rc, const char *msg);
void example_setup(TF_HAL *hal);
void example_loop(TF_HAL *hal);

static TF_SegmentDisplay4x7V2 sd;

void example_setup(TF_HAL *hal) {
	// Create device object
	check(tf_segment_display_4x7_v2_create(&sd, NULL, hal), "create device object");

	check(tf_segment_display_4x7_v2_set_brightness(&sd,
	                                               7), "call set_brightness"); // Set to full brightness

	// Show "- 42" on the Display
	int8_t value[4] = {-2, -1, 4, 2};
	check(tf_segment_display_4x7_v2_set_numeric_value(&sd,
	                                                  value), "call set_numeric_value");
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
