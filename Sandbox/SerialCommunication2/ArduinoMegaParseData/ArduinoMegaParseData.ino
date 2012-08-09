#include <Wire.h>

#define THIS_ADDRESS 0x9
#define OTHER_ADDRESS 0x8

int currentTime;
int timeSinceLastWrite;

int serialTimeOut = 1000;
unsigned long serialStartTime;

int arrayOfDataRecieved[4];
void setup()
{
  Wire.begin(THIS_ADDRESS);
  //Wire.onReceive(receiveEvent);
  
  Serial.begin(115200);
  Serial.write("Master2 Ready");
  
  serialStartTime = millis();
}

void loop()
{
  
  while (Serial.available() < 4 && ( (millis() - serialStartTime) < serialTimeOut) ) 
  {// Wait untill there are 9 Bytes waiting
  } 
  
  if(Serial.available() < 4)
  {
    //Serial.println("All the data didn't make it in time, or got corrupt");
      Wire.beginTransmission(OTHER_ADDRESS);
      Wire.write( 0 ); // tell the other arduino the data didn't make it
      Wire.endTransmission();
    Serial.flush();
    serialStartTime = millis();
  }
  else
  {
      for(int n=0; n<4; n++)
      {
       arrayOfDataRecieved[n] = Serial.read(); // Then: Get them. 
       
        Wire.beginTransmission(OTHER_ADDRESS);
        Wire.write( arrayOfDataRecieved[n] - '0' );
        Wire.endTransmission();
      }
      serialStartTime = millis();
      Serial.flush();
  }
   
   
//   currentTime = millis();
//   
//   if ( currentTime - timeSinceLastWrite > 1000 )
//   {
//     timeSinceLastWrite = currentTime;
//     //Serial.println("its been a second");
//     // Wire.beginTransmission(OTHER_ADDRESS);
//     // Wire.write("h");
//     // Wire.endTransmission();
//   }
  
  
}


