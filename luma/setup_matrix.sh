#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y vim git


sudo apt install -y build-essential libfreetype6-dev libjpeg-dev libopenjp2-7 libtiff5
sudo apt install -y python3 python3-pip python3-dev


#sudo raspi-config nonint do_spi 1
sudo usermod -a -G spi,gpio pi


#lsmod | grep -i spi

sudo -H pip install --upgrade --ignore-installed pip setuptools
	

#sudo python3 -m pip install --upgrade luma.core

sudo python3 -m pip install --upgrade luma.led_matrix
sudo python3 -m pip install --upgrade --force-reinstall luma.led_matrix

sudo -H pip install --upgrade --ignore-installed Pillow		# Mirrored matrix




git clone https://github.com/rm-hull/luma.led_matrix.git


echo ""
echo ""
echo ""
echo "cd luma.led_matrix/"
echo "python3 examples/matrix_demo.py"





sudo apt install python3
sudo apt-get install python3-pip


#sudo raspi-config nonint do_spi 1


sudo usermod -a -G spi,gpio pi
sudo apt install build-essential python3-dev python3-pip libfreetype6-dev libjpeg-dev libopenjp2-7 libtiff5

# The default pip and setuptools bundled with apt on Raspbian are really old, and can cause components to not be installed properly. Make sure they are up to date by upgrading them first:
sudo -H pip install --upgrade --ignore-installed pip setuptools


sudo python3 -m pip install --upgrade luma.led_matrix

git clone https://github.com/rm-hull/luma.led_matrix.git
#git clone !

cd luma.led_matrix/
python examples/matrix_demo.py


https://downloads.raspberrypi.org/raspios_full_armhf/images



: '
```Bash

			   3V3  (1) (2)  5V			2 VCC
			 GPIO2  (3) (4)  5V			  VCC
			 GPIO3  (5) (6)  GND			6 GND
			 GPIO4  (7) (8)  GPIO14
       GND		   GND  (9) (10) GPIO15
       GPIO17 (11) (12) GPIO18
       GPIO27 (13) (14) GND
       GPIO22 (15) (16) GPIO23
			    3V3 (17) (18) GPIO24
Grå	DIN 19		GPIO10 (19) (20) GND
			 GPIO9 (21) (22) GPIO25
Lilla	CLK 23		GPIO11 (23) (24) GPIO8			24 Enable/CS kvit
			   GND (25) (26) GPIO7
			 GPIO0 (27) (28) GPIO1
			 GPIO5 (29) (30) GND
			 GPIO6 (31) (32) GPIO12
			GPIO13 (33) (34) GND
			GPIO19 (35) (36) GPIO16
			GPIO26 (37) (38) GPIO20
			   GND (39) (40) GPIO21

```
'



--- /usr/local/lib/python3.7/dist-packages/luma/led_matrix/device.py	2021-12-02 18:51:39.150976657 +0000
+++ ./device.py	2021-12-02 18:51:08.871460758 +0000
@@ -40,6 +40,7 @@
 from luma.core.util import observable
 from luma.core.virtual import sevensegment
 from luma.led_matrix.segment_mapper import dot_muncher, regular
+from PIL import Image, ImageOps
 
 
 __all__ = ["max7219", "ws2812", "neopixel", "neosegment", "apa102", "unicornhathd"]
@@ -121,6 +122,7 @@
         assert(image.mode == self.mode)
         assert(image.size == self.size)
 
+        image = ImageOps.flip(image)
         image = self.preprocess(image)
 
         i = 0

