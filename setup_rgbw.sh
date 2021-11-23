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
#sudo pip3 install RPi.GPIO



git clone https://github.com/naztronaut/RaspberryPi-RGBW-Control.git



sudo rm /var/www/html/index.html

sudo cp ~/RaspberryPi-RGBW-Control/index.html  /var/www/html/
sudo cp ~/RaspberryPi-RGBW-Control/script.js   /var/www/html/
sudo cp ~/RaspberryPi-RGBW-Control/style.css   /var/www/html/
sudo cp -r ~/RaspberryPi-RGBW-Control/static   /var/www/html/

sudo mkdir /var/www/html/rgbw

sudo cp ~/RaspberryPi-RGBW-Control/utils/activate_this.py /var/www/html/rgbw/

sudo cp ~/RaspberryPi-RGBW-Control/rgb.json /var/www/html/rgbw/
sudo cp ~/RaspberryPi-RGBW-Control/rgbw.py /var/www/html/rgbw/
sudo cp ~/RaspberryPi-RGBW-Control/rgbw.wsgi /var/www/html/rgbw/
sudo cp ~/RaspberryPi-RGBW-Control/white.json /var/www/html/rgbw/


sudo cp ~/RaspberryPi-RGBW-Control/utils/apache-led.conf  /etc/apache2/sites-available/


sudo chown -R pi:pi /var/www/html/rgbw


cp ~/RaspberryPi-RGBW-Control/utils/pigpio.zip .
unzip pigpio.zip
cd PIGPIO
make
sudo make install




sudo a2dissite apache-led.conf
sudo a2dissite 000-default.conf

sudo a2ensite apache-led.conf
sudo service apache2 restart

#sudo systemctl reload apache2

# Debugging Apache2
# tail -f /var/log/apache2/other_vhosts_access.log
# tail -f /var/log/apache2/error.log

# In the crontab add
# crontab -e
# 
# @reboot sudo pigpiod

# My changes
pi@raspberrypi:~ $ diff ~/RaspberryPi-RGBW-Control/utils/apache-led.conf  /etc/apache2/sites-available/apache-led.conf
4c4
<         WSGIScriptAlias /api/lr /var/www/html/rgbw/rgbw.wsgi
---
>         WSGIScriptAlias /html/rgbw /var/www/html/rgbw/rgbw.wsgi
12c12
< </VirtualHost>
\ No newline at end of file
---
> </VirtualHost>

pi@raspberrypi:~ $ diff ~/RaspberryPi-RGBW-Control/script.js  /var/www/html/script.js
2c2
<     url: 'http://192.168.1.225',
---
>     url: 'http://192.168.3.111',
122c122
<             url: `${config.url}/api/lr/?${queryBuilder}&${cacheBuster}`,
---
>             url: `${config.url}/html/rgbw/?${queryBuilder}&${cacheBuster}`,
135c135
<             url: `${config.url}/api/lr/white?white=${frequency}&${cacheBuster}`,
---
>             url: `${config.url}/html/rgbw/white?white=${frequency}&${cacheBuster}`,
171c171
<             url: `${config.url}/api/lr/getStatus?colors=${color}&${cacheBuster}`,
---
>             url: `${config.url}/html/rgbw/getStatus?colors=${color}&${cacheBuster}`,
187c187
< });
\ No newline at end of file
---
> });



pi@raspberrypi:~ $ diff ~/RaspberryPi-RGBW-Control/rgbw.py /var/www/html/rgbw/rgbw.py
21c21
<     # pi.set_PWM_dutycycle(18, white)
---
>     pi.set_PWM_dutycycle(18, white)


pi@raspberrypi:~ $ diff ~/RaspberryPi-RGBW-Control/rgbw.wsgi /var/www/html/rgbw/rgbw.wsgi
3c3
< activate_this = '/var/www/html/rgbw/venv/bin/activate_this.py'
---
> activate_this = '/var/www/html/rgbw/activate_this.py'
10c10
< from rgbw import app as application
\ No newline at end of file
---
> from rgbw import app as application



