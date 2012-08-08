/*
Master 1

This code is provided by digitalcave.ca and shows a better
implementation of multi master
Use the same code on both arduinos, but change the 'this_address' and the
'other_address' on 1 of the arduinos

*/

#include <Wire.h>

#define LED 9
#define BUTTON 10

#define THIS_ADDRESS 0x8
#define OTHER_ADDRESS 0x9

//boolean last_state = HIGH;

int dataInputIntoConsole;

void setup() {
  pinMode(LED, OUTPUT);
  digitalWrite(LED, LOW);
  
  pinMode(BUTTON, INPUT);
  digitalWrite(BUTTON, HIGH);
  
  Serial.begin(115200);
  Serial.write("Demilnove Ready");
  
  Wire.begin(THIS_ADDRESS);
  Wire.onReceive(receiveEvent);
}

void loop() 
{
    if(Serial.available() == true) 
    {
        dataInputIntoConsole = Serial.read();
        //Serial.print("User inputed data ");
        //Serial.println(dataInputIntoConsole);
        Serial.write(dataInputIntoConsole);
        Wire.beginTransmission(OTHER_ADDRESS);
        Wire.write( byte(dataInputIntoConsole) );
        Wire.endTransmission();
    }

}

void receiveEvent(int howMany)
{  
    // seems not to flushwhile (Wire.available() > 0)
    if ( Wire.available() == true )
    {
      int b = Wire.read();
      //Serial.write(b, DEC);
      //Serail.write(b);
      Serial.print(b);
      //digitalWrite(LED, !b);
    }
  Serial.println(); 
}
