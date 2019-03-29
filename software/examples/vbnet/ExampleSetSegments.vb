Imports System
Imports Tinkerforge

Module ExampleSetSegments
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim sd As New BrickletSegmentDisplay4x7V2(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        sd.SetBrightness(7) ' Set to full brightness

        ' Activate all segments
        sd.SetSegments(new Boolean(){True, True, True, True, True, True, True, True}, _
                       new Boolean(){True, True, True, True, True, True, True, True}, _
                       new Boolean(){True, True, True, True, True, True, True, True}, _
                       new Boolean(){True, True, True, True, True, True, True, True}, _
                       new Boolean(){True, True}, True)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
