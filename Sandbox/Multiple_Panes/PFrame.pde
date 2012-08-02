public class PFrame extends Frame 
{
    public PFrame() 
    {
        
        setBounds(100,100,400,300);
        aSecondApplet = new secondApplet();
        add(aSecondApplet);
        aSecondApplet.init();
        show();
    }

}// end PFrame

public class secondApplet extends PApplet 
{
      public void setup() 
      {
          size(400, 300);
          noLoop();
      }// end setup
  
      public void draw() 
      {
          background(0,0,255);
          ellipse(30,30,30,30);
        
      }// end draw
      
      public void mouseReleased()
      {
        fill( 255, 0, 0 );
      }// end mouseReleased
      
}// end secondApplet


