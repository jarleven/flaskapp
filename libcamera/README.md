### Streaming server

#### 27.01.2023 Bullseye 32bit Desktop @ Raspberry Pi 3
#### 28.01.2023 Bullseye 64bit lite @ Raspberry Pi 3

### NVIDIA Jetson Nano

Just a few things tried 24.02.2023
```bash

Virtually no latency :

####
./test-launch "nvarguscamerasrc ! video/x-raw(memory:NVMM),width=640,height=480,framerate=25/1 ! nvvidconv ! video/x-raw(memory:NVMM),format=I420 ! nvjpegenc ! rtpjpegpay name=pay0 pt=26 "

IP_ADDRESS=192.168.3.191
PORT=8554
MAPPING=test

ffplay -rtsp_transport udp rtsp://${IP_ADDRESS}:${PORT}/${MAPPING} -vf "setpts=N/25" -fflags nobuffer -flags low_delay -framedrop

####

Tested on Win10 "player" 
 * https://www.gyan.dev/ffmpeg/builds/
 * https://www.gyan.dev/ffmpeg/builds/packages/ffmpeg-5.0.1-full_build.7z

echo uri=rtsp://${IP_ADDRESS}:${PORT}/${MAPPING}
gst-launch-1.0 playbin uri=rtsp://${IP_ADDRESS}:${PORT}/${MAPPING}




 ./test-launch "nvarguscamerasrc ! video/x-raw(memory:NVMM),width=640,height=480,framerate=25/1 ! nvvidconv ! video/x-raw(memory:NVMM),format=I420 ! nvjpegenc ! rtpjpegpay name=pay0 pt=26 "

 ./test-launch "( nvarguscamerasrc ! nvjpegenc ! rtpjpegpay name=pay0 pt=26 )"     

VLC : rtsp://192.168.1.191:8554/test
vlc rtsp://192.168.1.166:8888 --network-caching=0


https://developer.nvidia.com/embedded/learn/tutorials/first-picture-csi-usb-camera

https://forums.developer.nvidia.com/t/jetson-nano-faq/82953

wget https://raw.githubusercontent.com/GStreamer/gst-rtsp-server/1.14.5/examples/test-launch.c

sudo apt-get install libgstrtspserver-1.0 libgstreamer1.0-dev
gcc test-launch.c -o test-launch $(pkg-config --cflags --libs gstreamer-1.0 gstreamer-rtsp-server-1.0)


./test-launch "videotestsrc is-live=1 ! nvvidconv ! nvv4l2h264enc ! h264parse ! rtph264pay name=pay0 pt=96"

At client side, if the device is a PC with Windows OS, you can open network stream 
rtsp://<SERVER_IP_ADDRESS>:8554/test via VLC. If it is a Jetson device, you can run the command:

gst-launch-1.0 uridecodebin uri=rtsp://<SERVER_IP_ADDRESS>:8554/test ! nvoverlaysink









```

```bash

sudo apt update && sudo apt upgrade -y
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

