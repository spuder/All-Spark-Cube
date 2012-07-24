
//RowObject row0000;
//RowObject row0100;
//RowObject row0101;
//RowObject row0200;
//RowObject row0606;
//RowObject row0303;
//RowObject row0500;
//RowObject row0304;
//RowObject row0001;
//RowObject row0009;

PanelObject panel1;
PanelObject panel2;

//RowObject aReusableRowObject;

public LedObject[] aMasterArrayOfAllLeds;


public              boolean debugMode = true;

public static final int     xNumberOfLedsPerRow         = 16; // this is used in the ledController class to know how many leds to make 16 * yNumberOfRowsPerPanel * zNumberOfPanels
public        final int     yNumberOfRowsPerPanel       = 16;
public        final int     zNumberOfPanels             = 16;
public        final int     totalNumberOfLeds = xNumberOfLedsPerRow* yNumberOfRowsPerPanel * zNumberOfPanels;

private       final float   millisecondsBetweenDrawings = 20; //Set how often to draw all the objects on the screen. Once every couple dozen millisenconds is usally enough
private             float   lastDrawTime;
public static       boolean ledHasBeenClicked;  //This would be good to put in the led class but processing doesn't allow static fields in non static classes
                                                //An alternative would be to convert it to java but for now this works. http://www.processing.org/discourse/beta/num_1263237645.html
public              color   activeColor = color( 204, 153, 0 );                                                
public        final int     ledSize = 10; // TODO:Change this to be a ratio of the barsize and then apply it to the led object


void setup()
{
  size( screen.width, screen.height/2 );
  frame.setResizable(true);             //Allows window to be resized. 
  background(160);                      //Draw a grey background once. This will be over written later. 

  aMasterArrayOfAllLeds = new LedObject[totalNumberOfLeds +5]; // Create new array containing the object and index of all 4096 leds. 
  text("Waiting 1000 miliseconds before updateing display", width/2- 100, height/2); // Expiramental code to test millisecondsBetweenDrawings feature for performance
  
  
  panel1 = new PanelObject(0);
  panel2 = new PanelObject(1);
//row0000 = new RowObject( 0, 0 );
//row0100 = new RowObject( 1, 0 );
//row0101 = new RowObject( 1, 1 );
//  


  
}


void draw()
{

  //Improve performance by not redrawing all the leds every clock cycle. Only draw fast enough to appear smooth
  
  //get the number of millisends since app started
  float currentMillisecond = millis();
  if( currentMillisecond - lastDrawTime >= millisecondsBetweenDrawings)  //if the number of milliseconds is > 200 then draw lines
  {
      background(160);
      drawLines();
      drawPanels();
      //drawRows();
      
      //reset lastdrawtime to now.
      lastDrawTime = currentMillisecond;  
  }

}//end draw =================================


void mousePressed()
{
  ledHasBeenClicked = true; // set this global variable to true and update the led color respectivly
  
}//=====================================

void keyPressed()
{
   if (key == 'd')
  {

      debug("led 0 color is : " +     aMasterArrayOfAllLeds[0].getLedColor());
      debug("setting led0 to 100"); 
      aMasterArrayOfAllLeds[0].setLedColor(    aMasterArrayOfAllLeds[0].getLedColor() +5 );
      debug("led 0 color is now: " +     aMasterArrayOfAllLeds[0].getLedColor());
  }
  
  if ( key == 'r' || key == 'R' ) // pressing r on keyboard sets color mode to red. all subsequent leds clicked will turn red. 
  {
      activeColor = color( 255, 0, 0);
  }
  if ( key == 'g' || key == 'G' ) // pressing g on keyboard sets color mode to green. all subsequent leds clicked will turn green. 
  {
      activeColor = color( 0, 255, 0);
  }
  if ( key == 'b' || key == 'B' )
  {
      activeColor = color( 0, 0, 255 );
  }
  if ( key == 'p' || key == 'P' )
  {
      activeColor = color( 255, 0, 255 );
  }
  if ( key == 'o' || key == 'O' )
  {
      activeColor = color( 255, 125, 0 );
  }
  if ( key == 'y' || key == 'Y' )
  {
      activeColor = color( 255, 255, 0);
  }
  if ( key == 'w' || key == 'W' )
  {
      activeColor = color( 255, 255, 255);
  }
  if ( key == '0'  )
  {
      activeColor = color( 150);
  }
  
  
}//

void debug(String aDebugMessage) 
{
  if (debugMode = true) 
  {
    println(aDebugMessage);
  }
}//end debug================================




void drawLines()
{
  //Draw a line in between every led 
  for (int aTemporaryCounter = 0; aTemporaryCounter  <= (xNumberOfLedsPerRow * (zNumberOfPanels/2))  ; aTemporaryCounter++)// TODO: rename this counter
  {
      // float anXLineVariable = (  8.2   *aTemporaryCounter);
      float distanceBetweenLines = (    width /  (xNumberOfLedsPerRow * (zNumberOfPanels/2) )    *  aTemporaryCounter);
  
  
      //Vertical Lines
      if (aTemporaryCounter !=0 && aTemporaryCounter % xNumberOfLedsPerRow == 0 ) 
      { 
        stroke (color(#000000)); // Draw Black line
      }
      else
      {
        stroke(152);// all the rest of the lines are grey
      } 
  
      line(distanceBetweenLines, 0, distanceBetweenLines, height);
      noStroke();// Undo the color setting to prevent accidentially chaning another objects color
  }//end for loop

  //Horitzontal Line
  stroke(0);
  line(0, height/2, width, height/2);
  noStroke();
}//end drawLines=============================================================================



void drawPanels()
{
  panel1.displayOnePanel();
  panel2.displayOnePanel();
}//end drawPanels============================================================================
