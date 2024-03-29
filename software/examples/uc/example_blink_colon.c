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

	// Blink colon 10 times
	int i;
	for (i = 0; i < 10; ++i) {

		// Activate segments of colon
		check(tf_segment_display_4x7_v2_set_selected_segment(&sd, 32,
		                                                     true), "call set_selected_segment");
		check(tf_segment_display_4x7_v2_set_selected_segment(&sd, 33,
		                                                     true), "call set_selected_segment");

		tf_hal_sleep_us(hal, 250 * 1000);

		// Deactivate segments of colon
		check(tf_segment_display_4x7_v2_set_selected_segment(&sd, 32,
		                                                     false), "call set_selected_segment");
		check(tf_segment_display_4x7_v2_set_selected_segment(&sd, 33,
		                                                     false), "call set_selected_segment");
	}
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
