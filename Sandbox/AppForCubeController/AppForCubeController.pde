import processing.serial.*;

  //Declare the Controller for the API but dont initiate it
  PhysicalCubeController aPhysicalController;
  AnimationOfSnapshots   theAnimationOfSnapshots;
  Serial                 theSerialPort;
  
  
  int xNumberOfLedsPerRow     = 16;
  int yNumberOfRowsPerPanel   = 16;
  int zNumberOfPanelsPerCube  = 16;

  int totalNumberOfLeds =  xNumberOfLedsPerRow * yNumberOfRowsPerPanel* zNumberOfPanelsPerCube ;
  
  boolean ledHasBeenClicked = false;
  int activeColor = 255;
  int ledSize = 10;
  
  int activeAnimation = 0;
  

  
 // List<LedObject> aMasterArrayOfAllLedsInAllCubes;

void setup()
{
  /* Create a new controller and devine which of its api's to use */
  //TODO: Prompt user for which to use
  aPhysicalController         = new PhysicalCubeController(new AdaptiveCube() );

  theAnimationOfSnapshots     = new AnimationOfSnapshots();
  
  // String theSerialPortNumber  = aPhysicalController.getSerialPortNumber();
  // int    theBaudRate          = aPhysicalController.getSerialBaudRate();
  
  // theSerialPort               = new Serial( this, theSerialPortNumber , theBaudRate);
  
  //aMasterArrayOfAllLedsInAllCubes = new ArrayList<LedObject>();
  
}// end setup

void mouseReleased()
{
 println("mousePressed");
 println("now on animation " + (activeAnimation + 1));
  theAnimationOfSnapshots.addNewCubeToAnimation();
            activeAnimation = activeAnimation + 1; 
}

void keyPressed()
{
  if ( key == 'd' )
  {
    println("Sending new animation to cube");
    
    CubeSnapshot currentlyDisplayedSnapshot = theAnimationOfSnapshots.getCubeFromAnimation(0);
    println("Got cube " + theAnimationOfSnapshots.getCubeFromAnimation(0) + " from array");
    CubeSnapshot snapshotToDisplay          = theAnimationOfSnapshots.getCubeFromAnimation(1);
    
    aPhysicalController.writeSnapshotToSerial( currentlyDisplayedSnapshot,  snapshotToDisplay );
  }

}



void draw()
{
  
}//end draw
  
