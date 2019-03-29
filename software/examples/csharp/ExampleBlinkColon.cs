using System;
using System.Threading;
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

		// Blink colon 10 times
		for(int i = 0; i < 10; i++)
		{

			// Activate segments of colon
			sd.SetSelectedSegment(32, true);
			sd.SetSelectedSegment(33, true);

			Thread.Sleep(250);

			// Deactivate segments of colon
			sd.SetSelectedSegment(32, false);
			sd.SetSelectedSegment(33, false);
		}

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();
		ipcon.Disconnect();
	}
}
