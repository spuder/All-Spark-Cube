
class RowObject
{

  // ArrayList<LedObject> arrayListOfLeds = new ArrayList<LedObject>(totalNumberOfLeds);
  LedObject[] arrayOfLeds = new LedObject[totalNumberOfLeds];



  RowObject(int rowCoordinateY, int rowCoordinateZ)
  {
 
    //TODO:This should not have 1  + in front, right?
    int firstLedInRow = (1 + rowCoordinateY + rowCoordinateZ * 16 )* 16 -16;  // if we are on row 3 (base 0), of panel 0 (front panel) then the firstLedInRow = 48
    int lastLedInRow  = (1 + rowCoordinateY + rowCoordinateZ * 16 )* 16; // if we are on row 3 (base 0), of panel 0 (front panel) then the lastLedInRow = 63

    // Create the led objects, add the lds to the array list, add the array list to the object
    for ( int ledNumberInRow = 0; ledNumberInRow < lastLedInRow ; ledNumberInRow++)
    {


      LedObject aLedObject = new LedObject( (firstLedInRow + ledNumberInRow), 255, 0, ledSize); // Create led object ( (0-4095), 255=black, 0 = brightness, ledsize=10)



      arrayOfLeds[ aLedObject.getLedNumberInCube() ] = aLedObject; // examle, write led56 to arrary[56]

    }//end for loop create objects


    //Add the row cordinates to the object
    //this.rowCoordinates = rowCoordinates;

    /*Create an array list  ledArrayList[led000,led001] up to 16 characters in length
     Add 16 of those to the array list, (The array list won't allways start with led000. 
     
     If we are creating the row at y0 z0 then the array would include  [led0   -  led 15]
     If we are creating the row at y1 z0 then the array would include  [led16  -  led 31]
     If we are creating the row at y2 z0 then the array would include  [led32  -  led 47]
     If we are creating the row at y15 z0 then the array would include [led256 -  led 271]
     If we are creating the row at y0 z0 then the array would include  [led256 -  led 271]
     If we are creating the row at y0 z1 then the array would include  [led272 -  led 287]
     formula = (1 + y + z * 16 )* 16 -16  // Just so you know that took FOREVER!!! to figure out!!!!
     // the - 16 at the end is because we are using base 0

     15,0[ 240 - 255 ]16          

     4,0[  64 -  79 ]
     3,0[  48 -  63 ]4          3,1[ 304 - 319 ]19
     2,0[  32 -  47 ]3          2,1[ 288 - 303 ]18
     1,0[  16 -  31 ]2          1,1[ 272 - 287 ]17
     0,0[   0 -  15 ]1          0,1[ 256 - 271 ]16
 */
  } //end constuctor



  public void displayOneRow(int rowCoordinateY, int rowCoordinateZ)
  {

      //TODO: This code is repeated but it gives it 'least scope' is there a better way to implement it?
      int firstLedInRow = (1 + rowCoordinateY + rowCoordinateZ * 16 )* 16 -16;  // if we are on row 3 (base 0), of panel 0 (front panel) then the firstLedInRow = 48
      int lastLedInRow  = (1 + rowCoordinateY + rowCoordinateZ * 16 )* 16; // if we are on row 3 (base 0), of panel 0 (front panel) then the lastLedInRow = 63

    
      //Draw a line in between every led 
              for (int aTemporaryCounter = 0; aTemporaryCounter  <= (xNumberOfLeds * (zNumberOfPanels/2))  ; aTemporaryCounter++)// TODO: rename this counter
              {
                 // float anXLineVariable = (  8.2   *aTemporaryCounter);
                float distanceBetweenLines = (    width /  (xNumberOfLeds * (zNumberOfPanels/2) )    *  aTemporaryCounter);
          
          //      debug("The aXLineVariable is "  + distanceBetweenLines);
          //      debug("The iterator is "        + xNumberOfLeds * (zNumberOfPanels/2));
          //      debug("Atemporarycounter is "   +aTemporaryCounter);
          
                if (aTemporaryCounter !=0 && aTemporaryCounter % 16 == 0 ) // Draw 7 black lines
                { stroke (0);}
                else
                {stroke(195);} // all the rest of the lines are grey
                
                line(distanceBetweenLines, 0, distanceBetweenLines, height);
                noStroke();
          
              }//end for loop
    stroke(0);
    line(0, height/2, width, height/2);
    noStroke();

/**********************************
Draw each led from the specified row

***********************************/
  
            /*The ledInRowCounter is converted from the row[0,0] to a location in the array eg. 48, 64, 256...
            ledInRowCounter is 16 digits larger 63, 95, 255 
            */
            for (int ledInRowCounter = firstLedInRow; ledInRowCounter < lastLedInRow; ledInRowCounter++ )
           {
              
              debug("Drawing led " + ledInRowCounter + " out of " + lastLedInRow);
      
              //arrayOfLeds[ledInRowCounter].setLedColor(0); // turn all the leds black for testing
              
              /*
              Tips, avoid doing calulations with pixels as long as possible, instead use ratios. 
              Formula for locating position from left to right
              1. Get the number of divisions per screen.  16 panels of 16 leds / 2  -1 = 127 leds per screen width
              2. Get the start location by multiplying the Z panel number ([0-15) by 16 to get the starting row z0 starts at 0, z1 starts at 16, z15 starts at 112
              3. Shift all leds over 1/2 width to be inbetween lines + (ledSize / 2)  
              4. 
              */
    
    
    /*127*/   int numberOfDivisionsPerScreen = zNumberOfPanels * xNumberOfLeds /2 -1;                     debug("divisions per screen " + numberOfDivisionsPerScreen);
    /*13*/    int pixelsBetweenDivisions = width / numberOfDivisionsPerScreen;                            debug("pixelsBetweenDivisons " + pixelsBetweenDivisions);
    /*48*/    int horizontalLedStartLocation = rowCoordinateZ * xNumberOfLeds * pixelsBetweenDivisions;   debug("horizontalStartLocation " + horizontalLedStartLocation); 
    /*5px*/   float putLedsBetweenLines = ledSize / 2;                                                      debug("ledSize " + ledSize /2);
              int ledLocationInRow = getLedNumberInRow(ledInRowCounter);                                    debug(ledInRowCounter + " Translates to " + ledLocationInRow);
             
              int distanceBetweenLines = (    width /  (xNumberOfLeds * (zNumberOfPanels/2) )  );// this code is pulled from the other method, is it identical to pixelsBetweenDivisions?
              
              
              arrayOfLeds[ledInRowCounter].displayOneLed(putLedsBetweenLines+ (horizontalLedStartLocation + (ledLocationInRow * distanceBetweenLines)), 100);
    
    
              /*
              Broken Code
    
              int verticalBuffer = ((height/ 2 - 208) / 2 + ledSize/2); // = 32      debug("verticalBuffer "+verticalBuffer);
              
              int distanceBetweenLeds = (    width /  (xNumberOfLeds * (zNumberOfPanels/2) )    *  ledInRowCounter); debug("distance between leds "+distanceBetweenLeds);
    
              
              int compensateForDivideByO = width / (8 / (rowCoordinateY +1)); debug("dividby0 " + compensateForDivideByO);
              int placementLeftRight = (width / (8 / (rowCoordinateY +1) ) - compensateForDivideByO + ledSize/2 ); // must shift right then shift left or else divide by 0 error
    //           int placementLeftRight = (width / (8 / (rowCoordinateZ +1) )  + ledSize/2 ); // must shift right then shift left or else divide by 0 error
                      debug("placementleftright " + placementLeftRight);
    
              int placementUpDown = (height /2  - verticalBuffer - (rowCoordinateY * ledSize) ); debug("placementupdown " + placementUpDown);
              
              
              //displayOneLed(x location, y location)
              //arrayOfLeds[ledInRowCounter].displayOneLed(  placementLeftRight  + ( distanceBetweenLeds) , placementUpDown  - verticalBuffer - rowCoordinateZ * ledInRowCounter );
                arrayOfLeds[ledInRowCounter].displayOneLed(  placementLeftRight  + ( distanceBetweenLeds) , placementUpDown  - rowCoordinateZ * ledInRowCounter );
              //  debug("Drawing led " + ledInRowCounter);
              
              */
              debug(" ");
            }//end for loop
        
       
  }// end displayOneRow
  
  
  
  
        public int getLedNumberInRow(int ledNumberInCube)
        {
          //If you pass in a number such as 65 it would return 1 because led is the second led in row
          //Find first led in row
          //subtract firstLedInRow from ledNumberInCube
          //Subtract 1 for base 0
          
          int ledTotalRowNumber = ledNumberInCube/ 16; // 48 would return 3rd row TODO:Consider renaming locationInY
          int ledVertialRowNumber = ledTotalRowNumber / 16; //we need to know how high from the ground, not how many rows there are total
          int ledPanelNumber = ledNumberInCube /16 /16 ; //4095 would return panel 15, 300 returns panel 1 TODO:Consider renaming to locationINZ 
          
          int firstLedInRow  = (ledVertialRowNumber + ledPanelNumber * 16 )* 16; debug("firstledinRow " + firstLedInRow);
          //int firstLedInRow = ( ledRowNumber * ledPanelNumber ) ;           debug("firstLedInRow " + firstLedInRow);
          
          debug("ledNumberInRow "+ (ledNumberInCube - firstLedInRow) );
           return ledNumberInCube - firstLedInRow ;  
        }
  

} // end class RowObject

