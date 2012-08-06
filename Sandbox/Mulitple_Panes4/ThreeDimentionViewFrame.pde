public class ThreeDimentionViewFrame extends java.awt.Frame 
{
    public ThreeDimentionViewFrame() 
    {
        
       setBounds(screen.width/2,screen.height/2, screen.width/2,screen.height/2);
       theThreeDimentionViewApplet = new ThreeDimentionViewApplet();
                        add(theThreeDimentionViewApplet);
                            theThreeDimentionViewApplet.init();
        show();
    }

}// end PFrame3d