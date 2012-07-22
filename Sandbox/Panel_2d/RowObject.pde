
class RowObject
{

  LedObject[] anArrayOfRowLeds = new LedObject[xNumberOfLedsPerRow];// Create a new array of Leds for just this row (16 long)

  int rowCoordinateY;
  int rowCoordinateZ;
  
  RowObject(int rowCoordinateY, int rowCoordinateZ)
  {
          this.anArrayOfRowLeds = anArrayOfRowLeds;
      
          this.rowCoordinateY = rowCoordinateY;
          this.rowCoordinateZ = rowCoordinateZ;
      
      
          //TODO:This line is giving out of bounds exeption
          int firstLedInRow = relativeLedLocationToAbsolute(this.rowCoordinateY, this.rowCoordinateZ);  
        //  debug("firstledInrow " + firstLedInRow);
      
//          debug("Y : " + this.rowCoordinateY +" Z : " + this.rowCoordinateZ + " is led " + firstLedInRow);
      
	        // Create the led objects, add the lds to the array list, add the array list to the object
		for ( int ledNumberInRowCounter = 0; ledNumberInRowCounter < xNumberOfLedsPerRow; ledNumberInRowCounter++)
	        {
                  //  debug("ledNumberInRow " + ledNumberInRowCounter);
                    LedObject aLedObject16 = new LedObject( (firstLedInRow + ledNumberInRowCounter), 150, 0, ledSize); // Create led object ( (0-16), 255=black, 0 = brightness, ledsize=10)
//                    debug("created led object " + aLedObject16.getLedNumberInCube() + " With row index of " + aLedObject16.getLedNumberInRow() );
              
                   //Add the object to the class array.
                   this.anArrayOfRowLeds[ledNumberInRowCounter] = aLedObject16;
                   
                   int ledAbsoluteValue = relativeLedLocationToAbsolute(this.rowCoordinateY, this.rowCoordinateZ) + ledNumberInRowCounter;  // Convert this led to an absolute location
//                   debug( ledNumberInRowCounter  +" ledAbsoluteValue " + this.rowCoordinateY + " " + this.rowCoordinateZ + " " + " " +ledAbsoluteValue);
				   
                   aMasterArrayOfAllLeds[ledAbsoluteValue] = aLedObject16; // Add the led object to the master array aswell 
                   
                 }//end for loop create objects
  

  } //end constuctor



  //public void displayOneRow(int rowCoordinateY, int rowCoordinateZ)
  public void displayOneRow()
  {

        /*The ledInRowCounter is converted from the row[0,0] to a location in the array eg. 48, 64, 256...
         ledInRowCounter is 16 digits larger 63, 95, 255 
         */
        for (int ledInRowCounter = 0; ledInRowCounter < xNumberOfLedsPerRow; ledInRowCounter++ )
        {
    
              //  debug("Drawing led " + ledInRowCounter + " out of " + lastLedInRow);
              /*
                      Tips, avoid doing calulations with pixels as long as possible, instead use ratios. 
               Formula for locating position from left to right
               1. Get the number of divisions per screen.  16 panels of 16 leds / 2  -1 = 127 leds per screen width
               2. Get the start location by multiplying the Z panel number ([0-15) by 16 to get the starting row z0 starts at 0, z1 starts at 16, z15 starts at 112
               3. Shift all leds over 1/2 width to be inbetween lines instead of on top of them + (ledSize / 2)  
               4. 
               */

                      // /*127*/   int numberOfDivisionsPerScreen  = zNumberOfPanels * xNumberOfLedsPerRow /2 -1;//  debug("divisions per screen " + numberOfDivisionsPerScreen);
                      // /*13*/    int pixelsBetweenDivisions      = width / numberOfDivisionsPerScreen;//  debug("pixelsBetweenDivisons " + pixelsBetweenDivisions);
                      // /*48*/    int horizontalLedStartLocation  = this.rowCoordinateZ * xNumberOfLedsPerRow * pixelsBetweenDivisions;  //  debug("horizontalStartLocation " + horizontalLedStartLocation); 
                      // /*5px*/   int putLedsBetweenLines         = pixelsBetweenDivisions / 2; //  debug("ledSize " + ledSize /2);
                      //           int formulaResultOfFirstLine    = (putLedsBetweenLines + (horizontalLedStartLocation + (ledInRowCounter * pixelsBetweenDivisions)));              

                      //           int    verticalBuffer              = (height / 2) - (pixelsBetweenDivisions * yNumberOfRowsPerPanel);
                      //           int    verticalStartLocation       = ((height / 2) - verticalBuffer - (pixelsBetweenDivisions / 2));  
                      //           int    verticalRowStartLocation    = (verticalStartLocation - (pixelsBetweenDivisions * this.rowCoordinateY));   


                    //If panel is less than half of all panels draw on upper row, otherwise draw on bottom row
                    if(this.rowCoordinateZ < (zNumberOfPanels / 2)  )
                    {	
                      

                      /*127*/   int numberOfDivisionsPerScreen  = zNumberOfPanels * (xNumberOfLedsPerRow /2) -1;//  debug("divisions per screen " + numberOfDivisionsPerScreen);
                      /*13*/    int pixelsBetweenDivisions      = width / numberOfDivisionsPerScreen;//  debug("pixelsBetweenDivisons " + pixelsBetweenDivisions);
                      /*48*/    int horizontalLedStartLocation  = this.rowCoordinateZ * xNumberOfLedsPerRow * pixelsBetweenDivisions;  //  debug("horizontalStartLocation " + horizontalLedStartLocation); 
                      /*5px*/   int putLedsBetweenLines         = pixelsBetweenDivisions / 2; //  debug("ledSize " + ledSize /2);
                                int formulaResultOfFirstLine    = (putLedsBetweenLines + (horizontalLedStartLocation + (ledInRowCounter * pixelsBetweenDivisions)));              

                                                                       
                                int verticalBuffer              = ( (height / 2) - (pixelsBetweenDivisions * yNumberOfRowsPerPanel)  ) /2; //debug("verticalBuffer " + verticalBuffer);
                                //int verticalBuffer                =    width /  (xNumberOfLedsPerRow * (zNumberOfPanels/2));
                                int verticalStartLocation       = ( (height / 2) - verticalBuffer - (pixelsBetweenDivisions / 2)   );//  debug("height /2 " + height /2);
                                int verticalRowStartLocation    = (verticalStartLocation - (pixelsBetweenDivisions * this.rowCoordinateY)  ); // debug("verticalRowStartLocation " + verticalRowStartLocation + " verticalStartLocation" +verticalStartLocation); 
                                
                                
                        this.anArrayOfRowLeds[ledInRowCounter].displayOneLed( formulaResultOfFirstLine, verticalRowStartLocation );

                    }
                    else // draw lower division of panels
                    {

                      /*127*/   int numberOfDivisionsPerScreen  = zNumberOfPanels * (xNumberOfLedsPerRow / 2) -1;//  debug("divisions per screen " + numberOfDivisionsPerScreen);
                      /*13*/    int pixelsBetweenDivisions      = width / numberOfDivisionsPerScreen;//  debug("pixelsBetweenDivisons " + pixelsBetweenDivisions);
                      /*48*/    int horizontalLedStartLocation  = (this.rowCoordinateZ * xNumberOfLedsPerRow * pixelsBetweenDivisions) - (numberOfDivisionsPerScreen * pixelsBetweenDivisions) - pixelsBetweenDivisions ;  //  debug("horizontalStartLocation " + horizontalLedStartLocation); 
                      /*5px*/   int putLedsBetweenLines         = pixelsBetweenDivisions / 2; //  debug("ledSize " + ledSize /2);
                                int formulaResultOfBottomLine   = (putLedsBetweenLines + (horizontalLedStartLocation + (ledInRowCounter * pixelsBetweenDivisions)));              

                                int verticalBuffer              = ( (height /2 ) - (pixelsBetweenDivisions * yNumberOfRowsPerPanel)  )/ 2;
                                int verticalStartLocation       = ( (height ) - verticalBuffer - (pixelsBetweenDivisions / 2)  );  
                                int verticalRowStartLocation    = (verticalStartLocation - (pixelsBetweenDivisions * this.rowCoordinateY)  );   

                        this.anArrayOfRowLeds[ledInRowCounter].displayOneLed( formulaResultOfBottomLine, verticalRowStartLocation);
                    }		
						
						// debug("========================================");
						// debug("verticalBuffer " + verticalBuffer);
						// debug("verticalStartLocation " + verticalStartLocation);
						// debug("height / 2 " + height/2);
						// debug("pixelsBetweenDivisons " + pixelsBetweenDivisions);						
						// debug("verticalRowStartLocation " + verticalRowStartLocation);
      //                                           debug("========================================");
					 //        debug(" ");
						
      //         //Draw the led to the screen
      //         debug("Led counter = " + ledInRowCounter + " led value = " + this.anArrayOfRowLeds[ledInRowCounter].getLedNumberInCube() + " Draw at " + formulaResultOfFirstLine +" "+ verticalRowStartLocation);
              
              // this.anArrayOfRowLeds[ledInRowCounter].displayOneLed(formulaResultOfFirstLine, verticalRowStartLocation);


          //    debug(" ");
    }//end for loop
  }// end displayOneRow


  int absoluteLedLocationToRelativeY(int absoluteLocation)
  {
        //If the user passes in a number like 48 return the first half of row[3, 0]
        return absoluteLocation / xNumberOfLedsPerRow;
  }

  int absoluteLedLocationToRelativeZ(int absoluteLocation)
  {
        //If the user passes in a number like 48 return the second half of row[3,0]
        return absoluteLocation / xNumberOfLedsPerRow / yNumberOfRowsPerPanel;
  }


  int relativeLedLocationToAbsolute(int rowCoordinateY, int rowCoordinateZ )
  {
        //If the user passes in a number like [3,0] it returns 48. [1,1] returns   
        return (1 + rowCoordinateY + rowCoordinateZ * zNumberOfPanels ) * yNumberOfRowsPerPanel - xNumberOfLedsPerRow;
		
  }//end relativeLedLocationToAbsolute
  
  
} // end class RowObject

