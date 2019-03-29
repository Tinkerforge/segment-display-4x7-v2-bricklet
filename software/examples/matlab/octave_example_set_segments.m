function octave_example_set_segments()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    sd = javaObject("com.tinkerforge.BrickletSegmentDisplay4x7V2", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    sd.setBrightness(7); % Set to full brightness

    % Activate all segments
    sd.setSegments([true true true true true true true true], ...
                   [true true true true true true true true], ...
                   [true true true true true true true true], ...
                   [true true true true true true true true], [true true], true);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end
