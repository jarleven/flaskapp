/***************************************************************
   Motor driver function definitions - by James Nugen
 *************************************************************/

#ifdef L298_MOTOR_DRIVER

  // ArduinoUno Pins 5 and 6: 1kHz PWM

	// Motor 1

  #define LEFT_MOTOR_PWM  5	// Orange
  #define LEFT_MOTOR_A    7	// Gray
  #define LEFT_MOTOR_B    8	// White
  

	// Motor 2

  #define RIGHT_MOTOR_PWM 6	// Purple
  #define RIGHT_MOTOR_A   9	// Blue
  #define RIGHT_MOTOR_B   10	// Green
#endif

/**
#define LEFT_ENC_PIN_A PD2  //pin 2
#define LEFT_ENC_PIN_B PD3  //pin 3
  
#define RIGHT_ENC_PIN_A PC4  //pin A4
#define RIGHT_ENC_PIN_B PC5   //pin A5
*/

void initMotorController();
void setMotorSpeed(int i, int spd);
void setMotorSpeeds(int leftSpeed, int rightSpeed);
