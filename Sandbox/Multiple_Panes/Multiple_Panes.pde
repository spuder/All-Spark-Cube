import processing.opengl.*;


PFrame aPFrame;
secondApplet aSecondApplet;

void setup() {
 size(320, 240, OPENGL);
 frame.setResizable(true);
 PFrame aPFrame = new PFrame();
        aPFrame.setTitle("Second JFrame");
}

void draw() {
  background(255,0,0);
  //aSecondApplet.background(0, 0, 255);
   //aSecondApplet.fill(100);
   //s.rect(10,20,frameCount0,10);// default line, wont compile
   aSecondApplet.redraw();   
   ellipse(40,40,40,40); 
}

void mouseReleased()
{
  fill(0,255,0);
}


