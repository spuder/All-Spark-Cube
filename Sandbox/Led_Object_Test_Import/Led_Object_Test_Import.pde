import processing.opengl.*;
/*
Remember Think-Design-Test-Create
 Never write a single line of code until you have 
 designed it in the UML and written your unit tests
 
 This is the thinking stage, creating a sandbox
 
 //Create LED objects
 
 https://groups.google.com/forum/?fromgroups#!topic/comp.lang.java.help/BzQoE_Vve4k
 http://stackoverflow.com/questions/2395814/difference-between-hashmap-and-array-list-in-java
 
 Led aLed1 = new Led();
 Led aLed2 = new Led();
 Led aLed3 = new Led();
 Led aLed = new Led();
 Led anewLed = new Led();
 int ledCount;
 */

Led anLedObject;
Led aTemporaryDrawLed;

HashMap<String, Led> hashMapOfLeds = new HashMap<String, Led>(); 
String[] listOfHashMapKeys = {"led000", "led001", "led010"};
// Create a hashmap where String is the type of key, and Led is what will be stored


color red   =   color(255, 0, 0);
color green =   color(0, 255, 0);
color blue  =   color(0, 0, 255);
color white =   color(255, 255, 255); // White means all 3 colors are on equally
color black =   color(0, 0, 0);       // Black is snyonomous with off
color purple =  color(10, 10, 0);
color customColor;


String loadedFile[]; // Going to be our array of all characters in a line of a text file


void setup()
{
  size (300, 300, OPENGL); // Create canvas , must be first in setup function
  colorMode(RGB, 255, 255, 255); //Explicitly specify color type and scale, could also add alpha/transparency if desired
  

  //Open dialog prompt
  new Thread(
  new Runnable() 
  {
    public void run()
    {
      openFile(selectInput());
    }
  }
  ).start();



  //   aLed1 = new Led(width/2, height/2, 50, 50); // Create led object, color is left blank
  //  aLed2 = new Led(width/4, height/2, 50, 50, red);// Create led object, color is included
}//end setup()=========================================>


// This normally is included in the startup, but with opengl you need to create a new thread
void openFile(String locationOfFile)
{
  if (locationOfFile == null)
  {
    println("no file selected");
  }
  else
  {                                            
    println("Opening file "+ locationOfFile);
    loadedFile = loadStrings(locationOfFile);  
    println("Calling parseFile method"); 
    parseFile(loadedFile);
  }
}// end openFile()





void parseFile(String[] loadedFile)
{
  Led led = new Led();
  println("parseFile method called");
  println("loadedFile.length " + loadedFile.length);
  for (int i = 0; i < loadedFile.length; i++)
  {
    String[] pieces = split(loadedFile[i], TAB);      
    println("created string[] pieces ");
    if ( pieces.length == 4) // if you get to the end of a line while parsing...
    {
      println("pieces[i] is: " + pieces[i]);
      anLedObject = new Led();

      //int ledLocationX, int ledLocationY, int ledWidth, int ledHeight, color ledColor
      anLedObject.setLedLocationX(20);
      anLedObject.setLedLocationY(int(random(0, 300)));
      anLedObject.setLedWidth(int(random(10, 100)));
      anLedObject.setLedHeight(int(random(10, 100)));
      color aTemporaryColor = color(int(pieces[0]), int(pieces[1]), int(pieces[2]));

      String keyString = pieces[0];               
      println("Created hashmap key pieces[i]- :" + keyString);
      hashMapOfLeds.put(keyString, anLedObject);  



      // Now you have to store the elements with a string key:
      //books.put("Harry Potter III", new Book("JK Rownling", 456, "Harry Potter"));

      // Now you can access the elements by using a String index
      //Book book = books.get("Harry Potter III");
      
    }//end if
  }//end for loop
}//end parseFile



void draw()
{
  
  //TODO make this refresh and erase old objects
 // Color of background 95 = dark grey
if (aTemporaryDrawLed != null)
{
  aTemporaryDrawLed.display(); //Objects from hashmap are resurected as new temporary object and drawn
}
      
}//end draw()=========================================>




void mousePressed()
{
  drawBackground(); 
    //aTemporaryDrawLed.display(); 
    
    for (int i = 0; i < listOfHashMapKeys.length; i++)
        {
              //String[] listOfHashMapKeys = {"led000","led001","led010"}; // Located earlier in code
        
              aTemporaryDrawLed = hashMapOfLeds.get(listOfHashMapKeys[i]);
              println(listOfHashMapKeys[i] + " "+ aTemporaryDrawLed.getLedLocaitonY() +" ");  
              aTemporaryDrawLed.setLedLocationX(int(random(0, 300)));
              aTemporaryDrawLed.setLedLocationY(int(random(0, 300)));
              aTemporaryDrawLed.display(); 
                 
        }
        
}//end mousePressed()=========================================>


void drawBackground()
{
  background(95);
}
