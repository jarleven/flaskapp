# flaskapp
Apache2 python flask application




```
Credits to:
  https://asdkazmi.medium.com/deploying-flask-app-with-wsgi-and-apache-server-on-ubuntu-20-04-396607e0e40f
```




## Powershell


#### bootstrap.ps1

#### Find the driver named "boot" probably the raspberry Pi bootdrive
#### Change to this drive letter and create an epty file named "ssh"

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


