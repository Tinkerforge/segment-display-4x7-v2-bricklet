function matlab_example_numeric_value()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletSegmentDisplay4x7V2;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0

    ipcon = IPConnection(); % Create IP connection
    sd = handle(BrickletSegmentDisplay4x7V2(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    sd.setBrightness(7); % Set to full brightness

    % Show "- 42" on the Display
    sd.setNumericValue([-2 -1 4 2]);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
