
```

https://www.youtube.com/watch?v=JFTJ2SS4xyA


https://www.youtube.com/watch?v=kdBY0NPZ71k
https://vanhunteradams.com/





ATMega ? 
https://github.com/RajPShinde/PID_Speed_Controller_for_DC_Motor/blob/master/PID_Speed_Controller/PID_Speed_Controller.ino


Brukar kun ein ISR pinne per motor. retning er ikkje så intressant det styrer jo motoren sjølv
https://community.element14.com/products/arduino/b/blog/posts/simple-arduino-dc-motor-control-with-encoder-part-2



# ROS Arduino differential drive
https://github.com/joshnewans/ros_arduino_bridge

```

```

  Arduino Pins 5 and 6: 1kHz


  #define LEFT_MOTOR_A    7
  #define LEFT_MOTOR_B    8
  #define LEFT_MOTOR_PWM  5
  #define RIGHT_MOTOR_A   9
  #define RIGHT_MOTOR_B   10
  #define RIGHT_MOTOR_PWM 6


  pinMode(LEFT_MOTOR_A,    OUTPUT);
  pinMode(LEFT_MOTOR_B,    OUTPUT);
  pinMode(LEFT_MOTOR_PWM,  OUTPUT);
  pinMode(RIGHT_MOTOR_A,   OUTPUT);
  pinMode(RIGHT_MOTOR_B,   OUTPUT);
  pinMode(RIGHT_MOTOR_PWM, OUTPUT);


  #define LEFT_ENC_PIN_A  PD2  //pin 2
  #define LEFT_ENC_PIN_B  PD3  //pin 3
  #define RIGHT_ENC_PIN_A PC4  //pin A4
  #define RIGHT_ENC_PIN_B PC5  //pin A5

```

### ROS Arduino differential drive
* https://github.com/joshnewans/ros_arduino_bridge

```
         _____________________________
        |                             |
        |                    Motor 1  |   Left
        |                             |
   L    |                R            |
        |    +   +                    |
  [D5]  |    P1  P2     [D6]          |
  [D7]  |    A1  A2     [D9]          |
  [D8]  |    B1  B2     [D10]         |
        |    -   -                    |
        |                             |
        |                    Motor2   |   Right
        |_____________________________|


        Left
       --------
	ENC1_A     [D2]
	ENC1_B     [D3]

        Right
       -------
	ENC2_A     [A4]
	ENC2_B     [A5]


 
                                      +-----+
         +----[PWR]-------------------| USB |--+
         |                            +-----+  |
         |           GND/RST2  [ ] [ ]         |
         |         MOSI2/SCK2  [ ] [ ]  SCL[ ] |   C5
         |            5V/MISO2 [ ] [ ]  SDA[ ] |   C4
         |                             AREF[ ] |
         |                              GND[ ] |
         | [ ]N/C                    SCK/13[A] |   B5
         | [ ]v.ref                 MISO/12[A] |   .
         | [ ]RST                   MOSI/11[A]~|   .
         | [ ]3V3    +---+               10[ ]~|   .
         | [ ]5v     | A |                9[ ]~|   .
         | [ ]GND   -| R |-               8[B] |   B0
         | [ ]GND   -| D |-                    |
         | [ ]Vin   -| U |-               7[A] |   D7
         |          -| I |-               6[A]~|   .
         | [ ]A0    -| N |-               5[C]~|   .
         | [ ]A1    -| O |-               4[A] |   .
         | [ ]A2     +---+           INT1/3[A]~|   .
         | [ ]A3                     INT0/2[ ] |   .
         | [ ]A4      RST SCK MISO     TX>1[ ] |   .
         | [ ]A5      [ ] [ ] [ ]      RX<0[ ] |   D0
         |            [ ] [ ] [ ]              |
         |  UNO_R3    GND MOSI 5V  ____________/
          \_______________________/
   
   http://busyducks.com/ascii-art-arduinos

```
 