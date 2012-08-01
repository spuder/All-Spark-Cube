/*
This code is for the slave of the 2 arduinos
to comunicate over i2c
*/

#include <Wire.h>

  // the address is the unique identifer for the bus, can be integer or hex
  const int SlaveAddress = 42;
  byte byteOfDataRecieved;

  void setup()
  {
  
    Serial.begin(115200);
    Serial.println("Slave Setup Done !");
    
    // Start the wire protocol with slave address 42
    Wire.begin(SlaveAddress);
    
    // This is part of the Wire library that 
    // "registers a function to be called when 
    // a slave device receives a transmission from a master." 
    // In other words it calls a function when the master
    // alerts data is on the way
    Wire.onReceive(receiveEvent());
    
  }// end setup()

  void loop()
  {
  
  }// end loop()


  // Function called when the Wire library detects
  // data is on its way from the master
  void receiveEvent(int howMany)
  {
    Serial.println("about to get some text");
      while( Wire.available() == true )
      {
          
          byteOfDataRecieved = Wire.read();
          Serial.println("Got some text");
      }
    
  }// end receiveEvent
    

