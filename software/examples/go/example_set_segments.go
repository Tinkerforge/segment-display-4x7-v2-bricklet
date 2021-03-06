package main

import (
	"fmt"
	"github.com/Tinkerforge/go-api-bindings/ipconnection"
	"github.com/Tinkerforge/go-api-bindings/segment_display_4x7_v2_bricklet"
)

const ADDR string = "localhost:4223"
const UID string = "XYZ" // Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0.

func main() {
	ipcon := ipconnection.New()
	defer ipcon.Close()
	sd, _ := segment_display_4x7_v2_bricklet.New(UID, &ipcon) // Create device object.

	ipcon.Connect(ADDR) // Connect to brickd.
	defer ipcon.Disconnect()
	// Don't use device before ipcon is connected.

	sd.SetBrightness(7) // Set to full brightness

	// Activate all segments
	sd.SetSegments([8]bool{true, true, true, true, true, true, true, true},
		[8]bool{true, true, true, true, true, true, true, true},
		[8]bool{true, true, true, true, true, true, true, true},
		[8]bool{true, true, true, true, true, true, true, true},
		[2]bool{true, true}, true)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()
}
