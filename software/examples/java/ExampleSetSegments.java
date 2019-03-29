import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletSegmentDisplay4x7V2;

public class ExampleSetSegments {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;

	// Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0
	private static final String UID = "XYZ";

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions
	//       you might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletSegmentDisplay4x7V2 sd =
		  new BrickletSegmentDisplay4x7V2(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		sd.setBrightness(7); // Set to full brightness

		// Activate all segments
		sd.setSegments(new boolean[]{true, true, true, true, true, true, true, true},
		               new boolean[]{true, true, true, true, true, true, true, true},
		               new boolean[]{true, true, true, true, true, true, true, true},
		               new boolean[]{true, true, true, true, true, true, true, true},
		               new boolean[]{true, true}, true);

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}
