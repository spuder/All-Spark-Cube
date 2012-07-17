
public class RowController 
{


  //These are inherited by the child class
  //=====================================
  int   rowCoordinates; //example 00, 01  This is different then a LedCoordinate variable because it is less specific.  

  TreeMap treeMapOfRows = new TreeMap();


  //default constructor
  RowController() {
  }


  //Create the number of rows specifed by the parent a cube has 16 panels, a panel has 16 rows, a row has 16 leds
  RowController(int yNumberOfRows ) // in all my tests this will be 16
  {
  
    
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
      

//      for ( int numberOfRowsToCreateItterator = 0; numberOfRowsToCreateItterator <= yNumberOfRows ; numberOfRowsToCreateItterator++) 
//      {
//  
//        //int ledCordinates, color ledColor, float ledBrightness, int ledSize
//        RowObject aRowObject = new RowObject(rowCoordinates);
//        aRowObject.setRowCoordinates(numberOfLedsToCreateItterator); // set the led to 000 through 16
//       
//  
//  
//        debug("The object coordinate will be the key in map " + aLedObject.getLedCoordinates() ); //Send this to the debug method
//        String treeMapKey = aLedObject.getLedCoordinates() + ""; // the cordinate will be the key in the treemap 000
//        debug("got the coordinate " + treeMapKey);//send this text to the debug method
//        treeMapOfLeds.put(treeMapKey, aLedObject);
//      }
//  }// end LedController




//  void displayAllLeds()
//  {
//
//       debug( treeMapOfLeds.size() + "");
//
//      for (int displayAllLedsIterator = 0; displayAllLedsIterator < treeMapOfLeds.size() -1 ; displayAllLedsIterator++ )
//      {
//        //Recreate the object from the hashmap
//        LedObject aTemporaryLed = (LedObject ) treeMapOfLeds.get(displayAllLedsIterator+""); //Notice that (LedObject) is required to get object from hashmap
//  
//  
//        aTemporaryLed.displayOneLed( 30+ displayAllLedsIterator * 100 /4, 40  ); // new object call method displayOneLed,( x location, y location)
//        
//      } //end for loop to display all leds
//      
//  } //end displayAllLeds
//  
  
  
} // end class RowController

