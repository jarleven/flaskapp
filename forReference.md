
/var/log/apache2/error.log

[Sat Nov 27 13:16:47.305721 2021] [mpm_event:notice] [pid 533:tid 3069977024] AH00489: Apache/2.4.51 (Raspbian) mod_wsgi/4.7.1 Python/3.9 configured -- resuming normal operation               s
[Sat Nov 27 13:16:47.305810 2021] [core:notice] [pid 533:tid 3069977024] AH00094: Command line: '/usr/sbin/apache2'
[Sat Nov 27 13:19:08.185207 2021] [wsgi:error] [pid 997:tid 3038831616] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Sat Nov 27 13:19:08.185328 2021] [wsgi:error] [pid 997:tid 3038831616] Can't connect to pigpio at localhost(8888)
[Sat Nov 27 13:19:08.185365 2021] [wsgi:error] [pid 997:tid 3038831616]
[Sat Nov 27 13:19:08.185403 2021] [wsgi:error] [pid 997:tid 3038831616]
[Sat Nov 27 13:19:08.185424 2021] [wsgi:error] [pid 997:tid 3038831616] Did you start the pigpio daemon? E.g. sudo pigpiod
[Sat Nov 27 13:19:08.185479 2021] [wsgi:error] [pid 997:tid 3038831616]
[Sat Nov 27 13:19:08.185496 2021] [wsgi:error] [pid 997:tid 3038831616] Did you specify the correct Pi host/port in the environment
[Sat Nov 27 13:19:08.185512 2021] [wsgi:error] [pid 997:tid 3038831616] variables PIGPIO_ADDR/PIGPIO_PORT?
[Sat Nov 27 13:19:08.185528 2021] [wsgi:error] [pid 997:tid 3038831616] E.g. export PIGPIO_ADDR=soft, export PIGPIO_PORT=8888
[Sat Nov 27 13:19:08.185544 2021] [wsgi:error] [pid 997:tid 3038831616]
[Sat Nov 27 13:19:08.185559 2021] [wsgi:error] [pid 997:tid 3038831616] Did you specify the correct Pi host/port in the
[Sat Nov 27 13:19:08.185576 2021] [wsgi:error] [pid 997:tid 3038831616] pigpio.pi() function? E.g. pigpio.pi('soft', 8888)
[Sat Nov 27 13:19:08.185607 2021] [wsgi:error] [pid 997:tid 3038831616]
[Sat Nov 27 13:19:08.185650 2021] [wsgi:error] [pid 997:tid 3038831616] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

