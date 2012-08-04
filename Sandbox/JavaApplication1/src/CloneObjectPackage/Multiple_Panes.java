
import processing.core.PApplet;

package CloneObjectPackage;

/**
 *
 * @author spencerowen
 */
public class Multiple_Panes {
    
    import processing.opengl.*;

//I am calling this PFrame4 just to prove that the name doesn matter
PFrame4 aPFrame;
secondApplet aSecondApplet;

public CircleObject theParentCircle;

color red   = color(#FF0000);
color green = color(0,255,0);
color blue  = color(0,0,255);

void setup() {
 size( screen.width, screen.height/2, OPENGL);
 frame.setResizable(true);
 frame.setLocation(0, screen.height/2);

 //Not sure what this does
 frame.addNotify();
 
 PFrame4 aPFrame = new PFrame4();
         aPFrame.setTitle("Second JFrame");
         aPFrame.setLocation(screen.width/2, 0);

  theParentCircle = new CircleObject();
            
      
}
    
void draw() {
  background(255,0,0);
  //aSecondApplet.background(0, 0, 255);
   //aSecondApplet.fill(100);
   //s.rect(10,20,frameCount0,10);// default line, wont compile
     
   
   theParentCircle.displayCircle();
   
   
   aSecondApplet.redraw(); 
}

void mouseReleased()
{
  theParentCircle.setColor( red );
}




}
