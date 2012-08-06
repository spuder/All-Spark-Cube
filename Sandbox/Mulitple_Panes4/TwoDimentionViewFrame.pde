public class TwoDimentionViewFrame extends java.awt.Frame 
{
    public TwoDimentionViewFrame() 
    {
        
       setBounds(0,screen.height/2, screen.width,screen.height/2);
       theTwoDimentionViewApplet = new TwoDimentionViewApplet();
                        add(theTwoDimentionViewApplet);
                            theTwoDimentionViewApplet.init();
        show();
    }

}// end PFrame3d