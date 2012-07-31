//Program by Jeremy Blum
//www.jeremyblum.com
//Uses commands from computer to control arduino

int ledPin = 13;
int ledBrightness = 50;
int byteRecieved;


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
    //Serial.read();

  
  //Read the Input
   byteRecieved = Serial.read() - '0';

/*
Huge pitfall you can not combine the int and the string together
on one line. 
(byteRecieved + " was recieved") will not work 
*/
   Serial.print(byteRecieved  );
   Serial.println(" ok");
   analogWrite(ledPin, ledBrightness + byteRecieved);

  
//  if (byteRecieved == 1) 
//  {
//    Serial.println("Led is On"); 
//    analogWrite(ledPin, 200);
//  }
//  else if (byteRecieved == 0)
//  {
//    Serial.println("Led is Off");
//    analogWrite(ledPin, 50);
//  }
//  else
//  {
//    Serial.println("Invalid!");
//  }
//  
  }//end while
  //Serial.flush();
  
  
}
