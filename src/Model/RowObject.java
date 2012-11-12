package model;


/**
 * Write a description of class RowObject here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

class RowObject
{

  // Create a new array of Leds for just this row (16 long)
  LedObject[] anArrayOfRowLeds;

  int rowCoordinateY;
  int rowCoordinateZ;
  
  RowObject(int rowCoordinateY, int rowCoordinateZ)
  {
          // Create a new array of Leds for just this row (16 long)
          //this.anArrayOfRowLeds = new LedObject[xNumberOfLedsPerRow];
          this.anArrayOfRowLeds = new LedObject[AllSparkAPI.getXNumberOfLedsPerRow()];
      
          this.rowCoordinateY = rowCoordinateY;
          this.rowCoordinateZ = rowCoordinateZ;
      
          int firstLedInRow = relativeLedLocationToAbsolute(this.rowCoordinateY, this.rowCoordinateZ);  

     // Create the led objects, add the lds to the array list, add the array list to the object
         for ( int ledNumberInRowCounter = 0; ledNumberInRowCounter < xNumberOfLedsPerRow; ledNumberInRowCounter++)
       {
                  // Create led object ( (0-16), 0 = off, 0 = brightness,)
                  LedObject aLedObject = new LedObject( (firstLedInRow + ledNumberInRowCounter), 0, 0);
  
                  //Add the object to the class array.
                  this.anArrayOfRowLeds[ledNumberInRowCounter] = aLedObject;
                   
                  // Convert this led to an absolute location
                  int ledAbsoluteValue = relativeLedLocationToAbsolute( this.rowCoordinateY, this.rowCoordinateZ ) + ledNumberInRowCounter;  
       
                  // Add the led object to the master array aswell     
                  //aMasterArrayOfAllLeds[ ledAbsoluteValue ] = aLedObject; 
                  //***NOTE***COMMENTED THIS OUT FOR THIS SANDBOX aMasterArrayOfAllLedsInAllCubes.add(aLedObject);
                     
                  //Decomission the object to mark it for the java garbage collector
                  aLedObject = null;
            }//end for loop create objects

      

  } //end RowObject constuctor

/*
    

    int absoluteLedLocationToRelativeY(int absoluteLocation)
    {
        //If the user passes in a number like 48 return the 3 from the 
        //relative location [3, 0] (row 3, panel 0 )
        return absoluteLocation / xNumberOfLedsPerRow;
    }
  
    int absoluteLedLocationToRelativeZ(int absoluteLocation)
    {
          // If the user passes in a number like 48 return the 0 from the 
          // relative location [3,0] (row 3, panel 0 )
          return absoluteLocation / xNumberOfLedsPerRow / yNumberOfRowsPerPanel;
    }
  
  
    int relativeLedLocationToAbsolute(int rowCoordinateY, int rowCoordinateZ )
    {
          //If the user passes in a number like [3,0] (row 3, panel 0) it returns 48. 
          return ( 1 + rowCoordinateY + rowCoordinateZ * zNumberOfPanelsPerCube ) * yNumberOfRowsPerPanel - xNumberOfLedsPerRow;
        
    }//end relativeLedLocationToAbsolute
    

    int absoluteLocationToPositionInRow(int absoluteLocation)
    {
        // Passing in the absolute location such as 4095 returns the position in the 
        // row 0 - 16.  4095 returns 15, 20 returns 4
        int ledTotalRowNumber = (absoluteLocation / xNumberOfLedsPerRow); // 48 would return 3rd row TODO:Consider renaming locationInY
        int ledPanelNumber = (absoluteLocation / xNumberOfLedsPerRow / yNumberOfRowsPerPanel); //4095 would return panel 15, 300 returns panel 1 TODO:Consider renaming to locationINZ 
        int ledVerticalRowNumber = (ledTotalRowNumber - (yNumberOfRowsPerPanel * ledPanelNumber)); //we need to know how high from the ground, not how many rows there are total
        int firstLedInRow = ((1 + ledVerticalRowNumber + ledPanelNumber * zNumberOfPanelsPerCube ) * yNumberOfRowsPerPanel - xNumberOfLedsPerRow);
    // debug("Led number " + absoluteLocation + " is in position " + (absoluteLocation - firstLedInRow) + " in a row");
    return (absoluteLocation - firstLedInRow);

    }

*/
    /* Pass the led object to the parent
       This allows the Cube to ask the Panel to ask the Row 
       for an exact led object
    /*
    
    LedObject getLedObjectForParent(int ledToFind)
    {
      // Take ledToFind as the absolute location in cube and
      // convert it to the led in the row


      // take the led in the row and return the object from anArrayOfRowLeds
      return anArrayOfRowLeds[absoluteLocationToPositionInRow(ledToFind)];
    }

    */ 
   
   public String toString()
  {
      //http://docs.oracle.com/javase/tutorial/java/IandI/objectclass.html
      return null;
  }
   
   
} // end class RowObject
