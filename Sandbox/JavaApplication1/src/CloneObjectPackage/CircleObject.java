
package CloneObjectPackage;

import processing.core.PApplet;

public class CircleObject implements Cloneable
{
  color aColor;
  
  CircleObject()
  {
     this.aColor = color(255,0,0);
  }
  
  void displayCircle()
  {
    fill( this.aColor);
    ellipse(30,30,30,30);
    noFill();  
  }
  
  void setColor( color aColorToSet )
  {
    this.aColor = aColorToSet;
  }
  
  public Object clone() throws CloneNotSupportedException {
 /*
 Employee copyObj = new Employee();
 copyObj.setDesignation(this.designation);
 copyObj.setName(this.name);
 return copyObj;
 */
 return super.clone();
 }
  
}// end class CircleObject