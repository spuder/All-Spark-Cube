

/*******************************
         Kite class
*******************************/
/* By extending PApplet you can use your sweet old P5
 calls in a regular Java App. Pretty nice indeed! */
 
 /*
 *******Add these lines to make actual java *****
import processing.core.*;
import java.awt.*;

public class KiteController extends JPanel {
 ********************************************
 */
 
 
  /*
   This code works great In processing. 
  */

  // instance properties
  private Point2D dummy;
  private Vect2D dummyVel;
  private int feetCount = 4;
  private Point2D[] feet = new Point2D[feetCount];
  private Vect2D[] feetDelta = new Vect2D[feetCount];
  private Vect2D[] feetVel = new Vect2D[feetCount];
  private Vect2D[] feetAccel = new Vect2D[feetCount];
  private float botRadius = 45.0f;
  private float[] springSpeed = new float[feetCount];
  private float springSpdMin = .05f, springSpdMax = .1f;
  private float damping = .9f;
  private Point2D lead;
  private Vect2D leadVel;
  private int w, h;
  private int stringBaseX;
  private int stringBaseY;
  private float theta = 0;
 
 /*
 ******** Add these lines for actual java ********
  // constructor
  public Kite(int w, int h){
    this.w = w;
    this.h = h;
  }
  ******************************************
  */
 

 
  // Yes, this is the P5 setup()
  public void setup(){
    /* account for height of frame title bar,
     when sizing applet. getBounds() returns a Java
     Rectangle object that has 4 public properties:
     (x, y, width and height) */
    int titleBarHt = getBounds().y;
    size(400,400);//size(w, h-titleBarHt);
    smooth();
    frameRate(30);
 
    dummy = new Point2D(width/2, height/4);
    dummyVel = new Vect2D(3.65f, 2.0f);
    lead = new Point2D(width/2, height/2);
    leadVel = new Vect2D(.04f, .05f);
 
    stringBaseX = width/2;
    stringBaseY = height;
 
    // set legs with some trig
    for (int i=0; i<feet.length; i++){
      feet[i] = new Point2D(dummy.x + cos(theta)*botRadius, 
             dummy.y + sin(theta)*botRadius);
      feetDelta[i] = new Vect2D(feet[i].x-dummy.x, feet[i].y-dummy.y);
      feetVel[i] = new Vect2D(0, 0);
      feetAccel[i] = new Vect2D(0, 0);
      theta += TWO_PI/feet.length;
      springSpeed[i] = random(springSpdMin, springSpdMax);
    }
  }
 
  // A huh, this is the P5 draw()
  public void draw(){
    background(255);
    drawBot();
    moveBot();
  }
 
  public void drawBot(){
    rectMode(CENTER);
    fill(0);
    for (int i=0; i<feet.length; i++){
      line(dummy.x, dummy.y, feet[i].x, feet[i].y);
      if (i<feet.length-1){
        line(feet[i].x, feet[i].y, feet[i+1].x, feet[i+1].y);
      }
      else {
        line(feet[i].x, feet[i].y, feet[0].x, feet[0].y);
      }
    }
    line(stringBaseX, stringBaseY, dummy.x, dummy.y);
 
    if (mousePressed){
      stringBaseX = mouseX;
      stringBaseY = mouseY;
    }
    fill(255);
  }
 
  public void moveBot(){
    Vect2D[] feetMotionDelta = new Vect2D[feetCount];
 
    for (int i=0; i<feet.length; i++){
      feetMotionDelta[i] = new Vect2D((dummy.x-feet[i].x+ 
             feetDelta[i].vx)*springSpeed[i],
      (dummy.y-feet[i].y+feetDelta[i].vy)*springSpeed[i]);
 
      feetAccel[i].vx+= feetMotionDelta[i].vx;
      feetAccel[i].vy+= feetMotionDelta[i].vy;
 
      feetVel[i].vx += feetAccel[i].vx;
      feetVel[i].vy += feetAccel[i].vy;
 
      feet[i].x = feetVel[i].vx ;
      feet[i].y = feetVel[i].vy ;
 
      feetAccel[i].vx *= damping;
      feetAccel[i].vy *= damping;
 
      float rotAng = atan2(mouseY-(height+100), mouseX-width/2);
      if (mousePressed){
        dummy.x = mouseX + cos(rotAng)*200;
        dummy.y = mouseY + sin(rotAng)*200;
      }
    }
  }
 
  // dynamically change kite parameters
  public void setFeetCount(int val){
    // reinitialize arrays
    feetCount = val;
    feet = new Point2D[feetCount];
    feetDelta = new Vect2D[feetCount];
    feetVel = new Vect2D[feetCount];
    feetAccel = new Vect2D[feetCount];
    springSpeed = new float[feetCount];
 
    // reset values
    float theta = 0;
    for (int i=0; i<feet.length; i++){
      feet[i] = new Point2D(dummy.x + cos(theta)*botRadius, 
             dummy.y + sin(theta)*botRadius);
      feetDelta[i] = new Vect2D(feet[i].x-dummy.x, feet[i].y-dummy.y);
      feetVel[i] = new Vect2D(0, 0);
      feetAccel[i] = new Vect2D(0, 0);
      theta += TWO_PI/feet.length;
      springSpeed[i] = random(springSpdMin, springSpdMax);
    }
  }
 
  public void setRadius(int val){
    botRadius = val;
    for (int i=0; i<feet.length; i++){
      feet[i].x = dummy.x + cos(theta)*botRadius;
      feet[i].y = dummy.y + sin(theta)*botRadius;
      feetDelta[i].vx = feet[i].x-dummy.x;
      feetDelta[i].vy = feet[i].y-dummy.y;
      theta += TWO_PI/feet.length;
    }
  }
 
  public void setSpringSpeed(float val){
    for (int i=0; i<feet.length; i++){
      springSpeed[i] = random(springSpdMin, val);
    }
  }
 
  public void setSpringDamping(float val){
    damping = val;
  }
 
  /* two simple inner classes to make
     things a little easier */
  class Point2D{
    float x, y;
 
    Point2D(float x, float y){
      this.x = x;
      this.y = y;
    }
  }
 
  class Vect2D{
    float vx, vy;
 
    Vect2D(float vx, float vy){
      this.vx = vx;
      this.vy = vy;
    }
  }

