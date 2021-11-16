#!/bin/bash

sudo apt remove -y python2
sudo apt remove -y python-is-python2
sudo apt autoremove -y --purge


sudo apt update
sudp apt upgrade -y

sudo apt install -y git
sudo apt install -y vim

sudo apt install -y python3
sudo apt install -y python3-pip
sudo apt install -y apache2
sudo apt install -y libapache2-mod-wsgi-py3

sudo apt-get install -y python-is-python3

sudo pip3 install flask

