	import processing.opengl.*;

<<<<<<< HEAD
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
=======
PFrame aPFrame;
secondApplet s;

void setup() {
 size(320, 240);
 PFrame aPFrame = new PFrame();
}
>>>>>>> development-dualpane

 //Not sure what this does
 frame.addNotify();
 
 PFrame aPFrame = new PFrame();
         aPFrame.setTitle("Second JFrame");
         aPFrame.setLocation(screen.width/2, 0);

  theParentCircle = new CircleObject();   
  childCircle = theParentCircle;
}
    
void draw() {
<<<<<<< HEAD
  background(255,0,0);
   
   theParentCircle.displayCircle();   
   aSecondApplet.redraw(); 
}

void mouseReleased()
{
  theParentCircle.setColor( red );
}

=======
  background(255,0,0); //draw as red
   fill(255);
   //rect(10,10,frameCount0,10);// default line, wont compile
   s.background(0, 0, 255);
   s.fill(100);
   //s.rect(10,20,frameCount0,10);// default line, wont compile
   s.redraw();
}

public class PFrame extends Frame {
    public PFrame() {
        setBounds(100,100,100,500);
        s = new secondApplet();
        add(s);
        s.init();
        show();
    }
}

public class secondApplet extends PApplet {
    public void setup() {
        size(1300, 200  );
        noLoop();
    }
>>>>>>> development-dualpane

