#!/bin/bash


: '
wget https://raw.githubusercontent.com/jarleven/flaskapp/main/luma/setup_matrix.sh && chmod +x setup_matrix.sh && ./setup_matrix.sh
'

cd ~

sudo apt update
sudo apt upgrade -y
sudo apt install -y vim git


sudo apt install -y build-essential libfreetype6-dev libjpeg-dev libopenjp2-7 libtiff5
sudo apt install -y python3 python3-pip python3-dev
sudo apt install -y python3-venv

sudo raspi-config nonint do_spi 0
sudo usermod -a -G spi,gpio pi

export CFLAGS=-fcommon
git clone https://github.com/rm-hull/luma.led_matrix.git

python3 -m venv led_matrix_env
source led_matrix_env/bin/activate

cd luma.led_matrix/
pip install -vvv -e . --no-cache-dir

python3 examples/matrix_demo.py



: '
```Bash

			   3V3  (1) (2)  5V			2 VCC
			 GPIO2  (3) (4)  5V			  
			 GPIO3  (5) (6)  GND			6 GND
			 GPIO4  (7) (8)  GPIO14
			   GND  (9) (10) GPIO15
			GPIO17 (11) (12) GPIO18
			GPIO27 (13) (14) GND
			GPIO22 (15) (16) GPIO23
			   3V3 (17) (18) GPIO24
   	DIN 19		GPIO10 (19) (20) GND
			 GPIO9 (21) (22) GPIO25
     	CLK 23		GPIO11 (23) (24) GPIO8			24 Enable/CS
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



lsmod | grep -i spi

echo ""
echo ""
echo ""
echo "source led_matrix_env/bin/activate"
echo "cd luma.led_matrix/"
echo "python3 examples/matrix_demo.py"






