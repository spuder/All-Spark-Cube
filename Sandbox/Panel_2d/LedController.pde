
public class LedController 
{


  //These are inherited by the child class
  //=====================================
  int   ledCoordinates; //example 000, 001 
  color ledColor;       //example red, green, blue, (255,0,0)
  float ledBrightness;  //example 0 - 4096 it will be divisable so it is a float
  int   ledSize;  

  //TreeMap treeMapOfLeds = new TreeMap();
  ArrayList<LedObject> arrayListOfLeds = new ArrayList(totalNumberOfLeds);


  LedController() {
  }


  //Create the number of leds specifed by the parent
  LedController(int xNumberOfLeds, int yNumberOfRows, int zNumberOfPanels )//TODO: verify that these names are ok, because they are duplicates of globa;
  {


        for ( int numberOfLedsToCreateCounter = 0; numberOfLedsToCreateCounter <= totalNumberOfLeds ; numberOfLedsToCreateCounter++)
        {
    
          //int ledCordinates, color ledColor, float ledBrightness, int ledSize
          LedObject aLedObject = new LedObject(ledCoordinates, ledColor, ledBrightness, ledSize);
          aLedObject.setLedCoordinates(numberOfLedsToCreateCounter); // set the led to 000 through 16
          aLedObject.setLedColor(LedRed);
    
    
//          debug("The object coordinate will be the key in map " + aLedObject.getLedCoordinates() ); //Send this to the debug method
//          String treeMapKey = aLedObject.getLedCoordinates() + ""; // the cordinate will be the key in the treemap 000
//          debug("got the coordinate " + treeMapKey);//send this text to the debug method
//          treeMapOfLeds.put(treeMapKey, aLedObject);
          arrayListOfLeds.add(numberOfLedsToCreateCounter, aLedObject); // add all leds to array list 1 by 1
          
        }
        
      
      
  }// end LedController


  

  void displayAllLeds()
  {

       //debug( treeMapOfLeds.size() + "");
       debug( arrayListOfLeds.size() + " items in array list");

      //for (int displayAllLedsIterator = 0; displayAllLedsIterator < treeMapOfLeds.size() -1 ; displayAllLedsIterator++ )
       for (int displayAllLedsIterator = 0; displayAllLedsIterator < arrayListOfLeds.size() -1 ; displayAllLedsIterator++ )


        {
        //Recreate the object from the hashmap
        //LedObject aTemporaryLed = (LedObject ) treeMapOfLeds.get(displayAllLedsIterator+""); //Notice that (LedObject) is required to get object from hashmap
        LedObject aTemporaryLed = (LedObject ) arrayListOfLeds.get(displayAllLedsIterator); //Notice that (LedObject) is required to get object from hashmap

  
        aTemporaryLed.displayOneLed( 30+ displayAllLedsIterator * 100 /4, 40  ); // new object call method displayOneLed,( x location, y location)
        
      } //end for loop to display all leds
      
  } //end displayAllLeds
  
  
  
} // end class LedObjects

