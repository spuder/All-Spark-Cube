import processing.serial.*;
import cc.arduino.*;

Arduino anArduino;

boolean led1Over = false;
boolean led2Over = false;
boolean led3Over = false;

boolean led1On = false;
boolean led2On = false;
boolean led3On = false;

int[] values = { 
  Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, 
  Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, 
  Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW
};

String[] testArrayOfMorseCode;
int spencerIndex = 0;


void setup()
{
  size(500, 252); //Creates a window X by Y dimentions
  
  //println(Arduino.list());// Displays all the com ports
  
  /*
  // Create an Arduino Object
  anArduino = new Arduino(this, Arduino.list()[0], 57600);
  for (int i = 0; i <= 13; i++)
    anArduino.pinMode(i, Arduino.OUTPUT);
*/ 
  // Take input from file
  String loadPath = selectInput();
  if (loadPath == null)
  {
      println("no file selected");
  }
  else 
      testArrayOfMorseCode = loadStrings(loadPath);
      println("testArrayOfMorseCode is " + testArrayOfMorseCode);
      println("loadPath is " + loadPath); // print out the file loaded c:\somefile
      println("there are " + testArrayOfMorseCode.length + " lines"); //print out number of lines
      
      for(int i = 0; i < testArrayOfMorseCode.length; i++)
        {
            String[] individualItem = split(testArrayOfMorseCode[i], TAB);
            

            println("item " + i + " is " + testArrayOfMorseCode[i]); 
        }

      
        if (spencerIndex < testArrayOfMorseCode.length) 
          {
              //testArrayOfMorseCode[spencerIndex];
              print(spencerIndex + "\t");
              println(testArrayOfMorseCode[spencerIndex]);
              //int x = int(pieces[index]);
              println(testArrayOfMorseCode[spencerIndex]);
              //   writeArduino(int(testArrayOfMorseCode[spencerIndex]));

     
              // Go to the next line for the next run through draw()
              spencerIndex = spencerIndex + 1;
          }
    
}//end setup

void draw() {

}


/*
void writeArduino(int x) 
{
  println("Writing to arduino " + x);

     delay(2);
}
*/


/*
void updateMouse() 
{
  boolean mouseHeight = false;
  if (mouseY >= (height/2) -40 && mouseY <= (height/2) + 40) 
  {
    mouseHeight = true;
  }


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

    anArduino.digitalWrite(13, 0);
    led1On = false;
  }
  else if (led1Over == true && led1On == false)
  {
    anArduino.digitalWrite(13, 255);
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
*/
