//Program by Jeremy Blum
//www.jeremyblum.com
//Uses commands from computer to control arduino

int ledPin = 13;
int ledBrightness = 50;
int byteRecieved;

byte arrayOfDataFromProcessing[4];
int locationInArrayCounter = 0;

void setup()
{
  //Create Serial Object
  //Serial.begin(230400);
  Serial.begin(115200);
  
  pinMode(ledPin, OUTPUT);
}

void loop()
{
  
  //Have the arduino wait to receive input
  while( Serial.available() > 0 ) 
  {
    
    
  
    Serial.println("Getting data");
    if( locationInArrayCounter < sizeof(arrayOfDataFromProcessing ))
    {
      
         arrayOfDataFromProcessing[locationInArrayCounter] = Serial.read() - '0';
         
    }//end if
   
    /*Huge pitfall you can not combine the int and the string together on one line.  (byteRecieved + " was recieved") will not work */


//	 if(index < arrayOfDataFromProcessing.length()) // One less than the size of the array
//	 {
//	     inChar = Serial.read(); // Read a character
//	     inData[index] = inChar; // Store it
//	     index++; // Increment where to write next
//	     inData[index] = '\0'; // Null terminate the string
//	 }

Serial.println(arrayOfDataFromProcessing[0]);
  }//end while
  Serial.flush();
  
  
  
}
