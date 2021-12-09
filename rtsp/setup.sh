#!/bin/bash

# Install dependencies and update system

sudo apt update
audo apt upgrade -y
sudo apt install -y cmake git libssl-dev libasound2-dev liblog4cpp5-dev liblivemedia-dev

# Download/clone v4l2rtspserver project

cd ~
git clone https://github.com/mpromonet/v4l2rtspserver.git

# Build and install server

cd v4l2rtspserver
cmake .
make

sudo make install



# Start the server. You have to know what camera to use
echo "To start the server"
echo "v4l2rtspserver /dev/video0 &"
