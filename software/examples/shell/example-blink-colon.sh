#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0

tinkerforge call segment-display-4x7-v2-bricklet $uid set-brightness 7 # Set to full brightness

# Blink colon 10 times
for i in 0 1 2 3 4 5 6 7 8 9; do

	# Activate segments of colon
	tinkerforge call segment-display-4x7-v2-bricklet $uid set-selected-segment 32 true
	tinkerforge call segment-display-4x7-v2-bricklet $uid set-selected-segment 33 true

	sleep 0.25

	# Deactivate segments of colon
	tinkerforge call segment-display-4x7-v2-bricklet $uid set-selected-segment 32 false
	tinkerforge call segment-display-4x7-v2-bricklet $uid set-selected-segment 33 false
done
