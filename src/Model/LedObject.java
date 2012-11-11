package Model;

import java.awt.Color;

/**
 * The LedObject is a java bean which stores 3 attributes of every LED (Light Emitting Diode)
 * The LedObject class is mutable 
 * 
 * @author Spencer Owen
 * @version 2.0
 */
public class LedObject
{

  String   ledColor;       
  int 	ledBrightness;  //example 0 - 4096 it will be divisable so it is a float    
  int   ledNumberInCube;
  
  /**
  * The Constructor for LedObjects
  * @param ledColor			The color of the led. Stored as a String representation of the HEX value
  * @param ledBrightness	The brightness of the led (default 100, max 100). 
  * @param ledNumberInCube	The absolute number in the led array. Example a 16x16x16 led array would have led numbers 0 through 4095
  * 
  */
  LedObject( int ledNumberInCube, String ledColor)
  {
	  
	  if (ledNumberInCube < 0){
		  throw new IllegalArgumentException("ledNumberInCube = " + ledNumberInCube + " must be greater than 0");
	  }
	  this.ledNumberInCube = ledNumberInCube; 
 
      
      this.ledColor = ledColor;
      this.ledBrightness = 100;    
  } 
  /**
   * This method is not yet implemented because there is no current way to convert from x,y,z to absolute until the api is finished
   */
//  LedObject( int ledX, int ledY, int ledZ, String ledColor)
//  {
//      this.ledNumberInCube = ledNumberInCube;
//      this.ledColor = ledColor;
//      this.ledBrightness = ledBrightness;   
//  } 

  LedObject( int ledNumberInCube, String ledColor, int ledBrightness)
  {
      this.ledNumberInCube = ledNumberInCube;
      this.ledColor = ledColor;
      this.ledBrightness = ledBrightness;     
  } 
  /**
   * This method is not yet implemented because there is no current way to convert from x,y,z to absolute until the api is finished
   */
//  LedObject( int ledX, int ledY, int ledZ, String ledColor, int ledBrightness)
//  {
//      this.ledNumberInCube = ledNumberInCube;
//      this.ledColor = ledColor;
//      this.ledBrightness = ledBrightness;   
//  } 

  
  
  
  public int getLedNumberInCube()
  {
    return this.ledNumberInCube;
  }//end getLedCoordinates
  
  
  public int getLedX()
  {
	  //TODO: use the converter class to resolve this value
	  return 0;
  }
  
  public int getLedY()
  {
	  //TODO: use the converter class to resolve this value
	  return 0;
  }
  
  public int getLedZ()
  {
	  //TODO: use the converter class to resolve this value
	  return 0;
  }

  public void setLedColor(String ledColor)
  {
	  this.ledColor = ledColor;
  }//end setLedColor

  public String getLedColorHex()
  {
	  return this.ledColor;
  }//end getLedColor

  //TODO: Decide if I really want to encourage color, or do everthing as HEX
//  public Color getLedColorRGB()
//  {
//
//	  return Color.decode( this.ledColor);
//  }//end getLedColor



  public void setLedBrightness(int ledBrightness)
  {
    this.ledBrightness = ledBrightness;
  }//end setLedBrightness

  public int getLedBrightness()
  {
    return this.ledBrightness;
  }//end getLedBrightness
  
  
  public boolean sameColor(LedObject anotherLed)
  {
	if ( this.ledColor.equals(anotherLed.ledColor) )
	{
		return true;
	}
	else 
	{
		return false;
	}
	
  }

//  public String toString()
//  {
//      //http://docs.oracle.com/javase/tutorial/java/IandI/objectclass.html
//      return null;
//  }
} // end class LedObjects
