use std::{error::Error, io, thread, time::Duration};
use tinkerforge::{ip_connection::IpConnection, segment_display_4x7_v2_bricklet::*};

const HOST: &str = "localhost";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0.

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection.
    let sd = SegmentDisplay4x7V2Bricklet::new(UID, &ipcon); // Create device object.

    ipcon.connect((HOST, PORT)).recv()??; // Connect to brickd.
                                          // Don't use device before ipcon is connected.

    sd.set_brightness(7).recv()?; // Set to full brightness

    // Blink colon 10 times
    for _i in 0..10 {
        // Activate segments of colon
        sd.set_selected_segment(32, true).recv()?;
        sd.set_selected_segment(33, true).recv()?;

        thread::sleep(Duration::from_millis(250));

        // Deactivate segments of colon
        sd.set_selected_segment(32, false).recv()?;
        sd.set_selected_segment(33, false).recv()?;
    }

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
