public class Circle
{
   Circle(PApplet aParent)
   {
     //Draw a green circle at 10,10px
      fill(0,255,0);
      ellipse(10,10,10,10);
      noFill();
      
      //Draw a yellow circle at random
//      fill(255,255,0);
//      ellipse( random(0,100), random(0,100), 10, 10);
//      noFill();
     
     
     /*Solution*/
      anApplet1.fill(255,255,0);
      aParent.ellipse( random(0,100), random(0,100), 10, 10);
      anApplet1.noFill();
   }
  
}
