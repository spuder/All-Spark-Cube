
public class RowController 
{


  //These are inherited by the child class
  //=====================================
  int[] rowCoordinates; //example 00, 01   

  TreeMap treeMapOfRows = new TreeMap();

//TODO: I am tired ,do I really need to add the row objects to the treemap or are they already uniquily identifiable?


  //default constructor
  RowController() {
  }


  //Create the number of rows specifed by the parent a cube has 16 panels, a panel has 16 rows, a row has 16 leds
  RowController(int yNumberOfRows ) // in all my tests this will be 16
  {
     //Create a bunch of row objects (256 objects) that have the id [0,0] through [15,15]
     
     //for loop to create 256 row objects
     for (int yRowIterator = 0; yRowIterator < yNumberOfRows; yRowIterator ++ )
       {
           for (int zRowIterator = 0; zRowIterator < zNumberOfPanels; zRowIterator ++)
           {
             rowCoordinates = new int[2] ;
             rowCoordinates[0] = yRowIterator;
             rowCoordinates[1] = zRowIterator;
             
             RowObject aRowObject = new RowObject(rowCoordinates);
             
             //Add row object to treemap 
             
           }
           
         
       }
       
  }// end RowController Constructor
    


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

