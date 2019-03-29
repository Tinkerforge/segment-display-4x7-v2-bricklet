function matlab_example_blink_colon()
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

    % Blink colon 10 times
    for i = 0:9

        % Activate segments of colon
        sd.setSelectedSegment(32, true);
        sd.setSelectedSegment(33, true);

        pause(0.25);

        % Deactivate segments of colon
        sd.setSelectedSegment(32, false);
        sd.setSelectedSegment(33, false);
    end

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
