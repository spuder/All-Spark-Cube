//The JFrame which will contain the child applet
public class EmbeddedSketch extends JFrame 
{
  
  PApplet sketch;
  
  public EmbeddedSketch(PApplet p) 
  {
      
      setBounds(100, 100, 400, 400);
      add(p);
      p.init();
      sketch = p;
      setLocation(500, 200);
      
      //Program exits
      setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      setVisible(true);
      
  }//end Constructor EmbeddedSketch
  
}//end class EmbeddedSketch
