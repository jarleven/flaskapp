#!/bin/bash

# https://learn.adafruit.com/neopixels-on-raspberry-pi/python-usage

sudo pip3 install rpi_ws281x adafruit-circuitpython-neopixel
sudo python3 -m pip install --force-reinstall adafruit-blinka

#sudo -H pip install --upgrade --force-reinstall rpi_ws281x adafruit-circuitpython-neopixel
#sudo -H pip install --upgrade --force-reinstall adafruit-blinka

#sudo usermod -a -G spi,gpio,i2c pi


# ---- Python file ----
: '

import board
import neopixel
pixels = neopixel.NeoPixel(board.D18, 8)

# Header pin # 12 / D18

pixels.fill((0, 255, 0))
pixels[0] = (255, 0, 0)

'
# -----------------------


: '
```

        3V3  (1) (2)  5V
      GPIO2  (3) (4)  5V        NEOPIXEL VCC
      GPIO3  (5) (6)  GND       NEOPIXEL GND
      GPIO4  (7) (8)  GPIO14
        GND  (9) (10) GPIO15
     GPIO17 (11) (12) GPIO18    NEOPIXEL DATA  (Through 100 ohm)
     GPIO27 (13) (14) GND
     GPIO22 (15) (16) GPIO23
        3V3 (17) (18) GPIO24
     GPIO10 (19) (20) GND
      GPIO9 (21) (22) GPIO25
     GPIO11 (23) (24) GPIO8
        GND (25) (26) GPIO7
      GPIO0 (27) (28) GPIO1
      GPIO5 (29) (30) GND
      GPIO6 (31) (32) GPIO12
     GPIO13 (33) (34) GND
     GPIO19 (35) (36) GPIO16
     GPIO26 (37) (38) GPIO20
        GND (39) (40) GPIO21


Typically, WS2812 NeoPixels reqire VCC, VSS (GND) and DI pins connecting to the Raspberry Pi, where the DI pin is usually connected to a PWM control pin such as GPIO 18.

```
'



