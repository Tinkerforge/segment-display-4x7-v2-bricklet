#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0

tinkerforge call segment-display-4x7-v2-bricklet $uid set-brightness 7 # Set to full brightness

# Activate all segments
tinkerforge call segment-display-4x7-v2-bricklet $uid set-segments true,true,true,true,true,true,true,true true,true,true,true,true,true,true,true true,true,true,true,true,true,true,true true,true,true,true,true,true,true,true true,true true
