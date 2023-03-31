## Programming the Arduino Uno from a headless Raspberry Pi

Nice guide at : 
* https://skjoldtech.wordpress.com/2019/05/10/flashing-arduino-hex-file-in-linux-with-avrdude/

```
sudo apt-get install -y avrdude

sudo usermod -a -G dialout $USER
#sudo chmod a+rw /dev/ttyUSB0

sudo avrdude -v -V -p atmega328p -c arduino -P /dev/ttyACM0 -b 115200 -D -U flash:w:/home/pi/flaskapp/rov/Arduino/usbPWM/build/arduino.avr.uno/usbPWM.ino.hex:i
```

### Fix issue with Chinese Arduino clone - was using Ubuntu 22.10
```
ch341-uart ttyUSB0: ch341-uart converter now disconnected from ttyUSB0
sudo apt remove brltty
```

CH341 driver 
* http://www.wch-ic.com/products/CH341.html

![Create HEX file](https://skjoldtech.files.wordpress.com/2019/05/arduino.png)







### Output when uploading hex file to Arduino Uno
```
avrdude: Version 6.3-20171130
         Copyright (c) 2000-2005 Brian Dean, http://www.bdmicro.com/
         Copyright (c) 2007-2014 Joerg Wunsch

         System wide configuration file is "/etc/avrdude.conf"
         User configuration file is "/root/.avrduderc"
         User configuration file does not exist or is not a regular file, skipping

         Using Port                    : /dev/ttyACM0
         Using Programmer              : arduino
         Overriding Baud Rate          : 115200
         AVR Part                      : ATmega328P
         Chip Erase delay              : 9000 us
         PAGEL                         : PD7
         BS2                           : PC2
         RESET disposition             : dedicated
         RETRY pulse                   : SCK
         serial program mode           : yes
         parallel program mode         : yes
         Timeout                       : 200
         StabDelay                     : 100
         CmdexeDelay                   : 25
         SyncLoops                     : 32
         ByteDelay                     : 0
         PollIndex                     : 3
         PollValue                     : 0x53
         Memory Detail                 :

                                  Block Poll               Page                       Polled
           Memory Type Mode Delay Size  Indx Paged  Size   Size #Pages MinW  MaxW   ReadBack
           ----------- ---- ----- ----- ---- ------ ------ ---- ------ ----- ----- ---------
           eeprom        65    20     4    0 no       1024    4      0  3600  3600 0xff 0xff
           flash         65     6   128    0 yes     32768  128    256  4500  4500 0xff 0xff
           lfuse          0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
           hfuse          0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
           efuse          0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
           lock           0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
           calibration    0     0     0    0 no          1    0      0     0     0 0x00 0x00
           signature      0     0     0    0 no          3    0      0     0     0 0x00 0x00

         Programmer Type : Arduino
         Description     : Arduino
         Hardware Version: 3
         Firmware Version: 3.3
         Vtarget         : 0.3 V
         Varef           : 0.3 V
         Oscillator      : 28.800 kHz
         SCK period      : 3.3 us

avrdude: AVR device initialized and ready to accept instructions

Reading | ################################################## | 100% 0.00s

avrdude: Device signature = 0x1e950f (probably m328p)
avrdude: safemode: lfuse reads as 0
avrdude: safemode: hfuse reads as 0
avrdude: safemode: efuse reads as 0
avrdude: reading input file "/home/pi/flaskapp/rov/usbPWM.ino.hex"
avrdude: writing flash (4328 bytes):

Writing | ################################################## | 100% 0.70s

avrdude: 4328 bytes of flash written

avrdude: safemode: lfuse reads as 0
avrdude: safemode: hfuse reads as 0
avrdude: safemode: efuse reads as 0
avrdude: safemode: Fuses OK (E:00, H:00, L:00)

avrdude done.  Thank you.
```
