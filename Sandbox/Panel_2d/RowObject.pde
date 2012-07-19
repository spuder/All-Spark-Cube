
class RowObject
{

  // ArrayList<LedObject> arrayListOfLeds = new ArrayList<LedObject>(totalNumberOfLeds);
  LedObject[] arrayOfLeds = new LedObject[totalNumberOfLeds];

  // TODO: create methods to define how to search the row for an led


  RowObject(int rowCoordinateY, int rowCoordinateZ)
  {

    int firstLedInRow = (1 + rowCoordinateY + rowCoordinateZ * 16 )* 16 -16;  // if we are on row 3 (base 0), of panel 0 (front panel) then the firstLedInRow = 48
    int lastLedInRow  = (1 + rowCoordinateY + rowCoordinateZ * 16 )* 16; // if we are on row 3 (base 0), of panel 0 (front panel) then the lastLedInRow = 63



    /*

     */

    // Create the led objects, add the lds to the array list, add the array list to the object
    for ( int ledNumberInRow = 0; ledNumberInRow < lastLedInRow ; ledNumberInRow++)
    {


      LedObject aLedObject = new LedObject( (firstLedInRow + ledNumberInRow), 255, 0, ledSize); // Create led object ( (0-4095), 255=black, 0 = brightness, ledsize=10)

      //aLedObject.setLedNumberInCube(); // set the led to 0 through 4096
      debug( "Created led " + aLedObject.getLedNumberInCube()  );
      //debug ("Led Coordinate " + aLedObject.getLedNumberInCube() + " should equal " + (firstLedInRow + ledNumberInRow));

      arrayOfLeds[ aLedObject.getLedNumberInCube() ] = aLedObject; // examle, write led56 to arrary[56]
      debug("arrayOfLeds[" + aLedObject.getLedNumberInCube()  + "] " + (firstLedInRow + ledNumberInRow) );
      debug("length of array " + arrayOfLeds.length );
      debug(" ");
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



  public void displayOneRow(int rowCoordinateY, int rowCoordinateZ)
  {

    //TODO: This code is repeated but it gives it least scope is there a better way to implement it?
    int firstLedInRow = (1 + rowCoordinateY + rowCoordinateZ * 16 )* 16 -16;  // if we are on row 3 (base 0), of panel 0 (front panel) then the firstLedInRow = 48
    int lastLedInRow  = (1 + rowCoordinateY + rowCoordinateZ * 16 )* 16; // if we are on row 3 (base 0), of panel 0 (front panel) then the lastLedInRow = 63
  
//    int rectangleXCoordinates = (width/2 / (zNumberOfPanels /2) )  ;
//    int rectangleYCoordinate = height /2 - (ledSize * 2);

    debug("xNumberOfLeds = " + xNumberOfLeds);

    //Draw a line in between every led 
    //Number of leds in a row * how many panels /2 (because we are split screening) + 2 buffers for each panel
    //  ( xNumberOfLeds
    for (int aTemporaryCounter = 0; aTemporaryCounter  <= (xNumberOfLeds * (zNumberOfPanels/2))  ; aTemporaryCounter++)// TODO: rename this counter
    {
       // float anXLineVariable = (  8.2   *aTemporaryCounter);
      float distanceBetweenLines = (    width /  (xNumberOfLeds * (zNumberOfPanels/2) )    *  aTemporaryCounter);

      debug("The aXLineVariable is " + distanceBetweenLines);
      debug("The iterator is" + xNumberOfLeds * (zNumberOfPanels/2));
      debug("Atemporarycounter is " +aTemporaryCounter);

      stroke(195);
      line(distanceBetweenLines, 0, distanceBetweenLines, height);
      noStroke();



      //If  aTemporaryCounter divisible by 8 (number of panels /2) then draw black vertical line otherwise light grey

    }
    


    //These are last so they dont get drawn over
    stroke(0);
    line(0, height/2, width, height/2 ); // a line for layout purposes. // not going to change so outside loop
    line(width / (zNumberOfPanels/2) * 1, 0, width/(zNumberOfPanels/2) * 1, height);
    line(width / (zNumberOfPanels/2) * 2, 0, width/(zNumberOfPanels/2) * 2, height);
    line(width / (zNumberOfPanels/2) * 3, 0, width/(zNumberOfPanels/2) * 3, height);
    line(width / (zNumberOfPanels/2) * 4, 0, width/(zNumberOfPanels/2) * 4, height);
    line(width / (zNumberOfPanels/2) * 5, 0, width/(zNumberOfPanels/2) * 5, height);
    line(width / (zNumberOfPanels/2) * 6, 0, width/(zNumberOfPanels/2) * 6, height);
    line(width / (zNumberOfPanels/2) * 7, 0, width/(zNumberOfPanels/2) * 7, height);
    noStroke();




//    fill(255);
//    rectMode(CENTER);
//    rect(rectangleXCoordinates, rectangleYCoordinate, 50, 50 );
//    noFill();


/**********************************
Draw each led from the specified row

***********************************/

        for (int ledInRowCounter = firstLedInRow; ledInRowCounter < lastLedInRow; ledInRowCounter++ )
        {
    
          //Draw the leds that are only part of the row // example row[0,0] draws 0-15 leds
          
          //If row = 0,0 then draw led 0 at pixels 13, led 2 at pixels 16
          //If row = 1,1 then draw led 0 at pixel 210
    
          arrayOfLeds[ledInRowCounter].setLedColor(0); // turn all the leds black for testing
          
          
          
          /*
          Convert the panel number to a pixel on screen
          */
          
          //1680 / (8 / 3) =  panel 3
          //(width / (8 / rowCoordinateZ)) // this is the formula but cant divide by 0 !!!
          
          int compensateForDivideByO = width / (8 / (rowCoordinateZ +1));
          int formulaForRowPlacement = (width / (8 / (rowCoordinateZ +1) ) - compensateForDivideByO + ledSize/2 ); // must shift right then shift left or else divide by 0 error
          int distanceBetweenLeds = (    width /  (xNumberOfLeds * (zNumberOfPanels/2) )    * ledInRowCounter);

          int formulaForColumnPlacement = (height /2  );
          int verticalBuffer = ((height/ 2 - 208) / 2 + ledSize/2);
          
          arrayOfLeds[ledInRowCounter].displayOneLed(  formulaForRowPlacement  + ( distanceBetweenLeds), formulaForColumnPlacement  - verticalBuffer - rowCoordinateZ* ledInRowCounter );
          //  debug("Drawing led " + ledInRowCounter);
        }
        
        
        
    
  }// end displayOneRow
  
  
  
  
} // end class RowObject

