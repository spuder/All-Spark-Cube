public class PFrame extends java.awt.Frame 
{
    public PFrame() 
    {
        
       setBounds(300,screen.height/2, screen.width/2,screen.height/2);
       aSecondApplet = new SecondApplet();
                        add(aSecondApplet);
                            aSecondApplet.init();
        show();
    }

}// end PFrame

 class SecondApplet extends processing.core.PApplet 
{
  
  CircleObject childCircle;
  
      public void setup() 
      {
     
        //Create a new circle object
        //childCircle = new CircleObject();
        //Create a shallow copy (clone) of the object
//        try{
//            CircleObject childCircle = (CircleObject) theParentCircle.clone();
//        }
//        catch (CloneNotSupportedException cnse) {
//         System.out.println("Cloneable should be implemented. " + cnse );
//        }

        
          noLoop();
      }// end setup
  
      public void draw() 
      {
          background(0,0,255);
          childCircle.displayCircle();
          //theParentCircleClone.displayCircle();
        
      }// end draw
      
      public void mouseReleased()
      {
        
      }// end mouseReleased
      
}// end secondApplet


