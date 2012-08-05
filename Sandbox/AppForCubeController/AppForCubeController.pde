import processing.serial.*;

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
  //aPhysicalController         = new PhysicalCubeController();

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
    
    CubeSnapshot currentCube = theAnimationOfSnapshots.getCubeFromAnimation(0);
    CubeSnapshot cubeToDraw = theAnimationOfSnapshots.getCubeFromAnimation(1);
    
   //aPhysicalController.writeSnapshotToSerial(currentCube, cubeToDraw);
  }
}



void draw()
{
  
}//end draw
  
