
RowObject row0000;
RowObject row1500;
RowObject row0100;
RowObject row0101;
RowObject row0200;
RowObject row0606;
RowObject row0303;
RowObject row0500;
RowObject row0304;
RowObject row0001;
RowObject row0009;

RowObject aReusableRowObject;


public LedObject[] aMasterArrayOfAllLeds;

color LedRed =  color(255, 0, 0);

public static final int xNumberOfLedsPerRow  = 8; // this is used in the ledController class to know how many leds to make 16 * yNumberOfRowsPerPanel * zNumberOfPanels
public final int yNumberOfRowsPerPanel       = 8;
public final int zNumberOfPanels             = 8;
public final int totalNumberOfLeds = xNumberOfLedsPerRow* yNumberOfRowsPerPanel * zNumberOfPanels;

// Change this to be a ratio of the barsize
public final int ledSize = 10;

boolean debugMode = true;


void setup()
{
  size(screen.width, screen.height/2);
  frame.setResizable(true);
  background(160);
  drawLines(); // Call the draw lines method
  aMasterArrayOfAllLeds = new LedObject[totalNumberOfLeds +5]; // Create new array containng the object and index of all 4096 leds. 

  debug("aMasterArrayOfAllLeds.length = " + aMasterArrayOfAllLeds.length);
  debug("totalNumberOfLeds " + totalNumberOfLeds);

//  for(int createABunchOfRowsCounterZ = 0; createABunchOfRowsCounterZ < zNumberOfPanels; createABunchOfRowsCounterZ++)
//  {
//      for(int createABunchOfRowsCounterY = 0; createABunchOfRowsCounterY < yNumberOfRowsPerPanel; createABunchOfRowsCounterY++)
//      {
//        aReusableRowObject = new RowObject(createABunchOfRowsCounterY, createABunchOfRowsCounterZ);
//        
//        aReusableRowObject.displayOneRow();
//        aReusableRowObject = null;
//      }
//  }

  row0000 = new RowObject(0, 0); // y = height from ground z = distance from front of cube
  row0000.displayOneRow();
  debug("row 0000 = " + row0000.relativeLedLocationToAbsolute(0,0));
  // int relativeLedLocationToAbsolute(int rowCoordinateY, int rowCoordinateZ )
  //    
//  row0100 = new RowObject(1, 0);
//  row0100.displayOneRow();
//  debug("row 0100 = " + row0100.relativeLedLocationToAbsolute(1,0));
//
//  row0200 = new RowObject(2,0);
//  row0200.displayOneRow();
//  debug("row 0200 = " + row0200.relativeLedLocationToAbsolute(2,0));
//
//  row0303 = new RowObject(3,3);
//  row0303.displayOneRow();
//  debug("row 0303 = " + row0303.relativeLedLocationToAbsolute(3,3));
//  
//  row0500 = new RowObject(15,0);
//  row0500.displayOneRow();
//  debug("row 0500 = " + row0000.relativeLedLocationToAbsolute(5,0));
//  
//  row0304 = new RowObject(3,4);
//  row0304.displayOneRow();
//  debug("row 0304 = " + row0304.relativeLedLocationToAbsolute(3,4));
//  
//  row0001 = new RowObject(15,15);
//  row0001.displayOneRow();
//  debug("row 0001 = " + row0001.relativeLedLocationToAbsolute(0,1));
//
//  row0606 = new RowObject(6,6);
//  row0606.displayOneRow();
//  debug("row 0606 = " + row0606.relativeLedLocationToAbsolute(6,6));
//  
//  
//  
//  row0009 = new RowObject(0,9);
//  row0009.displayOneRow();  
//  debug("row 0009 = " + row0009.relativeLedLocationToAbsolute(9,9));
  
}


void draw()
{
  
  /************************************************************************************
    NON PRODUCTION CODE, PROVES CONCEPT BUT HAS MEMORY LEAK. JAVA VIRTUAL MACHINE CANT
    DELETE THE OBJECTS AS FAST AS THEY ARE CREATED
  
  *************************************************************************************/
  drawLines();
    for(int createABunchOfRowsCounterZ = 0; createABunchOfRowsCounterZ < zNumberOfPanels; createABunchOfRowsCounterZ++)
  {
      for(int createABunchOfRowsCounterY = 0; createABunchOfRowsCounterY < yNumberOfRowsPerPanel; createABunchOfRowsCounterY++)
      {
aReusableRowObject = new RowObject(createABunchOfRowsCounterY, createABunchOfRowsCounterZ);
        aReusableRowObject.displayOneRow();
        aReusableRowObject = null;
      }
  }
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
}//end drawLines

