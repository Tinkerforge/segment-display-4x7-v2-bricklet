var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'XYZ'; // Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0

var ipcon = new Tinkerforge.IPConnection(); // Create IP connection
var sd = new Tinkerforge.BrickletSegmentDisplay4x7V2(UID, ipcon); // Create device object

ipcon.connect(HOST, PORT,
    function (error) {
        console.log('Error: ' + error);
    }
); // Connect to brickd
// Don't use device before ipcon is connected

ipcon.on(Tinkerforge.IPConnection.CALLBACK_CONNECTED,
    function (connectReason) {
        sd.setBrightness(7); // Set to full brightness

        // Blink colon 10 times
        for(var i = 0; i < 10; ++i) {
            // Activate segments of colon
            sd.setSelectedSegment(32, true);
            sd.setSelectedSegment(33, true);


            setTimeout(function () {
                // Deactivate segments of colon
                sd.setSelectedSegment(32, false);
                sd.setSelectedSegment(33, false);
            }, 250 * i + 250);
        }
    }
);

console.log('Press key to exit');
process.stdin.on('data',
    function (data) {
        ipcon.disconnect();
        process.exit(0);
    }
);
