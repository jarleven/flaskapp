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






