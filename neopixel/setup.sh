#!/bin/bash

# https://learn.adafruit.com/neopixels-on-raspberry-pi/python-usage

sudo pip3 install rpi_ws281x adafruit-circuitpython-neopixel
sudo python3 -m pip install --force-reinstall adafruit-blinka



import board
import neopixel
pixels = neopixel.NeoPixel(board.D18, 8)

# Pin 12 / D18


