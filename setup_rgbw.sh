#!/bin/bash

###
# The script can run on a fresh Raspberry Pi, everything is downloaded, installed and configured.
# Tested on RPi4 and Bullseye.
# The LED is connected to GPIO18 (Pin 12 on the Raspberry Pi).
# https://el3.no/wp-content/uploads/2020/10/GPIO-Pinout-Diagram-2.png
# To run the script :
: '

wget https://raw.githubusercontent.com/jarleven/flaskapp/main/setup.sh && chmod +x setup.sh && ./setup.sh

'

# Credits to :
# https://github.com/naztronaut/RaspberryPi-browser-led-control/tree/master/utils


sudo apt update
sudp apt upgrade -y

sudo apt remove -y python2
sudo apt remove -y python-is-python2
sudo apt autoremove -y --purge
sudo apt update

sudo apt install -y git
sudo apt install -y vim

sudo apt install -y python3
sudo apt install -y python3-pip
sudo apt install -y apache2
sudo apt install -y libapache2-mod-wsgi-py3

sudo apt-get install -y python-is-python3

sudo pip3 install flask
sudo pip3 install RPi.GPIO




cd /var/www/html
sudo rm index.html 
sudo wget https://raw.githubusercontent.com/naztronaut/RaspberryPi-browser-led-control/master/index.html
sudo wget https://raw.githubusercontent.com/naztronaut/RaspberryPi-browser-led-control/master/script.js
sudo wget https://raw.githubusercontent.com/naztronaut/RaspberryPi-browser-led-control/master/style.css

cd /etc/apache2/sites-available
sudo wget https://raw.githubusercontent.com/naztronaut/RaspberryPi-browser-led-control/master/utils/apache-led.conf


sudo mkdir /var/www/led
cd /var/www/led

sudo wget https://raw.githubusercontent.com/naztronaut/RaspberryPi-RGBW-Control/master/utils/activate_this.py

sudo wget https://raw.githubusercontent.com/naztronaut/RaspberryPi-browser-led-control/master/led/led.py
sudo wget https://raw.githubusercontent.com/naztronaut/RaspberryPi-browser-led-control/master/led/led.wsgi

sudo chown -R pi:pi .

# Modify led.wsgi as it's not in a virtual environment
# activate_this = '/var/www/led/activate_this.py'
sudo sed -i "s/activate_this = '\/var\/www\/led\/venv\/bin\/activate_this.py'/activate_this = '\/var\/www\/led\/activate_this.py'/g" led.wsgi



sudo a2ensite apache-led.conf
sudo a2dissite 000-default.conf
sudo service apache2 restart
#sudo systemctl reload apache2
