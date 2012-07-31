import processing.serial.*;

//Program by Jeremy Blum
//www.jeremyblum.com
//Send data from a POT over serial to the computer

//Define Pins
int potPin = 0;
int ledBrightness = 0;

Serial aSerialPort;

//Serial Library now requires Serial Object

void setup()
{
  size(200,200);
  background(125);
  //Create Serial Object (230400 Baud)
  
  // List all the available serial ports:
   println( Serial.list() );
//  
//  String[] portToUse = Serial.list();

  aSerialPort = new Serial(this, Serial.list()[0],115200);

    
}

void draw()
{
     
}

void mousePressed()
{
 
 ledBrightness = ledBrightness + 25;
 aSerialPort.write(ledBrightness);
 //println(ledBrightness);
 
}
