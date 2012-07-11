import processing.opengl.*;
/*
Remember Think-Design-Test-Create
 Never write a single line of code until you have 
 designed it in the UML and written your unit tests
 
 This is the thinking stage, creating a sandbox
 
 
 
 Create LED objects
 */
Led aLed1;
Led aLed2;
Led aLed3;
Led aLed;
Led anewLed;

color red   =   color(255, 0, 0);
color green =   color(0, 255, 0);
color blue  =   color(0, 0, 255);
color white =   color(255, 255, 255); // White means all 3 colors are on equally
color black =   color(0, 0, 0);       // Black is snyonomous with off
color purple =  color(10, 10, 0);


GuiButton whiteBox1;
GuiButton blackBox1;
GuiButton redBox1;
GuiButton blueBox1;
GuiButton greenBox1;

String loadedFile[]; // Going to be our array of all characters in a line of a text file


void setup()
{

  // size (300, 300, P3D);
  size (300, 300, OPENGL); // Create canvas , must be first in setup function
  colorMode(RGB, 255, 255, 255); //Explicitly specify color type and scale, could also add alpha/transparency if desired
  background(95); // Color of background 95 = dark grey
  
  //Create a divider line for gui (x1,y1, x2,y2) .618033 is golden ratio, subtract 44 pixels for apple menubar and program bar
  // line(0, screen.height*.61803399 - 44, screen.width, screen.height*.61803399 -44);
  // line(screen.width/2, 0, screen.width/2, screen.height*.61803399 -44);





   aLed1 = new Led(width/2, height/2, 50, 50); // Create led object, color is left blank
   aLed2 = new Led(width/4, height/2, 50, 50, red);// Create led object, color is included

}//end setup()=========================================>


// This normally is included in the startup, but with opengl you need to create a new thread
void openFile(String locationOfFile)
{
    if (locationOfFile == null)
      {
          println("no file selected");
      }
    else
      {                                            println("Opening file "+ locationOfFile);
         loadedFile = loadStrings(locationOfFile);  
                                                  println("Calling parseFile method"); 
         parseFile(loadedFile);                      
      }
}// end openFile()

void parseFile(String[] loadedFile)
{
                                                       println("parseFile method called");
                                                       println("loadedFile.length " + loadedFile.length);
  for (int i = 0; i < loadedFile.length; i++)
  {
      String[] pieces = split(loadedFile[i], TAB);      println("created string[] pieces ");
      
      if( pieces.length == 3) // if you get to the end of a line while parsing...
      {
        //create an led object, whos name is first word in the line
        println("about to make an object: " + pieces[0]);
        println("pieces[0] " + pieces[0]);
        println("pieces[1] " + pieces[1]);

      
       
       // anewLed.setCustomColor(string */
      }
      
       String ledName = pieces[0]; println("created string ledName "+ledName);
        
        anewLed = new Led(); // create a new empty led object with the name of first item in line
        anewLed.setLedLocationX(20);
        anewLed.setLedLocationY(20);
        drawObject(anewLed);
        
        
      
 // println("i in the for loop is: "+ i);
       println("");
  }//end for loop
  
}//end parseFile



void draw()
{
  //Doesnt work in opengl  update(mouseX, mouseY); // Constantly checks location of mouse

  aLed1.display(); 
  aLed2.display();
  

}//end draw()=========================================>

void drawObject(Led someLed)
{
  //Doesnt work in opengl  update(mouseX, mouseY); // Constantly checks location of mouse

  aLed1.display(); 
  aLed2.display();
  someLed.display();

}//end draw()=========================================>





void mousePressed()
{

  aLed1.setColor(255, 0, 0);
  aLed2.setCustomColor(purple);
  
  
  //Dialog boxes must have new threads created for them to work. See page
  //fourm.processing.org/topic/opengl-selectfolder
  
  new Thread(
            new Runnable() 
                {
                  public void run()
                      {
                        openFile(selectInput());
                      }
                }
            ).start();
            
            
  //aLed2.setColor(white);
}//end mousePressed()=========================================>



