#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_segment_display_4x7_v2'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0

ipcon = IPConnection.new # Create IP connection
sd = BrickletSegmentDisplay4x7V2.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

sd.set_brightness 7 # Set to full brightness

# Blink colon 10 times
for _ in 0..9

  # Activate segments of colon
  sd.set_selected_segment 32, true
  sd.set_selected_segment 33, true

  sleep 0.25

  # Deactivate segments of colon
  sd.set_selected_segment 32, false
  sd.set_selected_segment 33, false
end

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
