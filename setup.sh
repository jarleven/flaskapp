#!/bin/bash

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

sudo chown -R pi:pi .

sudo wget https://raw.githubusercontent.com/naztronaut/RaspberryPi-RGBW-Control/master/utils/activate_this.py

sudo wget https://raw.githubusercontent.com/naztronaut/RaspberryPi-browser-led-control/master/led/led.py
sudo wget https://raw.githubusercontent.com/naztronaut/RaspberryPi-browser-led-control/master/led/led.wsgi



# Modify led.wsgi
# activate_this = '/var/www/led/activate_this.py'
sudo sed -i "s/activate_this = '\/var\/www\/led\/venv\/bin\/activate_this.py'/activate_this = '\/var\/www\/led\/activate_this.py'/g" led.wsgi




sudo a2ensite apache-led.conf
sudo a2dissite 000-default.conf
sudo service apache2 restart
#sudo systemctl reload apache2
