using System;
using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletSegmentDisplay4x7V2 sd =
		  new BrickletSegmentDisplay4x7V2(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		sd.SetBrightness(7); // Set to full brightness

		// Show "- 42" on the Display
		sd.SetNumericValue(new short[]{-2, -1, 4, 2});

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();
		ipcon.Disconnect();
	}
}
