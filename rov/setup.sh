#!/bin/bash

# To run the script :
: '

wget https://raw.githubusercontent.com/jarleven/flaskapp/main/rov/setup.sh && chmod +x setup.sh && ./setup.sh

# Create new user pi with home dir in sudoers group with bash shell.
useradd -m pi -G sudo
sudo usermod -s /bin/bash pi

'

###
# The script can run on a fresh Raspberry Pi, everything is downloaded, installed and configured.
# Tested on RPi4 and Bullseye.

# Trying on x86/Ubuntu and NVIDIA Jetson Nano
# During installation use username "pi"

if [ $USER != "pi" ]; then
        echo "Script must be run as user: pi"
        exit -1
fi

# Credits to :
# Ted Mielczarek https://github.com/luser/gamepadtest.git
# Nazmus Nasir https://github.com/naztronaut/RaspberryPi-RGBW-Control


sudo apt update
sudo apt upgrade -y

sudo apt install -y git vim

sudo apt install -y python3 python3-pip

sudo apt install -y apache2
sudo apt install -y libapache2-mod-wsgi-py3

sudo pip3 install flask
sudo python3 -m pip install pyserial

# Had issues with Chenese knockoff with CH341 USB2Serial chip (Ubuntu 22.10)
# ch341-uart ttyUSB0: ch341-uart converter now disconnected from ttyUSB0
# sudo apt remove brltty

# Add the pi user to the dialout group (Serial motorcontroller now)
sudo usermod -a -G dialout pi

# TODO: Check what/why
sudo a2enmod headers

git clone https://github.com/jarleven/flaskapp.git
cd ~/flaskapp
git pull

cd ~/flaskapp/rov

sudo rm /var/www/html/index.html

sudo rm -rf /var/www/html/rov
sudo mkdir /var/www/html/rov

sudo \cp -r apache-rov.conf /etc/apache2/sites-available/

sudo \cp -r gamepadtest.js /var/www/html/
sudo \cp -r index.html /var/www/html/

sudo \cp -r rov.py /var/www/html/rov/
sudo \cp -r rov.wsgi /var/www/html/rov/

sudo chown -R pi:pi /var/www/html

sudo a2dissite 000-default.conf
sudo a2ensite apache-rov.conf
sudo systemctl reload apache2

: '

Debugging Apache2
tail -f /var/log/apache2/other_vhosts_access.log
tail -f /var/log/apache2/error.log
tail -f /home/pi/record.log

'
