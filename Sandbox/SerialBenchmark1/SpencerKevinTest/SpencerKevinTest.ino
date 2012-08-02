#include <Wire.h>

/*

  ARDUINO MEGA

  Setup Serial

*/

int dataInputIntoConsole;


void setup()
{
  Serial.begin(115200);
  Serial.println("Setup Spencer Side Arduino");
  
  Wire.begin(42);
  Wire.onReceive(receivedEvent);
  
  
}

void loop()
{
      if (Serial.available() == true) 
      {
          dataInputIntoConsole = Serial.read();
          Wire.beginTransmission(8);
          Wire.write(dataInputIntoConsole);
          Wire.endTransmission();
      }
  
}


void receivedEvent(int howMany)
{
    while (Wire.available() > 0)
    {
      int recievedFromi2c = Wire.read();
      Serial.print( recievedFromi2c, DEC );
    }
    Serial.println(); 
    
}
