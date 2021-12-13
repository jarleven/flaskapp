#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y vim git

  sudo usermod -a -G spi,gpio pi
sudo usermod -a -G spi,gpio,i2c pi

sudo apt install -y python3 python3-pip python3-dev 
sudo apt install -y build-essential
# sudo apt install -y libfreetype6-dev libjpeg-dev libopenjp2-7 libtiff5

sudo apt install -y libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev libopenjp2-7 libtiff5




 


# The default pip and setuptools bundled with apt on Raspbian are really old, and can cause components to not be installed properly. Make sure they are up to date by upgrading them first:
sudo -H pip install --upgrade --ignore-installed pip setuptools

sudo -H pip3 install luma.lcd


#sudo raspi-config nonint do_spi 1
