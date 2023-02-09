


 * https://forums.raspberrypi.com/viewtopic.php?t=184155

```

Re: Disable onboard wifi and use dongle, any ideas?
Mon Jun 12, 2017 10:31 am

I've used both overlays and blacklist option, usb dongle works fine.

"sudo nano /boot/config.txt"

dtoverlay=pi3-disable-bt
dtoverlay=pi3-disable-wifi

"sudo systemctl disable hciuart"

"sudo nano /etc/modprobe.d/raspi-blacklist.conf"

#wifi
blacklist brcmfmac
blacklist brcmutil
#bt
blacklist btbcm
blacklist hci_uart

```


## WiFi status 
 * https://github.com/uoaerg/wavemon


 * watch -n1 iwconfig

