import processing.opengl.*;

TwoDimentionViewFrame     theTwoDimentionViewFrame;
TwoDimentionViewApplet    theTwoDimentionViewApplet;
ThreeDimentionViewFrame   theThreeDimentionViewFrame;
ThreeDimentionViewApplet  theThreeDimentionViewApplet;



public static final int       xNumberOfLedsPerRow         = 16; // this is used in the ledController class to know how many leds to make 16 * yNumberOfRowsPerPanel * zNumberOfPanels
public        final int       yNumberOfRowsPerPanel       = 16;
public        final int       zNumberOfPanelsPerCube      = 16;
public        final int       totalNumberOfLeds = xNumberOfLedsPerRow * yNumberOfRowsPerPanel * zNumberOfPanelsPerCube;

//private             float   lastDrawTime;
public        boolean   ledHasBeenClicked    = false;  //This would be good to put in the led class but processing doesn't allow static fields in non static classes
// public static       boolean   ledHasBeenReleased   = true;
// public static       boolean   ledHasBeenDragged    = false;
 public              int       activeColor = #0000FF;                                                
public        final int       ledSize = 10; // TODO:Change this to be a ratio of the barsize and then apply it to the led object
public              int       activeAnimation = 0;



void setup()
{
    /* OPENGL cause the program to crash*/
    //size( 10,10, OPENGL );
    size( 10,10 );
    frame.setResizable( true );

 //Not sure what this does
 frame.addNotify();

    TwoDimentionViewFrame   theTwoDimentionViewFrame = new TwoDimentionViewFrame(); 
    ThreeDimentionViewFrame theThreeDimentionViewFrame = new ThreeDimentionViewFrame();
           theThreeDimentionViewFrame.setTitle("Second Frame");



  
}// end setup






void draw()
{
  theTwoDimentionViewApplet.redraw();
  theThreeDimentionViewApplet.redraw(); 
}//end draw
  

void mousePressed()
{
  frame.setVisible( false );
}
