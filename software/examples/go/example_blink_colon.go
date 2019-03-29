package main

import (
	"fmt"
	"github.com/Tinkerforge/go-api-bindings/ipconnection"
	"github.com/Tinkerforge/go-api-bindings/segment_display_4x7_v2_bricklet"
	"time"
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

	// Blink colon 10 times
	for i := 0; i < 10; i++ {

		// Activate segments of colon
		sd.SetSelectedSegment(32, true)
		sd.SetSelectedSegment(33, true)

		time.Sleep(250 * time.Millisecond)

		// Deactivate segments of colon
		sd.SetSelectedSegment(32, false)
		sd.SetSelectedSegment(33, false)
	}

	fmt.Print("Press enter to exit.")
	fmt.Scanln()
}
