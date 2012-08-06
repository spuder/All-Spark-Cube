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

