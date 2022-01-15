

### What need to be done to make a ultra low latency IP camera stream ?

* https://www.raspberrypi.com/documentation/accessories/camera.html
* http://imrid.net/?p=4396
* https://www.tomshardware.com/how-to/use-raspberry-pi-camera-with-bullseye
* https://www.bensoftware.com/forum/discussion/3254/raspberry-pi-h264-rtsp-low-latency-camera-instructions
* https://stackoverflow.com/questions/62789865/ffmpeg-zero-latency-webcam-streaming
* http://www.wumpus-cave.net/2015/11/06/low-latency-fpv-streaming-with-the-raspberry-pi/


### 3D models and drawings

* https://www.thingiverse.com/thing:2931401
* https://www.arducam.com/wp-content/uploads/2020/02/pi-4-to-cam-connection-1024x368.png


### Working and tried stuff

 ```bash

libcamera-vid -t 0 --inline --listen -o tcp://0.0.0.0:<port>

ffplay tcp://<ip-addr-of-server>:<port> -vf "setpts=N/30" -fflags nobuffer -flags low_delay -framedrop

 ```
 
 ```bash

sudo raspi-config nonint do_camera 0

  
 libcamera-vid -t 0 --inline --listen --width 640 --height 480 --codec mjpeg -n -o tcp://0.0.0.0:8888
 
 ffplay tcp://192.168.1.166:8888 -vf "setpts=N/30" -fflags nobuffer -flags low_delay -framedrop
 
 VLC tcp/mjpeg://192.168.1.166:8888

```

```

Example: libcamera-hello --vflip --hflip


	--hflip				Read out with horizontal mirror
	--vflip				Read out with vertical flip
```



```
-vf "setpts=N/30"
-fflags nobuffer
-flags low_delay
-framedrop : Drop video frames if video is out of sync.
```


```
