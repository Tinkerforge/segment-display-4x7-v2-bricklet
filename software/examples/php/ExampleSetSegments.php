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

// Activate all segments
$sd->setSegments(array(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
                 array(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
                 array(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
                 array(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE), array(TRUE, TRUE),
                 TRUE);

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
