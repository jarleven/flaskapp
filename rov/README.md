# Setup ROV with gamepad control

```bash

wget https://raw.githubusercontent.com/jarleven/flaskapp/main/rov/setup.sh && chmod +x setup.sh && ./setup.sh

```

```

   pi.set_PWM_dutycycle(20, redL)
   pi.set_PWM_dutycycle(18, greenL)


                    3V3  (1) (2)  5V
     SDA          GPIO2  (3) (4)  5V
     SCL          GPIO3  (5) (6)  GND
                  GPIO4  (7) (8)  GPIO14
                    GND  (9) (10) GPIO15
                 GPIO17 (11) (12) GPIO18    PWM(A) Green Left
                 GPIO27 (13) (14) GND
                 GPIO22 (15) (16) GPIO23
                    3V3 (17) (18) GPIO24    Red Right
                 GPIO10 (19) (20) GND
                  GPIO9 (21) (22) GPIO25    Green Right
                 GPIO11 (23) (24) GPIO8
                    GND (25) (26) GPIO7
                  GPIO0 (27) (28) GPIO1
                  GPIO5 (29) (30) GND
                  GPIO6 (31) (32) GPIO12    PWM(A)
   PWM(B)        GPIO13 (33) (34) GND
   PWM(B)        GPIO19 (35) (36) GPIO16
                 GPIO26 (37) (38) GPIO20    Red Left
                    GND (39) (40) GPIO21

   The RPI have two PWM hardware PWM channels. 
   There are 4 PWM pins on the Raspberry Pi, but each pair of the 4 pins is sharing one PWM resource.
   GPIO12 and GPIO 18 are sharing one PWM channel while GPIO 13 and GPIO 19 are sharing on the other one.
   This means that there are only 2 unique/controllable PWM channels on the pi.
   "https://embeddedcircuits.com/raspberry-pi/tutorial/how-to-generate-pwm-signal-from-raspberry-pi"
   

```

```
Investigate HW PWM on the Raspberry Pi
   http://abyz.me.uk/rpi/pigpio/python.html#hardware_PWM

```
