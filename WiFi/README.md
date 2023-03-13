

### TP-LINK Archer T3U Plus
```
https://www.tp-link.com/no/home-networking/high-gain-adapter/archer-t3u-plus/

WI1 chip1: Realtek RTL8812BU

Works on Pi4 / Bullseye :
	https://github.com/morrownr/88x2bu-20210702


sudo apt update && sudo apt upgrade
sudo apt install -y build-essential
sudo apt install -y raspberrypi-kernel-headers build-essential bc dkms git


git clone https://github.com/morrownr/88x2bu-20210702.git
cd 88x2bu-20210702
sudo ./install-driver.sh

sudo vi /boot/config.txt

[all]
dtoverlay=disable-wifi
dtoverlay=disable-bt


```

 
### WiFi status 
 * https://github.com/uoaerg/wavemon

 * watch -n1 iwconfig
 * sudo iwlist wlan0 scan
 * sudo iw dev

