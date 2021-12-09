#!/bin/bash


mkdir rov
cd rov
wget https://raw.githubusercontent.com/luser/gamepadtest/master/gamepadtest.js
wget https://raw.githubusercontent.com/luser/gamepadtest/master/index.html

cp gamepadtest.js /var/www/html
cp index.html /var/www/html

