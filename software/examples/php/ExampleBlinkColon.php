<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletSegmentDisplay4x7V2.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletSegmentDisplay4x7V2;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0

$ipcon = new IPConnection(); // Create IP connection
$sd = new BrickletSegmentDisplay4x7V2(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

$sd->setBrightness(7); // Set to full brightness

// Blink colon 10 times
for($i = 0; $i < 10; $i++) {

    // Activate segments of colon
    $sd->setSelectedSegment(32, TRUE);
    $sd->setSelectedSegment(33, TRUE);

    usleep(250*1000);

    // Deactivate segments of colon
    $sd->setSelectedSegment(32, FALSE);
    $sd->setSelectedSegment(33, FALSE);
}

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
