import processing.serial.*;

int led0;
int led0Brightness;
int led1;
int led1Brightness;

//This will be sent to the arduino.
int[] arrayOfDataToSendToArduino = new int[4];

PrintWriter outputFile;

//Create a serial port object
Serial aSerialPort;

void setup()
{
  size(200,200);
  background(125);
  
  // List all the available serial ports:
   println( Serial.list() );
  //outputFile = createWriter("Processinglog.txt");

  aSerialPort = new Serial(this, Serial.list()[0],115200);

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
  
sendData();

}


void sendData()
{
  //aSerialPort.write( arrayOfDataToSendToArduino );

  for ( int byteToSend = 0 ; byteToSend < arrayOfDataToSendToArduino.length; byteToSend++)
  {
    //println("byteToSend is " + byteToSend );
    
     //Send array to serial port, must subtract 208 to compensate for the difference
     //between processing data types and arduino data types, this off by 208 does not
     //occure when sending data between two arduinos, only processing to arduino
     //there is likey a simple fix, but short on time to research 
     aSerialPort.write( arrayOfDataToSendToArduino[ byteToSend ] - 208  );
     
     //println("Write to serial " + arrayOfDataToSendToArduino[byteToSend] );
     //outputFile.println(hour()+":"+minute()+":"+second()+" Wrote to serial " + arrayOfDataToSendToArduino[byteToSend] );
  }
 //outputFile.flush();
}
