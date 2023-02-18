import serial 
import time

# Arduino Uno is normally /dev/ttyACM0. Setup non blocking serialport
ser = serial.Serial('/dev/ttyUSB0', 115200, timeout=0,  writeTimeout=0)

right = 0.5
left = 0.5
busy=0
write=0

for i in range(1000):
    serialdata=("%s,%s,s\n" % (str(int(right * 255)), str(int(left * 255))))
    if ser.out_waiting < 20:

        print("Busy is %d written %d" % (busy, write))
        print(serialdata)
        ser.write(serialdata.encode())
        write=write+1
        
    else:
        busy=busy+1

    time.sleep(1)
