# flaskapp
Apache2 python flask application



#### Credits to:
```
Ted Mielczarek     https://github.com/luser/gamepadtest.git
Nazmus Nasir       https://github.com/naztronaut/RaspberryPi-RGBW-Control
Syed Muhammad Asad https://asdkazmi.medium.com/deploying-flask-app-with-wsgi-and-apache-server-on-ubuntu-20-04-396607e0e40f
```

#### Inspiration:
```
https://www.w3schools.com/graphics/game_controllers.asp
https://github.com/dramasamy/virtualJoystick
https://github.com/diamondx911/Elab_planner

```




## Powershell


#### bootstrap.ps1

#### Find the drive named "boot" probably the raspberry Pi bootdrive
#### Change to this drive letter and create an empty file named "ssh"

```powershell
$MyBootDrive = (Get-Volume -FileSystemLabel boot).DriveLetter

$MyBootDrive += ':'
echo $MyBootDrive
Set-Location -Path $MyBootDrive
echo $null >> ssh

cp C:\Temp\wpa_supplicant.conf .

ls
Set-Location -Path c:

# TODO: How to unmount this USB drive ?
```


The wpa_supplicant.conf file 
```linux
country=NO
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
	ssid="YOUR_SSID"
	psk="YOUR_WIFI_PASSWORD"
	proto=RSN
	key_mgmt=WPA-PSK
	pairwise=CCMP
	auth_alg=OPEN
}
```


