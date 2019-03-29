Imports System
Imports System.Threading
Imports Tinkerforge

Module ExampleBlinkColon
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim sd As New BrickletSegmentDisplay4x7V2(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        sd.SetBrightness(7) ' Set to full brightness

        ' Blink colon 10 times
        Dim i As Integer
        For i = 0 To 9

            ' Activate segments of colon
            sd.SetSelectedSegment(32, True)
            sd.SetSelectedSegment(33, True)

            Thread.Sleep(250)

            ' Deactivate segments of colon
            sd.SetSelectedSegment(32, False)
            sd.SetSelectedSegment(33, False)
        Next i

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
