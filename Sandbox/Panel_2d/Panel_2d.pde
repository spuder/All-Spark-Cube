
//LedController aLedController;
RowObject row0000;
RowObject row1500;
RowObject row0100;
RowObject row0101;
RowObject row0200;
RowObject row0606;
RowObject row0303;

public LedObject[] aMasterArrayOfAllLeds;

color LedRed =  color(255, 0, 0);

public final int xNumberOfLedsPerRow = 16; // this is used in the ledController class to know how many leds to make 16 * yNumberOfRowsPerPanel * zNumberOfPanels
public final int yNumberOfRowsPerPanel = 16;
public final int zNumberOfPanels = 16;
public final int totalNumberOfLeds = xNumberOfLedsPerRow* yNumberOfRowsPerPanel * zNumberOfPanels;

public final int ledSize = 10;

boolean debugMode = true;



void setup()
{
  size(screen.width, screen.height/2);
  drawLines(); // Call the draw lines method
  aMasterArrayOfAllLeds = new LedObject[totalNumberOfLeds]; // Create new array containng the object and index of all 4096 leds. 

  debug("aMasterArrayOfAllLeds.length = " + aMasterArrayOfAllLeds.length);


  row0000 = new RowObject(0, 0); // y = height from ground z = distance from front of cube
  row0000.displayOneRow(0, 0);
  //    
  row0100 = new RowObject(1, 0);
  row0100.displayOneRow(1, 0);

  //    row0200 = new RowObject(2,0);
  //    row0200.displayOneRow(2,0);

  //    row0303 = new RowObject(3,3);
  //    row0303.displayOneRow(3,3);

  //    row0101 = new RowObject(1, 1);
  //    row0101.displayOneRow(1,1);
  //    
  //    row0606 = new RowObject(6,6);
  //    row0606.displayOneRow(6,6);
}


void draw()
{
}

void mousePressed()
{
  println("mouse pressed");
}


void debug(String aDebugMessage) 
{
  if (debugMode = true) 
  {
    println(aDebugMessage);
  }
}//end debug




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
      stroke (0); // Draw Black line
    }
    else
    {
      stroke(195);// all the rest of the lines are grey
    } 

    line(distanceBetweenLines, 0, distanceBetweenLines, height);
    noStroke();// Undo the color setting to prevent accidentially chaning another objects color
  }//end for loop


  //Horitzontal Line
  stroke(0);
  line(0, height/2, width, height/2);
  noStroke();
}//end drawLines

