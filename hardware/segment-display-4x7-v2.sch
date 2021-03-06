EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Segment Display 4x7 Bricklet"
Date "2019-01-17"
Rev "2.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2018, B.Nordmeyer <bastian@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 550  7700 0    40   ~ 0
Copyright Tinkerforge GmbH 2018.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
$Comp
L tinkerforge:DRILL U4
U 1 1 4C6050A5
P 10700 6200
F 0 "U4" H 10750 6250 60  0001 C CNN
F 1 "DRILL" H 10700 6200 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 10700 6200 60  0001 C CNN
F 3 "" H 10700 6200 60  0001 C CNN
	1    10700 6200
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:DRILL U5
U 1 1 4C6050A2
P 10700 6400
F 0 "U5" H 10750 6450 60  0001 C CNN
F 1 "DRILL" H 10700 6400 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 10700 6400 60  0001 C CNN
F 3 "" H 10700 6400 60  0001 C CNN
	1    10700 6400
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:DRILL U7
U 1 1 4C60509F
P 11050 6400
F 0 "U7" H 11100 6450 60  0001 C CNN
F 1 "DRILL" H 11050 6400 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 11050 6400 60  0001 C CNN
F 3 "" H 11050 6400 60  0001 C CNN
	1    11050 6400
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:DRILL U6
U 1 1 4C605099
P 11050 6200
F 0 "U6" H 11100 6250 60  0001 C CNN
F 1 "DRILL" H 11050 6200 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 11050 6200 60  0001 C CNN
F 3 "" H 11050 6200 60  0001 C CNN
	1    11050 6200
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:SEGMENT_4X7_2 U3
U 1 1 51FF795E
P 10400 3950
F 0 "U3" H 10250 4000 60  0000 C CNN
F 1 "SEGMENT_4X7" H 10400 2350 60  0000 C CNN
F 2 "kicad-libraries:SEGMENT_4X7" H 10400 3950 60  0001 C CNN
F 3 "" H 10400 3950 60  0000 C CNN
	1    10400 3950
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:TM1637 U2
U 1 1 51FF796D
P 8350 4750
F 0 "U2" H 8000 5200 60  0000 C CNN
F 1 "TM1637" H 8500 4000 60  0000 C CNN
F 2 "kicad-libraries:SOP20" H 8350 4750 60  0001 C CNN
F 3 "" H 8350 4750 60  0000 C CNN
	1    8350 4750
	-1   0    0    -1  
$EndComp
NoConn ~ 7800 4450
NoConn ~ 7800 4550
Text GLabel 7700 5350 0    47   Input ~ 0
COM1
Text GLabel 7700 5250 0    47   Input ~ 0
COM2
Text GLabel 7700 5050 0    47   Input ~ 0
COM3
Text GLabel 7700 4950 0    47   Input ~ 0
COM4
Text GLabel 9800 4550 0    47   Input ~ 0
COM1
Text GLabel 9800 4250 0    47   Input ~ 0
COM4
Text GLabel 9800 4350 0    47   Input ~ 0
COM3
Text GLabel 9800 4450 0    47   Input ~ 0
COM2
$Comp
L tinkerforge:GND #PWR01
U 1 1 51FF7D33
P 9000 5600
F 0 "#PWR01" H 9000 5600 30  0001 C CNN
F 1 "GND" H 9000 5530 30  0001 C CNN
F 2 "" H 9000 5600 60  0001 C CNN
F 3 "" H 9000 5600 60  0001 C CNN
	1    9000 5600
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:+5V #PWR02
U 1 1 51FF73D3
P 7600 4150
F 0 "#PWR02" H 7600 4240 20  0001 C CNN
F 1 "+5V" H 7600 4240 30  0000 C CNN
F 2 "" H 7600 4150 60  0000 C CNN
F 3 "" H 7600 4150 60  0000 C CNN
	1    7600 4150
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C5
U 1 1 51FF73D9
P 7900 4150
F 0 "C5" V 8050 4150 50  0000 L CNN
F 1 "100nF" V 7750 4050 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 7900 4150 60  0001 C CNN
F 3 "" H 7900 4150 60  0001 C CNN
	1    7900 4150
	0    -1   -1   0   
$EndComp
$Comp
L tinkerforge:GND #PWR03
U 1 1 51FF73DF
P 8150 4200
F 0 "#PWR03" H 8150 4200 30  0001 C CNN
F 1 "GND" H 8150 4130 30  0001 C CNN
F 2 "" H 8150 4200 60  0001 C CNN
F 3 "" H 8150 4200 60  0001 C CNN
	1    8150 4200
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C1
U 1 1 51FF76D1
P 6650 5000
F 0 "C1" V 6700 5050 50  0000 L CNN
F 1 "1nF" V 6750 4800 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 6650 5000 60  0001 C CNN
F 3 "" H 6650 5000 60  0001 C CNN
	1    6650 5000
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:GND #PWR04
U 1 1 51FF76E3
P 6650 5600
F 0 "#PWR04" H 6650 5600 30  0001 C CNN
F 1 "GND" H 6650 5530 30  0001 C CNN
F 2 "" H 6650 5600 60  0001 C CNN
F 3 "" H 6650 5600 60  0001 C CNN
	1    6650 5600
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR05
U 1 1 51FF76E9
P 7000 5600
F 0 "#PWR05" H 7000 5600 30  0001 C CNN
F 1 "GND" H 7000 5530 30  0001 C CNN
F 2 "" H 7000 5600 60  0001 C CNN
F 3 "" H 7000 5600 60  0001 C CNN
	1    7000 5600
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C3
U 1 1 51FF76F9
P 7000 5000
F 0 "C3" V 7050 5050 50  0000 L CNN
F 1 "1nF" V 7050 4800 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 7000 5000 60  0001 C CNN
F 3 "" H 7000 5000 60  0001 C CNN
	1    7000 5000
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:GND #PWR06
U 1 1 4C5FCF5E
P 1150 2500
F 0 "#PWR06" H 1150 2500 30  0001 C CNN
F 1 "GND" H 1150 2430 30  0001 C CNN
F 2 "" H 1150 2500 60  0001 C CNN
F 3 "" H 1150 2500 60  0001 C CNN
	1    1150 2500
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:VCC #PWR07
U 1 1 4C5FCFB4
P 2300 950
F 0 "#PWR07" H 2300 1050 30  0001 C CNN
F 1 "VCC" H 2300 1050 30  0000 C CNN
F 2 "" H 2300 950 60  0001 C CNN
F 3 "" H 2300 950 60  0001 C CNN
	1    2300 950 
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:CON-SENSOR2 P1
U 1 1 5B30EBCA
P 1150 1700
F 0 "P1" H 1000 2100 60  0000 C CNN
F 1 "CON-SENSOR2" V 1300 1700 60  0000 C CNN
F 2 "kicad-libraries:CON-SENSOR2" H 1250 1550 60  0001 C CNN
F 3 "" H 1250 1550 60  0000 C CNN
	1    1150 1700
	-1   0    0    -1  
$EndComp
$Comp
L tinkerforge:C C4
U 1 1 5B31024F
P 1900 1250
F 0 "C4" H 1950 1350 50  0000 L CNN
F 1 "10uF" H 1950 1150 50  0000 L CNN
F 2 "kicad-libraries:C0805" H 1900 1250 60  0001 C CNN
F 3 "" H 1900 1250 60  0000 C CNN
	1    1900 1250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C6
U 1 1 5B31036A
P 2300 1250
F 0 "C6" H 2350 1350 50  0000 L CNN
F 1 "1uF" H 2350 1150 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 2300 1250 60  0001 C CNN
F 3 "" H 2300 1250 60  0000 C CNN
	1    2300 1250
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR08
U 1 1 5B310764
P 2300 1550
F 0 "#PWR08" H 2300 1550 30  0001 C CNN
F 1 "GND" H 2300 1480 30  0001 C CNN
F 2 "" H 2300 1550 60  0001 C CNN
F 3 "" H 2300 1550 60  0001 C CNN
	1    2300 1550
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:+5V #PWR09
U 1 1 5B310EED
P 1550 950
F 0 "#PWR09" H 1550 1040 20  0001 C CNN
F 1 "+5V" H 1550 1040 30  0000 C CNN
F 2 "" H 1550 950 60  0000 C CNN
F 3 "" H 1550 950 60  0000 C CNN
	1    1550 950 
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R_PACK4 RP1
U 1 1 5B311170
P 2000 2050
F 0 "RP1" H 2000 2500 50  0000 C CNN
F 1 "82" H 2000 2000 50  0000 C CNN
F 2 "kicad-libraries:4X0402" H 2000 2050 50  0001 C CNN
F 3 "" H 2000 2050 50  0000 C CNN
	1    2000 2050
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:C C2
U 1 1 5B3111CC
P 1650 2250
F 0 "C2" H 1700 2350 50  0000 L CNN
F 1 "220pF" H 1700 2150 50  0000 L CNN
F 2 "kicad-libraries:C0402F" H 1650 2250 60  0001 C CNN
F 3 "" H 1650 2250 60  0000 C CNN
	1    1650 2250
	1    0    0    -1  
$EndComp
Text GLabel 2600 1700 2    47   Output ~ 0
S-CS
Text GLabel 2600 1800 2    47   Output ~ 0
S-CLK
Text GLabel 2600 1900 2    47   Output ~ 0
S-MOSI
Text GLabel 2600 2000 2    47   Input ~ 0
S-MISO
$Comp
L tinkerforge:GND #PWR010
U 1 1 5B311A5E
P 1650 2500
F 0 "#PWR010" H 1650 2500 30  0001 C CNN
F 1 "GND" H 1650 2430 30  0001 C CNN
F 2 "" H 1650 2500 60  0001 C CNN
F 3 "" H 1650 2500 60  0001 C CNN
	1    1650 2500
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX24 U1
U 1 1 5B31268F
P 4350 7050
F 0 "U1" H 4200 7450 60  0000 C CNN
F 1 "XMC1100" H 4350 6650 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 4500 7800 60  0001 C CNN
F 3 "" H 4500 7800 60  0000 C CNN
	1    4350 7050
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX24 U1
U 2 1 5B312904
P 4350 3450
F 0 "U1" H 4200 4000 60  0000 C CNN
F 1 "XMC1100" H 4350 2900 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 4500 4200 60  0001 C CNN
F 3 "" H 4500 4200 60  0000 C CNN
	2    4350 3450
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX24 U1
U 3 1 5B31295A
P 4350 4700
F 0 "U1" H 4200 4950 60  0000 C CNN
F 1 "XMC1100" H 4350 4450 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 4500 5450 60  0001 C CNN
F 3 "" H 4500 5450 60  0000 C CNN
	3    4350 4700
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:XMC1XXX24 U1
U 4 1 5B3129B3
P 4350 5800
F 0 "U1" H 4200 6250 60  0000 C CNN
F 1 "XMC1100" H 4350 5350 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 4500 6550 60  0001 C CNN
F 3 "" H 4500 6550 60  0000 C CNN
	4    4350 5800
	1    0    0    -1  
$EndComp
Text Notes 2150 3400 0    39   ~ 0
I2C Master/CH1\nP0.6 :USIC0_CH1-DOUT0/DX0C : SDA\nP0.8: USIC0_CH1-SCLKOUT/DX1B : SCL
Text Notes 2150 3950 0    39   ~ 0
SPI Slave/CH0\nP0.13 : USIC0_CH0-DX2F : SEL\nP0.14 : USIC0_CH0-DX1A : CLK\nP0.15 : USIC0_CH0-DX0B : MOSI\nP2.0 : USIC0_CH0-DOUT0 : MISO
$Comp
L tinkerforge:C C7
U 1 1 5B313868
P 3800 7000
F 0 "C7" H 3850 7100 50  0000 L CNN
F 1 "100nF" H 3850 6900 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 3800 7000 60  0001 C CNN
F 3 "" H 3800 7000 60  0000 C CNN
	1    3800 7000
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR011
U 1 1 5B3139C5
P 3800 7400
F 0 "#PWR011" H 3800 7400 30  0001 C CNN
F 1 "GND" H 3800 7330 30  0001 C CNN
F 2 "" H 3800 7400 60  0001 C CNN
F 3 "" H 3800 7400 60  0001 C CNN
	1    3800 7400
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:VCC #PWR012
U 1 1 5B313A47
P 3800 6700
F 0 "#PWR012" H 3800 6800 30  0001 C CNN
F 1 "VCC" H 3800 6800 30  0000 C CNN
F 2 "" H 3800 6700 60  0001 C CNN
F 3 "" H 3800 6700 60  0001 C CNN
	1    3800 6700
	1    0    0    -1  
$EndComp
NoConn ~ 4000 4850
NoConn ~ 4000 4750
NoConn ~ 4000 4550
Text GLabel 3700 3700 0    47   Input ~ 0
S-CS
Text GLabel 3700 3800 0    47   Input ~ 0
S-CLK
Text GLabel 3700 3900 0    47   Input ~ 0
S-MOSI
Text GLabel 3700 5450 0    47   Output ~ 0
S-MISO
Text GLabel 3700 3400 0    47   Output ~ 0
SCL
Text GLabel 3700 3200 0    47   Output ~ 0
SDA
$Comp
L tinkerforge:CONN_01X01 P2
U 1 1 5B317B13
P 3500 3000
F 0 "P2" H 3500 3100 50  0000 C CNN
F 1 "DEBUG" V 3600 3000 50  0000 C CNN
F 2 "kicad-libraries:DEBUG_PAD" H 3500 3000 50  0001 C CNN
F 3 "" H 3500 3000 50  0000 C CNN
	1    3500 3000
	-1   0    0    1   
$EndComp
NoConn ~ 4000 3600
NoConn ~ 4000 3500
NoConn ~ 4000 3300
NoConn ~ 4000 3100
NoConn ~ 4000 5550
NoConn ~ 4000 5650
NoConn ~ 4000 5850
NoConn ~ 4000 5950
NoConn ~ 4000 6150
$Comp
L tinkerforge:CONN_01X02 P3
U 1 1 5B319467
P 3500 4700
F 0 "P3" H 3500 4850 50  0000 C CNN
F 1 "BOOT" V 3600 4700 50  0000 C CNN
F 2 "kicad-libraries:SolderJumper" H 3500 4700 50  0001 C CNN
F 3 "" H 3500 4700 50  0000 C CNN
	1    3500 4700
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:GND #PWR013
U 1 1 5B319975
P 3750 4800
F 0 "#PWR013" H 3750 4800 30  0001 C CNN
F 1 "GND" H 3750 4730 30  0001 C CNN
F 2 "" H 3750 4800 60  0001 C CNN
F 3 "" H 3750 4800 60  0001 C CNN
	1    3750 4800
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R R1
U 1 1 5B319E7B
P 3550 6050
F 0 "R1" V 3550 5950 50  0000 C CNN
F 1 "1k" V 3550 6150 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 3550 6050 60  0001 C CNN
F 3 "" H 3550 6050 60  0000 C CNN
	1    3550 6050
	0    1    1    0   
$EndComp
$Comp
L tinkerforge:LED D1
U 1 1 5B31A088
P 3000 6050
F 0 "D1" H 3000 6150 50  0000 C CNN
F 1 "blue" H 3000 5950 50  0000 C CNN
F 2 "kicad-libraries:D0603F" H 3000 6050 50  0001 C CNN
F 3 "" H 3000 6050 50  0000 C CNN
	1    3000 6050
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:VCC #PWR014
U 1 1 5B31A133
P 2750 6000
F 0 "#PWR014" H 2750 6100 30  0001 C CNN
F 1 "VCC" H 2750 6100 30  0000 C CNN
F 2 "" H 2750 6000 60  0001 C CNN
F 3 "" H 2750 6000 60  0001 C CNN
	1    2750 6000
	1    0    0    -1  
$EndComp
Text GLabel 6750 2050 0    47   Input ~ 0
SDA
Text GLabel 6750 1950 0    47   Input ~ 0
SCL
$Comp
L tinkerforge:PCA9306 U8
U 1 1 5B31D6BE
P 8350 1900
F 0 "U8" H 8100 2150 60  0000 C CNN
F 1 "PCA9306D" H 8350 1650 60  0000 C CNN
F 2 "kicad-libraries:SOIC8" H 8350 1900 60  0001 C CNN
F 3 "" H 8350 1900 60  0000 C CNN
	1    8350 1900
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:VCC #PWR015
U 1 1 5B31DCFA
P 7650 1100
F 0 "#PWR015" H 7650 1200 30  0001 C CNN
F 1 "VCC" H 7650 1200 30  0000 C CNN
F 2 "" H 7650 1100 60  0001 C CNN
F 3 "" H 7650 1100 60  0001 C CNN
	1    7650 1100
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:+5V #PWR016
U 1 1 5B31DE4F
P 9000 1100
F 0 "#PWR016" H 9000 1190 20  0001 C CNN
F 1 "+5V" H 9000 1190 30  0000 C CNN
F 2 "" H 9000 1100 60  0000 C CNN
F 3 "" H 9000 1100 60  0000 C CNN
	1    9000 1100
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:GND #PWR017
U 1 1 5B31E1CA
P 7550 2550
F 0 "#PWR017" H 7550 2550 30  0001 C CNN
F 1 "GND" H 7550 2480 30  0001 C CNN
F 2 "" H 7550 2550 60  0001 C CNN
F 3 "" H 7550 2550 60  0001 C CNN
	1    7550 2550
	1    0    0    -1  
$EndComp
$Comp
L tinkerforge:R R2
U 1 1 5B31F581
P 9000 1450
F 0 "R2" V 9000 1550 50  0000 C CNN
F 1 "200k" V 9000 1400 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 9000 1450 60  0001 C CNN
F 3 "" H 9000 1450 60  0000 C CNN
	1    9000 1450
	-1   0    0    1   
$EndComp
$Comp
L tinkerforge:R_PACK4 RP2
U 1 1 5B3218EA
P 9450 1400
F 0 "RP2" H 9450 1850 50  0000 C CNN
F 1 "2k2" H 9450 1350 50  0000 C CNN
F 2 "kicad-libraries:4X0402" H 9450 1400 50  0001 C CNN
F 3 "" H 9450 1400 50  0000 C CNN
	1    9450 1400
	0    1    1    0   
$EndComp
Text GLabel 10050 1950 2    47   Output ~ 0
SCL2
Text GLabel 10050 2050 2    47   Output ~ 0
SDA2
$Comp
L tinkerforge:C C8
U 1 1 5B3232A4
P 9150 2300
F 0 "C8" H 9200 2400 50  0000 L CNN
F 1 "100nF" H 9200 2200 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 9150 2300 60  0001 C CNN
F 3 "" H 9150 2300 60  0000 C CNN
	1    9150 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 4650 7000 4650
Wire Wire Line
	6300 4750 6650 4750
Wire Wire Line
	7700 4950 7800 4950
Wire Wire Line
	7800 5050 7700 5050
Wire Wire Line
	7700 5150 7800 5150
Wire Wire Line
	7800 5250 7700 5250
Wire Wire Line
	9800 4250 10050 4250
Wire Wire Line
	10050 4350 9800 4350
Wire Wire Line
	10050 4550 9800 4550
Wire Wire Line
	10050 5200 9850 5200
Wire Wire Line
	7600 4150 7650 4150
Wire Wire Line
	7800 4850 7650 4850
Wire Wire Line
	7650 4850 7650 4150
Connection ~ 7650 4150
Wire Wire Line
	1500 1700 1800 1700
Wire Wire Line
	2200 1700 2600 1700
Wire Wire Line
	2600 1800 2200 1800
Wire Wire Line
	2200 1900 2600 1900
Wire Wire Line
	2600 2000 2200 2000
Wire Wire Line
	1800 2000 1650 2000
Wire Wire Line
	1650 2500 1650 2450
Wire Wire Line
	1150 2150 1150 2500
Wire Wire Line
	1650 2000 1650 2050
Connection ~ 1650 2000
Wire Wire Line
	1500 1800 1800 1800
Wire Wire Line
	1800 1900 1500 1900
Wire Wire Line
	1500 1600 1650 1600
Wire Wire Line
	1650 1600 1650 1000
Wire Wire Line
	1650 1000 1900 1000
Wire Wire Line
	2300 950  2300 1000
Connection ~ 2300 1000
Wire Wire Line
	1900 1050 1900 1000
Connection ~ 1900 1000
Wire Wire Line
	1500 1500 1900 1500
Wire Wire Line
	2300 1450 2300 1500
Connection ~ 2300 1500
Wire Wire Line
	1900 1450 1900 1500
Connection ~ 1900 1500
Wire Wire Line
	1500 1400 1550 1400
Wire Wire Line
	1550 1400 1550 950 
Wire Wire Line
	3800 6800 3800 6750
Wire Wire Line
	4000 6750 3800 6750
Connection ~ 3800 6750
Wire Wire Line
	3800 7200 3800 7250
Wire Wire Line
	4000 7350 3800 7350
Connection ~ 3800 7350
Wire Wire Line
	4000 7250 3800 7250
Connection ~ 3800 7250
Wire Wire Line
	3700 3000 4000 3000
Wire Wire Line
	4000 3200 3700 3200
Wire Wire Line
	3700 3400 4000 3400
Wire Wire Line
	3700 3700 4000 3700
Wire Wire Line
	4000 3800 3700 3800
Wire Wire Line
	3700 3900 4000 3900
Wire Wire Line
	2750 6000 2750 6050
Wire Wire Line
	2750 6050 2800 6050
Wire Wire Line
	3200 6050 3300 6050
Wire Wire Line
	3800 6050 4000 6050
Wire Wire Line
	4000 5450 3700 5450
Wire Wire Line
	6750 2050 7050 2050
Wire Wire Line
	6750 1950 7350 1950
Wire Wire Line
	7550 1750 7750 1750
Wire Wire Line
	7550 1750 7550 2550
Wire Wire Line
	7650 1850 7750 1850
Wire Wire Line
	7650 1100 7650 1150
Wire Wire Line
	9000 1700 9000 1750
Wire Wire Line
	9000 1750 8950 1750
Wire Wire Line
	9000 1100 9000 1150
Wire Wire Line
	9000 1150 9500 1150
Wire Wire Line
	9800 1150 9800 1200
Connection ~ 9000 1150
Wire Wire Line
	9700 1200 9700 1150
Connection ~ 9700 1150
Wire Wire Line
	9600 1200 9600 1150
Connection ~ 9600 1150
Wire Wire Line
	9500 1200 9500 1150
Connection ~ 9500 1150
Wire Wire Line
	8950 2050 9500 2050
Wire Wire Line
	10050 1950 9800 1950
Wire Wire Line
	9000 1850 8950 1850
Connection ~ 9000 1750
Wire Wire Line
	9500 1600 9500 2050
Connection ~ 9500 2050
Wire Wire Line
	9800 1600 9800 1950
Connection ~ 9800 1950
Wire Wire Line
	9150 2100 9150 1800
Wire Wire Line
	9150 1800 9000 1800
Connection ~ 9000 1800
Wire Wire Line
	9150 2500 9150 2550
$Comp
L tinkerforge:GND #PWR018
U 1 1 5B3239F7
P 9150 2550
F 0 "#PWR018" H 9150 2550 30  0001 C CNN
F 1 "GND" H 9150 2480 30  0001 C CNN
F 2 "" H 9150 2550 60  0001 C CNN
F 3 "" H 9150 2550 60  0001 C CNN
	1    9150 2550
	1    0    0    -1  
$EndComp
NoConn ~ 9600 1600
NoConn ~ 9700 1600
Wire Wire Line
	6650 4800 6650 4750
Connection ~ 6650 4750
Wire Wire Line
	7000 4800 7000 4650
Connection ~ 7000 4650
Text GLabel 6300 4650 0    47   Input ~ 0
SCL2
Text GLabel 6300 4750 0    47   Input ~ 0
SDA2
Wire Wire Line
	6650 5200 6650 5600
Wire Wire Line
	7000 5200 7000 5600
Wire Wire Line
	8950 4450 9000 4450
Wire Wire Line
	9000 4450 9000 5600
Wire Wire Line
	8100 4150 8150 4150
Wire Wire Line
	8150 4150 8150 4200
Wire Wire Line
	4000 4650 3700 4650
Wire Wire Line
	3700 4750 3750 4750
Wire Wire Line
	3750 4750 3750 4800
NoConn ~ 4000 5750
$Comp
L tinkerforge:R_PACK4 RP3
U 1 1 5B45C79E
P 7000 1400
F 0 "RP3" H 7000 1850 50  0000 C CNN
F 1 "2k2" H 7000 1350 50  0000 C CNN
F 2 "kicad-libraries:4X0402" H 7000 1400 50  0001 C CNN
F 3 "" H 7000 1400 50  0000 C CNN
	1    7000 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 1600 7050 2050
Connection ~ 7050 2050
Wire Wire Line
	7350 1600 7350 1950
Connection ~ 7350 1950
Wire Wire Line
	7350 1200 7350 1150
Wire Wire Line
	7050 1150 7150 1150
Connection ~ 7650 1150
Wire Wire Line
	7250 1200 7250 1150
Connection ~ 7350 1150
Wire Wire Line
	7150 1200 7150 1150
Connection ~ 7250 1150
Wire Wire Line
	7050 1200 7050 1150
Connection ~ 7150 1150
NoConn ~ 7150 1600
NoConn ~ 7250 1600
Wire Wire Line
	7650 4150 7700 4150
Wire Wire Line
	1650 2000 1500 2000
Wire Wire Line
	2300 1000 2300 1050
Wire Wire Line
	1900 1000 2300 1000
Wire Wire Line
	2300 1500 2300 1550
Wire Wire Line
	1900 1500 2300 1500
Wire Wire Line
	3800 6750 3800 6700
Wire Wire Line
	3800 7350 3800 7400
Wire Wire Line
	3800 7250 3800 7350
Wire Wire Line
	9000 1150 9000 1200
Wire Wire Line
	9700 1150 9800 1150
Wire Wire Line
	9600 1150 9700 1150
Wire Wire Line
	9500 1150 9600 1150
Wire Wire Line
	9000 1750 9000 1800
Wire Wire Line
	9500 2050 10050 2050
Wire Wire Line
	9800 1950 8950 1950
Wire Wire Line
	9000 1800 9000 1850
Wire Wire Line
	6650 4750 7800 4750
Wire Wire Line
	7000 4650 7800 4650
Wire Wire Line
	7050 2050 7750 2050
Wire Wire Line
	7350 1950 7750 1950
Wire Wire Line
	7650 1150 7650 1850
Wire Wire Line
	7350 1150 7650 1150
Wire Wire Line
	7250 1150 7350 1150
Wire Wire Line
	7150 1150 7250 1150
Wire Wire Line
	9800 4450 10050 4450
Text GLabel 9800 4150 0    47   Input ~ 0
COMD1D2
Text GLabel 7700 5150 0    47   Input ~ 0
COMD1D2
Wire Wire Line
	7800 5350 7700 5350
Text GLabel 9800 4050 0    47   Input ~ 0
COMD3
Wire Wire Line
	10050 4150 9800 4150
Wire Wire Line
	9800 4050 10050 4050
Text GLabel 8850 5550 0    47   Input ~ 0
COMD3
Wire Wire Line
	8950 5550 8950 5350
Wire Wire Line
	8850 5550 8950 5550
Wire Wire Line
	10050 5700 9850 5700
Wire Wire Line
	9850 5700 9850 5200
Wire Wire Line
	10050 5800 9850 5800
Wire Wire Line
	9850 5800 9850 5700
Connection ~ 9850 5700
Wire Wire Line
	8950 5250 9650 5250
Wire Wire Line
	9650 5250 9650 4800
Wire Wire Line
	9650 4800 10050 4800
Wire Wire Line
	10050 5300 9800 5300
Wire Wire Line
	9800 5300 9800 5150
Wire Wire Line
	9800 5150 8950 5150
Wire Wire Line
	10050 4900 9700 4900
Wire Wire Line
	9700 4900 9700 4950
Wire Wire Line
	9700 4950 8950 4950
Wire Wire Line
	8950 4850 9550 4850
Wire Wire Line
	9550 4850 9550 5700
Wire Wire Line
	9550 5700 9850 5700
Wire Wire Line
	8950 4750 9500 4750
Wire Wire Line
	9500 4750 9500 5400
Wire Wire Line
	9500 5400 10050 5400
Wire Wire Line
	9850 4700 9850 5050
Wire Wire Line
	9850 4700 10050 4700
Wire Wire Line
	8950 5050 9850 5050
Wire Wire Line
	9200 5100 9200 4650
Wire Wire Line
	9200 4650 8950 4650
Wire Wire Line
	9200 5100 10050 5100
Wire Wire Line
	10050 5000 9950 5000
Wire Wire Line
	9950 5000 9950 4650
Wire Wire Line
	9950 4650 9350 4650
Wire Wire Line
	9350 4650 9350 4550
Wire Wire Line
	9350 4550 8950 4550
$EndSCHEMATC
