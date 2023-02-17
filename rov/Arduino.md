https://forum.arduino.cc/t/faster-uploads-than-arduino-cli-upload/1052037

I'm trying to use arduino-cli to upload a pre-compiled and exported .hex file to a Nano connected via USB to an old Raspberry Pi (with 256mb RAM, relatively slow IO, etc). My sketch is about 50K when compiled.

Running arduino-cli upload -p /dev/ttyUSB0 --fqbn arduino:avr:nano -i mysketch.ino.eightanaloginputs.hex takes a good few minutes, consumes around 100MB of RAM and on my very resource-constrained system, sometimes fails altogether.

I went in search of something "better". I appreciate this is a bit specific to my setup, and so other chip and board types may need to do something different, but this works in a fraction of the time, with a fraction of the resources:

avrdude -v -patmega328p -carduino -b115200 -P /dev/ttyUSB0 -D -Uflash:w:mysketch.ino.eightanaloginputs.hex

To get the .hex file, I'm writing the code on my laptop in the Arduino IDE (with the board type set to "Nano", as that's what I'm using) and clicking Sketch->Export Compiled Binary. It's creating the file mysketch.ino.eightanaloginputs.hex in the project folder, which I'm then SCPing over to the Raspberry Pi to upload to the Arduino. If you're just starting out on the Pi, then you'll need to run sudo apt install avrdude to get the avrdude program.

I hope this maybe helps someone else out some day :slight_smile:
