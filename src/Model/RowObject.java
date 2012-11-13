package model;

import controller.ConvertLedType;


class RowObject
{

  // Create a new array of Leds for just this row 
  LedObject[] anArrayOfRowLeds;

  int rowCoordinateY;
  int rowCoordinateZ;
  
  RowObject(int rowCoordinateY, int rowCoordinateZ)
  {
          // Create a new array of LEDs, the size of the array is set based on the number of leds per row
 
          this.anArrayOfRowLeds = new LedObject[ CubeAttributes.getxNumberOfLedsPerRow() ];
      
          this.rowCoordinateY = rowCoordinateY;
          this.rowCoordinateZ = rowCoordinateZ;
      
          //We need to find the first led in the row we are trying to create
          int firstLedInRow = ConvertLedType.relativeToAbsolute( 0, rowCoordinateY, rowCoordinateZ );  

          // Create the led objects, add the LEDs to the array list, add the array list to the object
         for ( int ledNumberInRowCounter = 0; ledNumberInRowCounter < CubeAttributes.getxNumberOfLedsPerRow(); ledNumberInRowCounter++)
         {
                  // Create led object ( (0-16), 0 = off, 0 = brightness,)
                  LedObject aLedObject = new LedObject( (firstLedInRow + ledNumberInRowCounter), "FFFFFF");
  
                  //Add the object to the class array.
                  this.anArrayOfRowLeds[ledNumberInRowCounter] = aLedObject;

         }//end for loop create objects
         


  } //end RowObject constructor

  public LedObject getLedObject(int xPositionInArray)
  {
	  if (xPositionInArray < 0)
		  throw new IllegalArgumentException("xPositionInArray must be positive, received: " + xPositionInArray);
 	 return anArrayOfRowLeds[xPositionInArray]; 
  }

   /*
  public String toString()
  {
      //http://docs.oracle.com/javase/tutorial/java/IandI/objectclass.html
      return null;
  }
   */
   
} // end class RowObject
