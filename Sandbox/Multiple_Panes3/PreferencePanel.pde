// second Processing applet
private class PreferencePanel extends PApplet {

  CircleObject   aCircle2;
  void setup() 
  {
 
    size(200, 200);
    
    fill(#FF00FF);
    aCircle2 = new CircleObject(20,20,20,20);
    noFill();
    ellipse(100,100,30,30);
    
  }  
  
  void draw() 
  {
    
  }
  

}
