#!/bin/bash

###
# The script can run on a fresh Raspberry Pi, everything is downloaded, installed and configured.
# Tested on RPi4 and Bullseye.



# To run the script :
: '

wget https://raw.githubusercontent.com/jarleven/flaskapp/main/setup_gamepad.sh && chmod +x setup_gamepad.sh && ./setup_gamepad.sh

'
: '
```
  Function        GPIO    40-Pin header
 ---------------------------------------
  Right Forward    24        18  
  Right Reverse    25        22
  Left Forward     20        38
  Left Reverse     18        12
```
'

# Credits to :
# Ted Mielczarek https://github.com/luser/gamepadtest.git
# Nazmus Nasir https://github.com/naztronaut/RaspberryPi-RGBW-Control



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
#sudo pip3 install RPi.GPIO

# TODO: Check what/why
sudo a2enmod headers


git clone https://github.com/naztronaut/RaspberryPi-RGBW-Control.git

# Apply my changes
# ~/RaspberryPi-RGBW-Control $ git diff > rgbw.diff

cd RaspberryPi-RGBW-Control
wget https://raw.githubusercontent.com/jarleven/flaskapp/main/rgbw.diff
git apply rgbw.diff
cd ~

sudo rm /var/www/html/index.html

#sudo cp ~/RaspberryPi-RGBW-Control/index.html  /var/www/html/
#sudo cp ~/RaspberryPi-RGBW-Control/script.js   /var/www/html/
#sudo cp ~/RaspberryPi-RGBW-Control/style.css   /var/www/html/
#sudo cp -r ~/RaspberryPi-RGBW-Control/static   /var/www/html/

sudo mkdir /var/www/html/rgbw

sudo cp ~/RaspberryPi-RGBW-Control/utils/activate_this.py /var/www/html/rgbw/

#sudo cp ~/RaspberryPi-RGBW-Control/rgbw.py /var/www/html/rgbw/
sudo cp ~/RaspberryPi-RGBW-Control/rgbw.wsgi /var/www/html/rgbw/
#sudo cp ~/RaspberryPi-RGBW-Control/white.json /var/www/html/rgbw/
#sudo cp ~/RaspberryPi-RGBW-Control/rgb.json /var/www/html/rgbw/


sudo cp ~/RaspberryPi-RGBW-Control/utils/apache-led.conf  /etc/apache2/sites-available/


cd ~
mkdir mygamepad
cd mygamepad

wget https://raw.githubusercontent.com/jarleven/flaskapp/main/gamepadtest.js
wget https://raw.githubusercontent.com/jarleven/flaskapp/main/rgbw.py
wget https://raw.githubusercontent.com/jarleven/flaskapp/main/index.html

sudo cp ~/mygamepad/rgbw.py    /var/www/html/rgbw/
sudo cp ~/mygamepad/index.html /var/www/html/
sudo cp ~/mygamepad/gamepad.js /var/www/html/


#sudo chown -R pi:pi /var/www/html/rgbw
sudo chown -R pi:pi /var/www/html

# Install pigpio daemon

cp ~/RaspberryPi-RGBW-Control/utils/pigpio.zip .
unzip pigpio.zip
cd PIGPIO
make
sudo make install




sudo a2dissite apache-led.conf
sudo a2dissite 000-default.conf

sudo a2ensite apache-led.conf
#sudo service apache2 restart

sudo systemctl reload apache2

# Debugging Apache2
# tail -f /var/log/apache2/other_vhosts_access.log
# tail -f /var/log/apache2/error.log
# tail -f /home/pi/record.log

sudo pigpiod

# In case the crontab does not exist we need to catch and handle some errors
# For testing, delete the cronab for user pi with :
#  crontab -r -u pi
# In the crontab add
# @reboot sudo pigpiod

cat <(crontab -l 2>/dev/null) <(echo "@reboot sudo pigpiod") | crontab -



