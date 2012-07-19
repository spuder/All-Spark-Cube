

//LedController aLedController;
RowObject row01;

color LedRed =  color(255, 0, 0);

public final int xNumberOfLeds = 16; // this is used in the ledController class to know how many leds to make 16 * yNumberOfRows * zNumberOfPanels
public final int yNumberOfRows = 16;
public final int zNumberOfPanels = 16;
public final int totalNumberOfLeds = xNumberOfLeds* yNumberOfRows * zNumberOfPanels;

public final int ledSize = 10;

boolean debugMode = true;

/*
Creating a row makes led objects 

*/

  void setup()
  {
    size(screen.width, 600);
    //int ledCordinates, color ledColor, float ledBrightness, int ledSize
    //  aLed = new LedObject(000, LedRed, 255, 10);
  
 //   aLedController = new LedController( xNumberOfLeds, yNumberOfRows, zNumberOfPanels ); 
  //  aRowController = new RowController( yNumberOfRows, zNumberOfPanels);
  }


  void draw()
  {
  
    
  }

  void mousePressed()
  {
    println("mouse pressed");
 //    aLedController.displayAllLeds();
    //aLedController.displayAllLeds().displayOneLed();
    //aRowController.displayOneRow();
//    aRowController.displayAllRows();


    row01 = new RowObject(0, 0); // y = hight from ground z = distance from front of cube
   // aRowObject2 = new RowObject(coordinate1);
  }


  void debug(String aDebugMessage) 
  {
       if (debugMode = true) 
       {
           println(aDebugMessage);
       }
  }
  
