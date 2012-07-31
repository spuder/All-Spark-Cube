public class ChildApplet extends PApplet {
  public void setup() {
    size(400, 400);
    smooth();
  }

  public void draw() {
    background(0);
    if (mousePressed) {
      fill(240, 0, 0);
      ellipse(mouseX, mouseY, 20, 20);
      fill(255);
      text("Mouse pressed on child.", 10, 30);
    }
    else {
      fill(255);
      ellipse(width/2, height/2, 20, 20);
    }		

    if (mousePressedOnParent) {
      fill(255);
      text("Mouse pressed on parent", 20, 20);
    }
  }
}
