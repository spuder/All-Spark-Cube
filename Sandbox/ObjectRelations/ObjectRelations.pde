/*
This code is to experiment with different relations of objects

How to draw a box with leds inside it. The leds are not drawn relative to the 
screen but relative to the box. 
Based on Processing example

A Project has many Snapshots, a snapshot has many panels, 
those panels can be extended to a cube, the panels have 
many leds, an led has many states/colors/brightness

*/

BoxClass aBoxObject;
RingClass aRingObject;
//float xLocation; // this is inherited by both box and ring
//float yLocation;

  void setup() {
    size(300,300); //300 by 300 pixel window
    smooth();
    
    aBoxObject = new BoxClass( 10.0, 10.0 ); // create a new box at location 10,10 
    
    //dont declare a ring here beasuse it is part of the box
    
  }//end setup()
  
  
  
  void draw() {
    background(255); // make background black
    
    aBoxObject.display();
    
  }//end draw()
  
  
  void MousePressed() {
    
    aBoxObject.moveBox(10.0, 10.0); //move the box 10 pixels which will also move the circle 10 pixels
    
    
  }
