#!/bin/bash

###
# The script can run on a fresh Raspberry Pi, everything is downloaded, installed and configured.
# Tested on RPi4 and Bullseye.
# The LED is connected to GPIO18 (Pin 12 on the Raspberry Pi).
# https://el3.no/wp-content/uploads/2020/10/GPIO-Pinout-Diagram-2.png



# To run the script :
: '

wget https://raw.githubusercontent.com/jarleven/flaskapp/main/setup_rgbw.sh && chmod +x setup_rgbw.sh && ./setup_rgbw.sh

'
: '
```

  Color	   GPIO    40-Pin header
 --------------------------------
  Red       24        18  
  Green     25        22
  Blue      20        38
  White     18        12

```
'

# Credits to :
# https://github.com/naztronaut/RaspberryPi-RGBW-Control


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



git clone https://github.com/naztronaut/RaspberryPi-RGBW-Control.git

sudo a2ensite apache-led.conf
sudo a2dissite 000-default.conf
sudo service apache2 restart
#sudo systemctl reload apache2
