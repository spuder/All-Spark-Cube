import processing.serial.*;

//Program by Jeremy Blum
//www.jeremyblum.com
//Send data from a POT over serial to the computer

//Define Pins
int potPin = 0;
//int ledBrightness = 0;

char led0 = 1;
int led0Brightness = 0;
int led1;
int led1Brightness = 0;

//[led0,led0brightness,led1,led1Brightness]
//This will be sent to the arduino.
byte[] arrayOfDataToSendToArduino = new byte[4];

PrintWriter outputFile;


Serial aSerialPort;

//Serial Library now requires Serial Object

void setup()
{
  size(200,200);
  background(125);
  //Create Serial Object (230400 Baud)
  
  // List all the available serial ports:
   println( Serial.list() );
  outputFile = createWriter("Processinglog.txt");

  println(arrayOfDataToSendToArduino.length);

  aSerialPort = new Serial(this, Serial.list()[0],115200);
  
  


}

void draw()
{
     
}

void mousePressed()
{

  led0Brightness = led0Brightness + 25;
  
  arrayOfDataToSendToArduino[0] = byte(led0);
  arrayOfDataToSendToArduino[1] = byte(led0Brightness);
  arrayOfDataToSendToArduino[2] = byte(led1);
  arrayOfDataToSendToArduino[3] = byte(led1Brightness);
  
 
  
  
// ledBrightness = ledBrightness + 25;
  int temporaryInt = arrayOfDataToSendToArduino[0];
 aSerialPort.write(temporaryInt);
 outputFile.println(hour()+":"+minute()+":"+second()+" Wrote to serial " + arrayOfDataToSendToArduino[0] + " which is " + byte(arrayOfDataToSendToArduino[0]));
 outputFile.flush();
 //outputFile.close();
 //println(ledBrightness);
 
}
