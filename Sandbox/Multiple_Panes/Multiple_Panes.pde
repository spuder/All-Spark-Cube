import processing.opengl.*;

//I am calling this PFrame4 just to prove that the name doesn matter
PFrame aPFrame;
SecondApplet aSecondApplet;

public CircleObject theParentCircle;
public CircleObject theParentCircleClone;
public CircleObject childCircle;

color red   = color(#FF0000);
color green = color(0,255,0);
color blue  = color(0,0,255);

void setup() {
 size( screen.width, screen.height/2, OPENGL);
 frame.setResizable(true);
 frame.setLocation(0, screen.height/2);

 //Not sure what this does
 frame.addNotify();
 
 PFrame aPFrame = new PFrame();
         aPFrame.setTitle("Second JFrame");
         aPFrame.setLocation(screen.width/2, 0);

  theParentCircle = new CircleObject();   
  childCircle = theParentCircle;
}
    
void draw() {
  background(255,0,0);
   
   theParentCircle.displayCircle();   
   aSecondApplet.redraw(); 
}

void mouseReleased()
{
  theParentCircle.setColor( red );
}


