
PFrame aPFrame;
secondApplet s;

void setup() {
 size(320, 240);
 PFrame aPFrame = new PFrame();
}

void draw() {
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

    public void draw() {
    }
}