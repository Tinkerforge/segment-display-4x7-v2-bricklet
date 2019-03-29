#!/usr/bin/perl

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickletSegmentDisplay4x7V2;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $sd = Tinkerforge::BrickletSegmentDisplay4x7V2->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

$sd->set_brightness(7); # Set to full brightness

# Blink colon 10 times
for (my $i = 0; $i < 10; $i++)
{

    # Activate segments of colon
    $sd->set_selected_segment(32, 1);
    $sd->set_selected_segment(33, 1);

    select(undef, undef, undef, 0.25);

    # Deactivate segments of colon
    $sd->set_selected_segment(32, 0);
    $sd->set_selected_segment(33, 0);
}

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
