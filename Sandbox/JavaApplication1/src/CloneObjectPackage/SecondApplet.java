/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CloneObjectPackage;

/**
 *
 * @author spencerowen
 */
   
public class SecondApplet extends processing.core.PApplet 
{
  
  CircleObject childCircle;
  
      public void setup() 
      {
     
        //Create a new circle object
        //childCircle = new CircleObject();
        //Create a shallow copy (clone) of the object
        try{
            CircleObject childCircle = (CircleObject) theParentCircle.clone();
        }
        catch (CloneNotSupportedException cnse) {
         System.out.println("Cloneable should be implemented. " + cnse );
        }
        
          noLoop();
      }// end setup
  
      public void draw() 
      {
          background(0,0,255);
          childCircle.displayCircle();
          //theParentCircle.displayCircle();
        
      }// end draw
      
      public void mouseReleased()
      {
        
      }// end mouseReleased
      
}// end SecondApplet
