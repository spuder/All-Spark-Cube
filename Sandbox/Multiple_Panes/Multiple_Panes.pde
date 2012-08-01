
PFrame aPFrame;
secondApplet anApplet;

void setup() {
 size(320, 240);
 PFrame aPFrame = new PFrame();
}

void draw() {
  background(255,0,0);
   fill(255);
   //rect(10,10,frameCount0,10);// default line, wont compile
   anApplet.background(0, 0, 255);
  
   anApplet.fill(100);
   //s.rect(10,20,frameCount0,10);// default line, wont compile
   anApplet.redraw();
}


