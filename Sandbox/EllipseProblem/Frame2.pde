public class Frame2 extends java.awt.Frame 
{
   Frame2()
   {
     setBounds (0,screen.width/2, screen.width/4, screen.height/4);
     anApplet2 = new Applet2();
     add(anApplet2);
         anApplet2.init();
     show();  
   }
    
}
