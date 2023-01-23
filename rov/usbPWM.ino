

//https://forum.arduino.cc/t/read-line-from-serial/98251/5
//https://stackoverflow.com/questions/11068450/arduino-c-language-parsing-string-with-delimiter-input-through-serial-interfa

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
     digitalWrite(3, HIGH);
     digitalWrite(4, LOW);
  }
  else{
     digitalWrite(3, LOW);
     digitalWrite(4, HIGH);
  }

  analogWrite(5,abs(motorA));

  if (motorB > 0){
     digitalWrite(7, HIGH);
     digitalWrite(8, LOW);
  }
  else{
     digitalWrite(7, LOW);
     digitalWrite(8, HIGH);
  }

  analogWrite(6,abs(motorB));

}


void printError(void) {
  Serial.print("Oooops  : [");
  Serial.print(buffer);
  Serial.println("]");
  errorMsg=false;
}

void setup() {
  // put your setup code here, to run once:
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(115200);

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

        if(endOfLine="s")
          runMotor(motorA, motorB);
        else
          errorMsg=true;
      }
      else
        errorMsg=true;
    
      // Cleanup and get ready for new input string
      ready=false;  
    }

  if(errorMsg)
    printError();
    
}
