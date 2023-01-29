#!/bin/bash

sudo apt update && sudo apt upgrade -y

# Thanks to Q-engineering   https://qengineering.eu/install-gstreamer-1.18-on-raspberry-pi-4.html

# install a missing dependency
sudo apt-get install -y libx264-dev libjpeg-dev

# install the remaining plugins
sudo apt-get install -y libgstreamer1.0-dev \
     libgstreamer-plugins-base1.0-dev \
     libgstreamer-plugins-bad1.0-dev \
     gstreamer1.0-plugins-ugly \
     gstreamer1.0-tools \
     gstreamer1.0-gl \
     gstreamer1.0-gtk3

# if you have Qt5 install this plugin
sudo apt-get install -y gstreamer1.0-qt5

# install if you want to work with audio
sudo apt-get install -y gstreamer1.0-pulseaudio
