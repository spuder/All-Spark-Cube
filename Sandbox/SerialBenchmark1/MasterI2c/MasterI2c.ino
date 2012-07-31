/*
  MASTER 

  This code is for the master of the 2 arduinos
  to comunicate over i2c
  It is based on 
  http://digitalcave.ca/resources/avr/arduino-i2c.jsp
  http://absences.sofianaudry.com/en/node/10
  http://marcoramilli.blogspot.com/2011/10/communication-between-multiple-arduino.html

  One important note is that this uses bytes for communication dumped
  to the serial port. Avoid using bytes in the code until you actually
  send they data since they are slower than chars. Chars are also
  human readable. 
    
  http://www.velocityreviews.com/forums/t126683-difference-between-byte-and-char-array.html
  
*/

#include <Wire.h>
  const int SlaveAddress = 42;
  int dataRecieved;
  byte byteOfDataSent;

  void setup()
  {
    
    Serial.begin(115200);
    Serial.println("Master Setup Done !");
    
    // wire.begin with no parameter = master
    Wire.begin();
    
  }// end setup

  void loop()
  {
      if (Serial.available() == true )
      {
        dataRecieved = Serial.read();
        Serial.print("Recieved data " );
        Serial.println( String( dataRecieved ) );
        
        Wire.beginTransmission( SlaveAddress );
        Wire.write( byte(dataRecieved)  );
        Wire.endTransmission();
      } 
    
  }// end loop
