import processing.serial.*;

//Program by Jeremy Blum
//www.jeremyblum.com
//Send data from a POT over serial to the computer

//Define Pins
int potPin = 0;
//int ledBrightness = 0;

int led0;
int led0Brightness;
int led1;
int led1Brightness;

//[led0,led0brightness,led1,led1Brightness]
//This will be sent to the arduino.
int[] arrayOfDataToSendToArduino = new int[4];

PrintWriter outputFile;


Serial aSerialPort;

//Serial Library now requires Serial Object

void setup()
{
  size(200,200);
  background(125);
  
  // List all the available serial ports:
   println( Serial.list() );
  outputFile = createWriter("Processinglog.txt");

  //println(arrayOfDataToSendToArduino.length);

  aSerialPort = new Serial(this, Serial.list()[0],115200);
  
  //println("");
 // println("Sending data to " + Serial.list()[2] );
}

void draw()
{
     
}

void mousePressed()
{

  
  led0 = 0;
  led0Brightness = 0;
  led1 = 1;
  led1Brightness = 0 ;
  
  led0Brightness = led0Brightness + 25;
  
  arrayOfDataToSendToArduino[0] = led0;
  arrayOfDataToSendToArduino[1] = led0Brightness;
  arrayOfDataToSendToArduino[2] = led1;
  arrayOfDataToSendToArduino[3] = led1Brightness;
  
//println("test");
//int temporaryInt = arrayOfDataToSendToArduino[0];
//aSerialPort.write( temporaryInt );
sendData();
  


 
}


void sendData()
{
  //aSerialPort.write( arrayOfDataToSendToArduino );

  for ( int byteToSend = 0 ; byteToSend < arrayOfDataToSendToArduino.length; byteToSend++)
  {
    //println("byteToSend is " + byteToSend );
    
     //aSerialPort.write( arrayOfDataToSendToArduino[byteToSend] );
     aSerialPort.write( arrayOfDataToSendToArduino[ byteToSend ] - 208  );
     
     println("Write to serial " + arrayOfDataToSendToArduino[byteToSend] );
     outputFile.println(hour()+":"+minute()+":"+second()+" Wrote to serial " + arrayOfDataToSendToArduino[byteToSend] );
     
 
  }

  
 outputFile.flush();
}
