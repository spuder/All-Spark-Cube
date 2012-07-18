
class RowObject
{

  // ArrayList<LedObject> arrayListOfLeds = new ArrayList<LedObject>(totalNumberOfLeds);
  LedObject[] arrayOfLeds = new LedObject[totalNumberOfLeds];

  // TODO: create methods to define how to search the row for an led


  RowObject(int[] rowCoordinates)
  {



    int rowCoordinateY = rowCoordinates[0]; // save the first coordinate as a local variable 
    int rowCoordinateZ = rowCoordinates[1];
    int firstLedInRow = (1 + rowCoordinateY + rowCoordinateZ * 16 )* 16 -16;  // if we are on row 3 (base 0), of panel 0 (front panel) then the firstLedInRow = 48
    int lastLedInRow = (1 + rowCoordinateY + rowCoordinateZ * 16 )* 16; // if we are on row 3 (base 0), of panel 0 (front panel) then the lastLedInRow = 63



    // Create the led objects, add the lds to the array list, add the array list to the object
    for ( int ledNumberInRow = 0; ledNumberInRow <= lastLedInRow ; ledNumberInRow++)
    {

      //int ledCordinates, color ledColor, float ledBrightness, int ledSize
      LedObject aLedObject = new LedObject(); // Create led object 
      aLedObject.setLedNumberInCube(firstLedInRow + ledNumberInRow); // set the led to 0 through 4096
      debug( "Created led " + aLedObject.getLedNumberInCube()  );
      debug ("Led Coordinate " + aLedObject.getLedNumberInCube() + " should equal " + (firstLedInRow + ledNumberInRow));
      aLedObject.setLedColor(LedRed);
      //   debug ("Led Color " + aLedObject.getLedColor() + " Should equal " + LedRed);


      // arrayListOfLeds.set(ledNumberInRow, aLedObject); // add all leds to array list 1 by 1



      arrayOfLeds[ aLedObject.getLedNumberInCube() ] = aLedObject; // examle, write led56 to arrary[56]
      debug("arrayOfLeds[" + aLedObject.getLedNumberInCube()  + "] " + (firstLedInRow + ledNumberInRow) );
    }







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
     
     //   Add each led object to that led list
     */







    /*
    * Itterate though all the leds (use the treemap created in the controller
     *   Set the object row = the current row
     *      If we arrive at a multiple of 16 then:
     *          - Create  Row object for the treemap
     *          - Set the row cordinate to the number 0-16  Treemap< row000,_____>
     *          - Add the previous 16 items to the new treemap Treemap< row000, (ledObject 000, ledObject 001) >
     *          - Set row to next iteration row001
     *          - Continue to get led objects without starting over (led 016, led 017
     */
  } //end constuctor



  public void displayOneRow()
  {


    fill(255);
    rect(10, 10, 10, 10 );
    noFill();
  }
} // end class RowObject

