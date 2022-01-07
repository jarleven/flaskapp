

### What need to be done to make a ultra low latency IP camera stream ?

* https://www.raspberrypi.com/documentation/accessories/camera.html
* http://imrid.net/?p=4396
* https://www.tomshardware.com/how-to/use-raspberry-pi-camera-with-bullseye


 ```bash

libcamera-vid -t 0 --inline --listen -o tcp://0.0.0.0:<port>

ffplay tcp://<ip-addr-of-server>:<port> -vf "setpts=N/30" -fflags nobuffer -flags low_delay -framedrop

 ```
 
 ```bash
  
 libcamera-vid -t 0 --inline --listen --width 640 --height 480 --codec mjpeg -n -o tcp://0.0.0.0:8888
 
 ffplay tcp://192.168.1.166 -vf "setpts=N/30" -fflags nobuffer -flags low_delay -framedrop

  ```

