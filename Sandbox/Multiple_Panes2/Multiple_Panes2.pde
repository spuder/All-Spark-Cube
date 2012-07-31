/*
Sample code of one way to implement
mulitple windows where one can comunicate
with the other slightly modified from Manindra29

http://forum.processing.org/topic/second-applet
*/
//Explicitly call the java swing class
import javax.swing.JFrame;

// EmbeddedSketch is a class we wrote that extends JFrame
// It creates a new PApplet, assigns bounds and sets it visible
EmbeddedSketch eSketch;


ChildApplet child = new ChildApplet();

boolean mousePressedOnParent = false;

public void setup() {
  size(320, 240);
  eSketch = new EmbeddedSketch(child);
  smooth();
}

public void draw() {
  background(250);


  if (mousePressed) {
    fill(0);
    text("Mouse pressed on parent.", 10, 10);
    fill(0, 240, 0);
    ellipse(mouseX, mouseY, 60, 60);
    mousePressedOnParent = true;
  }
  else {
    fill(20);
    ellipse(width/2, height/2, 60, 60);
    mousePressedOnParent = false;
  }

  if (eSketch.sketch.mousePressed)
    text("Mouse pressed on child.", 10, 30);
}





