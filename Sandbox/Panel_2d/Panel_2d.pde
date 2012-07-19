

//LedController aLedController;
RowObject row0000;
RowObject row1500;
RowObject row0100;
RowObject row0101;
RowObject row0200;



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


    
//   row0000 = new RowObject(0, 0); // y = height from ground z = distance from front of cube
//    row0000.displayOneRow(0,0);
    
    row0100 = new RowObject(1, 0);
    row0100.displayOneRow(1,0);
    
    row0200 = new RowObject(2,0);
    row0200.displayOneRow(2,0);
    
//    row0101 = new RowObject(0, 1);
//    row0101.displayOneRow(0,1);
    
//    row1500 = new RowObject(3, 3);
//    row1500.displayOneRow(3,3);
    

   // aRowObject2 = new RowObject(coordinate1);
  }


  void debug(String aDebugMessage) 
  {
       if (debugMode = true) 
       {
           println(aDebugMessage);
       }
  }
  
