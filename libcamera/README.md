### Streaming server

#### 27.01.2023 Bullseye 32bit Desktop @ Raspberry Pi 3
#### 28.01.2023 Bullseye 64bit lite @ Raspberry Pi 3


```bash

sudo apt update && apt upgrade -y
sudo reboot
libcamera-hello

# Streaming server (A few examples)  
libcamera-vid -t 0 --inline --listen --width 640 --height 480 --codec mjpeg -n -o tcp://0.0.0.0:8888
libcamera-vid -t 0 --inline --listen --width 640 --height 480 --awb tungsten --rotation 180 --codec mjpeg -n -o tcp://0.0.0.0:8888

# Playback on ffplay
ffplay tcp://192.168.1.166:8888 -vf "setpts=N/30" -fflags nobuffer -flags low_delay -framedrop
 
# Playback on VLC
vlc tcp/mjpeg://192.168.1.166:8888 --network-caching=0

# On Windows cd into the directory first (.exe might not be needed)
cd C:\Program Files\VideoLAN\VLC
vlc.exe tcp/mjpeg://192.168.3.147:8888 --network-caching=0


# This worked on the Desktop
libcamera-hello --qt-preview


```



### Working and tried stuff

```

libcamera-vid -t 0 --inline --listen -o tcp://0.0.0.0:<port>

ffplay tcp://<ip-addr-of-server>:<port> -vf "setpts=N/30" -fflags nobuffer -flags low_delay -framedrop


	--hflip				Read out with horizontal mirror
	--vflip				Read out with vertical flip

	-vf "setpts=N/30"
	-fflags nobuffer
	-flags low_delay
	-framedrop				Drop video frames if video is out of sync.


```

```
crontab -l
crontab -e

sudo apt install screen -y
```

```bash 

@reboot (. ~/.profile; /usr/bin/screen -dmS StreamingServer ~/startStream.sh)

```
vi startStream.sh   # Remember to chmod + x startStream.sh

```bash

#!/bin/bash

sleep 10

while :
do
	echo "Press [CTRL+C] to stop.."
	libcamera-vid -t 0 --inline --listen --width 640 --height 480 --rotation 180 --codec mjpeg -n -o tcp://0.0.0.0:8888
	sleep 5
done

```





### What need to be done to make a ultra low latency IP camera stream ?

* https://www.raspberrypi.com/documentation/accessories/camera.html
* http://imrid.net/?p=4396
* https://www.tomshardware.com/how-to/use-raspberry-pi-camera-with-bullseye
* https://www.bensoftware.com/forum/discussion/3254/raspberry-pi-h264-rtsp-low-latency-camera-instructions
* https://stackoverflow.com/questions/62789865/ffmpeg-zero-latency-webcam-streaming
* http://www.wumpus-cave.net/2015/11/06/low-latency-fpv-streaming-with-the-raspberry-pi/

### Gstreamer
* https://qengineering.eu/install-gstreamer-1.18-on-raspberry-pi-4.html
```


gst-launch-1.0 libcamerasrc ! video/x-raw, width=640, height=480, framerate=30/1 ! videoconvert ! videoscale ! jpegenc ! rtpjpegpay ! udpsink host=192.168.3.153 port=5200




vlc test_mjpg.sdp 

m=video 5200 RTP/AVP 26
c=IN IP4 192.168.3.147
a=rtpmap:26 JPEG/90000



```



### 3D models and drawings

* https://www.thingiverse.com/thing:2931401
* https://www.arducam.com/wp-content/uploads/2020/02/pi-4-to-cam-connection-1024x368.png

