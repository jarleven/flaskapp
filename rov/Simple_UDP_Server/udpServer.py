# https://wiki.python.org/moin/UdpCommunication

import socket

import serial 
import serial.tools.list_ports
import time


UDP_IP = "0.0.0.0"
UDP_PORT = 5005

myports = [tuple(p) for p in list(serial.tools.list_ports.comports())]
print("List of serialports :")
print(myports)

# Arduino Uno is normally /dev/ttyACM0.
serport="not-found"
    
if 'ttyACM0' in str(myports):
    serport="/dev/ttyACM0"
    print("Use : %s" % serport)
elif 'ttyUSB0' in str(myports):
    serport="/dev/ttyUSB0"
    print("Use : %s" % serport)

if serport == "not-found":
    print("Did not find any Arduino, sayonnara")
    exit()

ser = serial.Serial(serport, 115200, timeout=0,  writeTimeout=0)
print("Wait for serial port to reset....")
time.sleep(3)


sock = socket.socket(socket.AF_INET,    # Internet
                     socket.SOCK_DGRAM) # UDP
sock.bind((UDP_IP, UDP_PORT))

# Keep track of serialport activity
busy=0
write=0

while True:
    data, addr = sock.recvfrom(1024) # buffer size is 1024 bytes
    print("received message: %s" % data)

    #data=("%s,%s,s\n" % (str(int(right * 255)), str(int(left * 255))))
    if ser.out_waiting < 20:
        print("Busy is %d written %d" % (busy, write))
        print(data)
        ser.write(data)
        write=write+1
            
    else:
        busy=busy+1
