import processing.core.PApplet;
public class Circle
{
  PApplet parent;
  
   Circle(PApplet p)
   {
     parent = p;
     //Draw a green circle at 10,10px
      fill(0,255,0);
      ellipse(10,10,10,10);
      noFill();
      
      //Draw a yellow circle at random
//      fill(255,255,0);
//      ellipse( random(0,100), random(0,100), 10, 10);
//      noFill();
     
     
     /*Solution*/
      parent.fill(255,255,0);
      parent.ellipse( random(0,100), random(0,100), 10, 10);
      parent.noFill();
   }
  
}
