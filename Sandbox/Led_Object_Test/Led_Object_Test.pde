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
  size (1400, 800); // Create canvas , must be first in setup function
  colorMode(RGB, 255, 255, 255); //Explicitly specify color type and scale, could also add alpha/transparency if desired
  background(95); // Color of background 95 = dark grey

  //Create a divider line for gui (x1,y1, x2,y2) .618033 is golden ratio, subtract 44 pixels for apple menubar and program bar
  line(0, displayHeight*.61803399 - 44, displayWidth, displayHeight*.61803399 -44);
  line(displayWidth/2, 0, displayWidth/2, displayHeight*.61803399 -44);

  /* Buttons============================
   --------------------------------------*/

  whiteBox1 = new GuiButton(displayWidth/2 + 40,       displayHeight*.6180399 - 44 -25, 65, 40, white); // new Gui button with golden ratio
  blackBox1 = new GuiButton(displayWidth/2 + 40 + 80,  displayHeight*.6180399 - 44 -25, 65, 40, black); // new Gui button with golden ratio
  redBox1   = new GuiButton(displayWidth/2 + 40 + 160, displayHeight*.6180399 - 44 -25, 65, 40, red); // new Gui button with golden ratio
  blueBox1  = new GuiButton(displayWidth/2 + 40 + 240, displayHeight*.6180399 - 44 -25, 65, 40, blue); // new Gui button with golden ratio
  greenBox1 = new GuiButton(displayWidth/2 + 40 + 320, displayHeight*.6180399 - 44 -25, 65, 40, green); // new Gui button with golden ratio


  aLed1 = new Led(width/2, height/2, 50, 50); // Create led object, color is left blank
  aLed2 = new Led(width/4, height/2, 50, 50, red);// Create led object, color is included
  
  
  // aLed3 = new Led();
}//end setup()=========================================>



void draw()
{
  //Doesnt work in opengl  update(mouseX, mouseY); // Constantly checks location of mouse

  aLed1.display(); 
  aLed2.display();
  whiteBox1.display(); 
  blackBox1.display(); 
  redBox1.display(); 
  blueBox1.display(); 
  greenBox1.display();
}//end draw()=========================================>




void mousePressed()
{

  aLed1.setColor(255, 0, 0);
  aLed2.setCustomColor(purple);
  //aLed2.setColor(white);
}//end mousePressed()=========================================>

