public class Frame1 extends java.awt.Frame 
{
   Frame1()
   {
     setBounds (0,0, screen.width/4, screen.height/4);
     anApplet1 = new Applet1();
     add(anApplet1);
         anApplet1.init();
     show();     
   }
  
}
