import sys
import serial

ser = serial.Serial('/dev/ttyAMA0', 9600, timeout=.5)


incoming = ser.readline()
print incoming