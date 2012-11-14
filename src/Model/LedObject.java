package model;

import java.awt.Color;

import controller.ConvertLedType;

/**
 * The LedObject is a java bean which stores 3 attributes of every LED (Light Emitting Diode)
 * The LedObject class is mutable 
 * 
 * @author Spencer Owen
 * @version 2.0
 */
public class LedObject
{

  int   ledColor;       
  int 	ledBrightness;  //example 0 - 4096 it will be divisable so it is a float    
  int   ledNumberInCube;
  
  /**
  * Creates an Instance of an Led Object
  * 
  * @param ledNumberInCube	The absolute number in the led array. Must be non-negative and less than the total number of leds in the cube
  * @param ledColor			The color of the led. Will be converted to HEX and stored as an integer 
  * @throws IllegalArgumentException if the ledNumberInCube is negative or if ledNumberInCube > the total number of leds in the cube
  */
  LedObject( int ledNumberInCube, int ledColor)
  {
	  if (ledNumberInCube < 0)
		  throw new IllegalArgumentException("ledNumberInCube = " + ledNumberInCube + " must be greater than 0");
	  if (ledNumberInCube  > model.CubeAttributes.getNumberOfLedsPerCube())
		  throw new IllegalArgumentException("ledNumberInCube = " + ledNumberInCube + " must be less than number of leds in cube, received: "+ CubeAttributes.getNumberOfLedsPerCube());

		  this.ledNumberInCube = ledNumberInCube; 
 
      
      this.ledColor = ledColor;
      this.ledBrightness = 100;    
  } 
  
  /**
  * Creates an Instance of an Led Object
  * 
  * @param ledNumberInCube	The absolute number in the led array. Must be non-negative and less than the total number of leds in the cube
  * @param ledColor			The color of the led. Must be a 6 digit string representing the color in HEX. 
  * @throws IllegalArgumentException if the ledNumberInCube is negative or if ledNumberInCube > the total number of leds in the cube
  */
  LedObject( int ledNumberInCube, String ledColor)
  {
	  if (ledNumberInCube < 0)
		  throw new IllegalArgumentException("ledNumberInCube = " + ledNumberInCube + " must be greater than 0");
	  if (ledNumberInCube  > model.CubeAttributes.getNumberOfLedsPerCube())
		  throw new IllegalArgumentException("ledNumberInCube = " + ledNumberInCube + " must be less than number of leds in cube, received: "+ CubeAttributes.getNumberOfLedsPerCube());

	  //If we receive text such as "0xffffff" drop off the first 2 characters
	  if (ledColor.length() == 8)
		  ledColor = ledColor.substring(ledColor.length() - 6);
	  
	  this.ledNumberInCube = ledNumberInCube; 
      this.ledColor = ConvertLedType.hexToInt( ledColor );
      this.ledBrightness = 100; 
   
  } 
  
  /**
  * Creates an Instance of an Led Object
  * 
  * @param ledX	The X coordinate of the led. 0 is the first led in the row. Must be non negative
  * @param ledY The Y coordinate of the led. 0 is the first led in the column. Must be non negative
  * @param ledZ The Z coordinate of the led. 0 is the first panel in the cube. Must be non negative
  * @param ledColor			The color of the led. Must be a 6 digit string representing the color in HEX. 
  * @throws IllegalArgumentException if the ledNumberInCube is negative or if ledNumberInCube > the total number of leds in the cube
  */
  LedObject( int ledX, int ledY, int ledZ, int ledColor)
  {
	  if ( ledX < 0 || ledY < 0 || ledZ < 0 )
		  throw new IllegalArgumentException("LedObject(ledX,ledY,ledZ) must be given numbers greater than 0, received:  " + ledX + "," + ledY + "," + ledZ);
      this.ledNumberInCube = ConvertLedType.relativeToAbsolute(ledX, ledY, ledZ);
      this.ledColor = ledColor;
      this.ledBrightness = 100;   
  } 
  
  
  /**
  * Creates an Instance of an Led Object
  * 
  * @param ledX	The X coordinate of the led. 0 is the first led in the row. Must be non negative
  * @param ledY The Y coordinate of the led. 0 is the first led in the column. Must be non negative
  * @param ledZ The Z coordinate of the led. 0 is the first panel in the cube. Must be non negative
  * @param ledColor			The color of the led. Must be a 6 digit string representing the color in HEX. 
  * @throws IllegalArgumentException if the ledNumberInCube is negative or if ledNumberInCube > the total number of leds in the cube
  */
  LedObject( int ledX, int ledY, int ledZ, String ledColor)
  {
	  
	  //If we receive text such as "0xffffff" drop off the first 2 characters
	  if (ledColor.length() == 8)
		  ledColor = ledColor.substring(ledColor.length() - 6);
	  
	  if ( ledX < 0 || ledY < 0 || ledZ < 0 )
		  throw new IllegalArgumentException("LedObject(ledX,ledY,ledZ) must be given numbers greater than 0, received:  " + ledX + "," + ledY + "," + ledZ);
      this.ledNumberInCube = ConvertLedType.relativeToAbsolute(ledX, ledY, ledZ);
      this.ledColor = ConvertLedType.hexToInt( ledColor );
      this.ledBrightness = 100;   
  } 

  LedObject( int ledNumberInCube, int ledColor, int ledBrightness)
  {
	  if (ledNumberInCube < 0)
		  throw new IllegalArgumentException("ledNumberInCube = " + ledNumberInCube + " must be greater than 0");
	  if (ledNumberInCube  > model.CubeAttributes.getNumberOfLedsPerCube())
		  throw new IllegalArgumentException("ledNumberInCube = " + ledNumberInCube + " must be less than number of leds in cube, received: "+ CubeAttributes.getNumberOfLedsPerCube());

	  if (ledBrightness < 0 || ledBrightness > 100)
		  throw new IllegalArgumentException("ledBrightness must be between 0 and 100, received: " + ledBrightness);
      this.ledNumberInCube 	= ledNumberInCube;
      this.ledColor 		= ledColor;
      this.ledBrightness 	= ledBrightness;     
  } 
  /**
   * This method is not yet implemented because there is no current way to convert from x,y,z to absolute until the api is finished
   */
  LedObject( int ledX, int ledY, int ledZ, String ledColor, int ledBrightness)
  {
	  
	  //If we receive text such as "0xffffff" drop off the first 2 characters
	  if (ledColor.length() == 8)
		  ledColor = ledColor.substring(ledColor.length() - 6);
	  
	  if ( ledX < 0 || ledY < 0 || ledZ < 0 )
		  throw new IllegalArgumentException("LedObject(ledX,ledY,ledZ) must be given numbers greater than 0, received:  " + ledX + "," + ledY + "," + ledZ);
      
	  if (ledBrightness < 0 || ledBrightness > 100)
		  throw new IllegalArgumentException("ledBrightness must be between 0 and 100, received: " + ledBrightness);
      
	  this.ledNumberInCube = ConvertLedType.relativeToAbsolute(ledX, ledY, ledZ);
      this.ledColor = ConvertLedType.hexToInt( ledColor );
      this.ledBrightness = ledBrightness;   
  } 

  
  
  
  public int getLedNumberInCube()
  {
    return this.ledNumberInCube;
  }//end getLedCoordinates
  
  
  public int getLedX()
  {
	 
	  return ConvertLedType.absoluteToXPositionInRow(this.ledNumberInCube);
  }
  
  public int getLedY()
  {
	  return ConvertLedType.absoluteToYPositionInPanel(this.ledNumberInCube);
  }
  
  public int getLedZ()
  {
	  return ConvertLedType.absoluteToZPositionInCube(this.ledNumberInCube);
  }

  public void setLedColor(int ledColor)
  {
	  this.ledColor = ledColor;
  }//end setLedColor
  
  public void setLedColor(String ledColor)
  {
	  if (ledColor.length() != 6 && ledColor.length() !=8 )
		  throw new IllegalArgumentException("setLedColor parameter must be either 6 or 8 characters long, received " + ledColor);
	  if (ledColor.length() > 6)
		  ledColor = ledColor.substring(ledColor.length() -6);
	  this.ledColor = ConvertLedType.hexToInt(ledColor);
  }//end setLedColor

  public String getLedColorHex()
  {
	  String answer = ConvertLedType.intToHex( this.ledColor );
	  if (answer.length() > 6)
		  answer = answer.substring(answer.length() -6);
	  return answer;
  }//end getLedColor


  /**
   * Sets the brightness of an LED 
   * The integer is a representation of a percentage
   * Acceptable values range between 0 and 100
   * Example: setLedBrightness(42);
   * @param ledBrightness
   * @see getLedBrightness
   * @throws IllegalArgumentException
   */
  public void setLedBrightness(int ledBrightness)
  {
	  if( ledBrightness < 0 || ledBrightness > 100 )
		  throw new IllegalArgumentException("ledBrightness must be between 0 and 100, received: " + ledBrightness);
    this.ledBrightness = ledBrightness;
  }//end setLedBrightness

  /**
   * Returns the brightness of an LED
   * The number is an integer which represents a percentage 0 - 100
   * Example: 42
   * @return
   * @see setLedBrightness
   */
  public int getLedBrightness()
  {
    return this.ledBrightness;
  }//end getLedBrightness
  
  /**
   * Returns true/false if two LED's have the same color
   * Only the last 6 characters are analyzed
   * @param anotherLed
   * @return true
   * @return false
   */
  public boolean sameColor(LedObject anotherLed)
  {
	if ( this.ledColor == anotherLed.ledColor )
	{
		return true;
	}
	else 
	{
		return false;
	}
	
  }

  /**
   * Returns the led number, color and brightness of an led object
   * This is subject to change.
   * Example "LED Number:4095, Color: FFAAFF, Brightness: 100%"
   */
  public String toString()
  {
      //http://docs.oracle.com/javase/tutorial/java/IandI/objectclass.html
	  
      return "LED Number:" + getLedNumberInCube() + ", Color: " + getLedColorHex() + ", Brightness: " + getLedBrightness() + "%";
  }
  
} // end class LedObjects
