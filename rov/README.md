# Setup ROV with gamepad control

```bash

wget https://raw.githubusercontent.com/jarleven/flaskapp/main/rov/setup.sh && chmod +x setup.sh && ./setup.sh

```

```
   GPIOxx used
   pi.set_PWM_dutycycle(24, redR)
   pi.set_PWM_dutycycle(25, greenR)

   pi.set_PWM_dutycycle(20, redL)
   pi.set_PWM_dutycycle(18, greenL)


        3V3  (1) (2)  5V
      GPIO2  (3) (4)  5V
      GPIO3  (5) (6)  GND
      GPIO4  (7) (8)  GPIO14
        GND  (9) (10) GPIO15
     GPIO17 (11) (12) GPIO18    Green Left
     GPIO27 (13) (14) GND
     GPIO22 (15) (16) GPIO23
        3V3 (17) (18) GPIO24    Red Right
     GPIO10 (19) (20) GND
      GPIO9 (21) (22) GPIO25    Green Right
     GPIO11 (23) (24) GPIO8
        GND (25) (26) GPIO7
      GPIO0 (27) (28) GPIO1
      GPIO5 (29) (30) GND
      GPIO6 (31) (32) GPIO12
     GPIO13 (33) (34) GND
     GPIO19 (35) (36) GPIO16
     GPIO26 (37) (38) GPIO20    Red Left
        GND (39) (40) GPIO21



```
