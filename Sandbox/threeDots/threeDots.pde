import processing.serial.*;
import cc.arduino.*;
Arduino anArduino;

boolean led1Over = false;
boolean led2Over = false;
boolean led3Over = false;

boolean led1On = false;
boolean led2On = false;
boolean led3On = false;

int[] values = { Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW };


void setup()
{
  size(500, 252, P3D);
  noStroke();
  println(Arduino.list());
  anArduino = new Arduino(this, Arduino.list()[0], 57600);
    for (int i = 0; i <= 13; i++)
    anArduino.pinMode(i, Arduino.OUTPUT);
  
  
}

void draw()
{
  
  ellipse(width/4,height/2, 80,80);
  ellipse(width/2,height/2, 80, 80);
  ellipse(width/4+width/2,height/2,80,80);
  updateMouse();
  
}

void updateMouse() 
{
  boolean mouseHeight = false;
  if (mouseY >= (height/2) -40 && mouseY <= (height/2) + 40) 
  {mouseHeight = true;}
  
  
  if (mouseHeight == true &&
  (mouseX >= (width/4) - 40 && mouseX <= (width/4) + 40))
  {
    led1Over = true;
    println("Led 1");
  }
  else led1Over = false;
  
  
if (mouseHeight == true &&
  (mouseX >= (width/2) - 40 && mouseX <= (width/2) + 40))
  {
    led2Over = true;
    println("Led 2");
  }
  else led2Over = false;
  
  
  
  if (mouseHeight == true 
  && mouseX >= ((width/2)+(width/4)) - 40 
  && mouseX <= ((width/2)+(width/4)) + 40
  )
  {
    led3Over = true;
    println("Led 3");
  }
  else led3Over = false;
  
  

}


void mousePressed()
{
  
  if (led1Over == true && led1On == true)
  {
    
     anArduino.digitalWrite(13,0);
     led1On = false;
     
  }
  else if (led1Over == true && led1On == false)
  {
    anArduino.digitalWrite(13,255);
    led1On = true;
  }
  
  
   if (led2Over == true && led2On == true)
  {
     anArduino.analogWrite(13, 0);
     led2On = false;
     
  }
  else if (led2Over == true && led2On == false)
  {
    anArduino.analogWrite(13, 128);
    led2On = true;
  }
  
  
  
  
  
    if (led3Over == true && led3On == true)
  {
     anArduino.analogWrite(13, 0);
     led3On = false;
     
  }
  else if (led3Over == true && led3On == false)
  {
    anArduino.analogWrite(13, 128);
    led3On = true;
  }
  
  
  
  
}
