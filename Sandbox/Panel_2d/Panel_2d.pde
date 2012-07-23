
RowObject row0000;
RowObject row0100;
RowObject row0101;
//RowObject row0200;
//RowObject row0606;
//RowObject row0303;
//RowObject row0500;
//RowObject row0304;
//RowObject row0001;
//RowObject row0009;

RowObject aReusableRowObject;


public LedObject[] aMasterArrayOfAllLeds;

color LedRed =  color(255, 0, 0);

public static final int xNumberOfLedsPerRow         = 16; // this is used in the ledController class to know how many leds to make 16 * yNumberOfRowsPerPanel * zNumberOfPanels
public        final int yNumberOfRowsPerPanel       = 16;
public        final int zNumberOfPanels             = 16;
public        final int totalNumberOfLeds = xNumberOfLedsPerRow* yNumberOfRowsPerPanel * zNumberOfPanels;
private       final float millisecondsBetweenDrawings = 10; //Set how often to draw all the objects on the screen. Once every couple dozen millisenconds is usally enough
private             float lastDrawTime;


// TODO:Change this to be a ratio of the barsize and then apply it to the led object
public final int ledSize = 10;

boolean debugMode = true;


void setup()
{
  size(screen.width, screen.height/2);
  frame.setResizable(true);
  background(160);

  aMasterArrayOfAllLeds = new LedObject[totalNumberOfLeds +5]; // Create new array containng the object and index of all 4096 leds. 
  text("Waiting 1000 miliseconds before updateing display", width/2- 100, height/2); 
  
row0000 = new RowObject( 0, 0 );
row0100 = new RowObject( 1, 0 );
row0101 = new RowObject( 1, 1 );
  


  
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
      drawRows();
      lastDrawTime = currentMillisecond;  //reset lastdrawtime to now.
  }

}//end draw =================================


void mousePressed()
{
  println("x: " + mouseX + " y: " + mouseY );
  
  debug("Led 0 color is" + aMasterArrayOfAllLeds[0].getLedColor());
 
  
}//=====================================

void keyPressed()
{
   if (key == 'd')
  {
/*
Bug this is only temporarily modifying the object. How is that possible?? */

    debug("led 0 color is : " +     aMasterArrayOfAllLeds[0].getLedColor());

   debug("setting led0 to 100"); 
    aMasterArrayOfAllLeds[0].setLedColor(    aMasterArrayOfAllLeds[0].getLedColor() +5 );
    debug("led 0 color is now: " +     aMasterArrayOfAllLeds[0].getLedColor());
  }
}

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


void drawRows()
{
  
 row0000.displayOneRow();
 row0100.displayOneRow();
 row0101.displayOneRow();
  //*******************
  //This code is very poor and should not be used. It creates duplicate objects
  //*******************
//  for(int createABunchOfRowsCounterZ = 0; createABunchOfRowsCounterZ < zNumberOfPanels; createABunchOfRowsCounterZ++)
//  {
//      for(int createABunchOfRowsCounterY = 0; createABunchOfRowsCounterY < yNumberOfRowsPerPanel; createABunchOfRowsCounterY++)
//      {
//        aReusableRowObject = new RowObject(createABunchOfRowsCounterY, createABunchOfRowsCounterZ);
//        
//        aReusableRowObject.displayOneRow();
//        aReusableRowObject = null; //defrence the object since it is no longer needed. The java garbage collector will eventually find it. 
//      }
//  }
  System.gc(); // Calls the garbage collector. There is a lot of debate if you should actually do this
}//end drawRows============================================================================
