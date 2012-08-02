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
  Serial.write("Master1 Ready");
  
  Wire.begin(THIS_ADDRESS);
  Wire.onReceive(receiveEvent);
}

void loop() {
    if(Serial.available() == true) 
    {
        dataInputIntoConsole = Serial.read();
        Serial.print("User inputed data ");
        Serial.println(dataInputIntoConsole);
        Wire.beginTransmission(OTHER_ADDRESS);
        Wire.write( byte(dataInputIntoConsole) );
        Wire.endTransmission();
    }
  
//  if (digitalRead(BUTTON) != last_state){
//    last_state = digitalRead(BUTTON);
//    Wire.beginTransmission(OTHER_ADDRESS);
//    Wire.write(last_state);
//    Wire.endTransmission();
//  }
}

void receiveEvent(int howMany){
  Serial.println("An event occured");
  while (Wire.available() > 0){
    int b = Wire.read();
    //Serial.write(b, DEC);
    Serial.write(b);
    //digitalWrite(LED, !b);
  }
  Serial.println(); 
}
