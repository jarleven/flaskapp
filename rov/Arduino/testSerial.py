import serial 
import serial.tools.list_ports
import time


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


try:

    # Setup non blocking serialport
    ser = serial.Serial(serport, 115200, timeout=0,  writeTimeout=0)
    print("Wait for serial port to reset....")
    time.sleep(3)
    
    right = 0.5
    left = 0.5
    busy=0
    write=0


    for i in range(100):
        #serialdata=("%s,%s,s\n" % (str(int(right * 255)), str(int(left * 255))))
        serialdata=("o %s %s\r" % (str(int(right * 255)), str(int(left * 255))))
        if ser.out_waiting < 20:

            print("Busy is %d written %d" % (busy, write))
            print(serialdata)
            ser.write(serialdata.encode())
            write=write+1
            
        else:
            busy=busy+1

        #time.sleep(1)
    
except serial.serialutil.SerialException:
    print("Arduino not connected, at least not as ttyUSB0 or ttyACM0")

