package Model;


/**
 * The most fundamental piece of data, stores color, brightness and led number
 * 
 * @author (your name) 
 * @2.0
 */

class LedObject
{

  int   ledColor;       //example #ff00ff
  float ledBrightness;  //example 0 - 4096 it will be divisable so it is a float    
  int   ledNumberInCube;



  LedObject( int ledNumberInCube, int ledColor, float ledBrightness )
  {

      this.ledNumberInCube = ledNumberInCube;
      this.ledColor = ledColor;
  
      // for testing set a perminate value and dont worry about it
      this.ledBrightness = 255; 
      
  
     
      
  } //end constuctor


  public int getLedNumberInCube()
  {
    return this.ledNumberInCube;
  }//end getLedCoordinates

  public void setLedColor(int ledColor)
  {
    this.ledColor = ledColor;
  }//end setLedColor

    public int getLedColor()
  {
    return this.ledColor;
  }//end getLedColor

  public void setLedBrightness(float ledBrightness)
  {
    this.ledBrightness = ledBrightness;
  }//end setLedBrightness

  public float getLedBrightness()
  {
    return this.ledBrightness;
  }//end getLedBrightness

} // end class LedObjects
