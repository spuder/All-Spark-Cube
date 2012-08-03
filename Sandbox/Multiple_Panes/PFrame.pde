public class PFrame extends Frame 
{
    public PFrame() 
    {
        
        setBounds(300,screen.height/2, screen.width/2,screen.height/2);
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
        //**** This must be set in conjunction with the PFrame class
        // to set the size and start position of a window
         // size(width,height); //nevermind, dont set it at all
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


