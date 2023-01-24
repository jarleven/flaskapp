
#define MA_PWM 5
#define MA_A 3
#define MA_B 4

#define MB_PWM 6
#define MB_A 7
#define MB_B 8

char buffer [32];
int cnt = 0;

bool ready=false;
bool errorMsg=false;


/***

If you use the default values set by the ArduinoDiecimila'sbootloader, these are your PWM frequencies:
Arduino Pins 5 and 6: 1kHz
Arduino Pins 9, 10, 11, and 3: 500Hz
*/
void runMotor(int motorA, int motorB)
{
  Serial.println(motorA);
  Serial.println(motorB);
  
  
 
  if (motorA > 0){
    Serial.println("Forward A");
     digitalWrite(MA_A, HIGH);
     digitalWrite(MA_B, LOW);
  }
  else{
    Serial.println("Reverse A");
    digitalWrite(MA_A, LOW);
    digitalWrite(MA_B, HIGH);
  }
  
  if(motorA==0) {
    Serial.println("STOP A");
    digitalWrite(MA_A, LOW);
    digitalWrite(MA_B, LOW);
  }
    analogWrite(MA_PWM,max(abs(motorA), 1023));

  if (motorB > 0){
    Serial.println("Forward B");
     digitalWrite(MB_A, HIGH);
     digitalWrite(MB_B, LOW);
  }
  else{
    Serial.println("Reverse B");
     digitalWrite(MB_A, LOW);
     digitalWrite(MB_B, HIGH);
  }

  analogWrite(MB_PWM,max(abs(motorB),1023));
  if(motorB==0) {
    Serial.println("STOP B");
    digitalWrite(MB_A, LOW);
    digitalWrite(MB_B, LOW);
  }

}


void printError(void) {
  Serial.print("Oooops  : ");
  Serial.print(buffer);
  runMotor(0, 0);

  errorMsg=false;
}

void setup() {
  // put your setup code here, to run once:
  pinMode(LED_BUILTIN, OUTPUT);
     
  pinMode(MA_A, OUTPUT);
  pinMode(MA_B, OUTPUT);
  pinMode(MA_PWM, OUTPUT); // PWM
  pinMode(MB_PWM, OUTPUT); // PWM
  pinMode(MB_A, OUTPUT);
  pinMode(MB_B, OUTPUT);


  Serial.begin(115200);
  Serial.println("EidVgs serial motor controller v0.1");
  digitalWrite(LED_BUILTIN, HIGH);

}

void loop() {
 
	  if (Serial.available() > 0) {
      char c = Serial.read();  //gets one byte from serial buffer
      buffer[cnt++] = c;

      if ((c == '\n') || (cnt == sizeof(buffer)-1))
      {
        buffer[cnt] = '\0';
        cnt = 0;
        ready = true;
      }
    }     
		
	  if(ready) {
      // Contains 3 substrings separated by comma  motorA, motorB, endOfLineCheck

      int motorA, motorB;
      char endOfLine;

      if(sscanf(buffer, "%d,%d,%c", &motorA, &motorB, &endOfLine) == 3){

        if(endOfLine=='s')
          runMotor(motorA, motorB);
        else
          errorMsg=true;
      }
      else
        errorMsg=true;



    
      // Cleanup and get ready for new input string
      ready=false;  
    }

  if(errorMsg) {
    printError();
    //Sticky error message
    digitalWrite(LED_BUILTIN, LOW);
  }
        
}


//https://forum.arduino.cc/t/read-line-from-serial/98251/5
//https://stackoverflow.com/questions/11068450/arduino-c-language-parsing-string-with-delimiter-input-through-serial-interfa
//https://www.electronicwings.com/users/sanketmallawat91/projects/215/frequency-changing-of-pwm-pins-of-arduino-uno#:~:text=The%20frequency%20of%20the%20PWM%20signal%20on%20most%20pins%20is,also%20run%20at%20980%20Hz.
