//***************************************************************//
//  Name    : All Sparks Cube - 2d Panel                         //
//  Author  : Spencer Owen, Thomas Bennet                        //
//            All Rights Reserved                                //
//  Date    : 06 July, 2012                                      //
//  Version : 1.0                                                //
//  Notes   : Displays Graphical User interface to interact      //
//            with a 16 x 16 x 16 led cube                       //
//***************************************************************//

/* Create a cube object which encapsulates
   panels rows and leds */
CubeObject theCube;

public LedObject[] aMasterArrayOfAllLeds;


public              boolean debugMode = true;

public static final int     xNumberOfLedsPerRow         = 16; // this is used in the ledController class to know how many leds to make 16 * yNumberOfRowsPerPanel * zNumberOfPanels
public        final int     yNumberOfRowsPerPanel       = 16;
public        final int     zNumberOfPanelsPerCube      = 16;
public        final int     totalNumberOfLeds = xNumberOfLedsPerRow * yNumberOfRowsPerPanel * zNumberOfPanelsPerCube;

//private       final float   millisecondsBetweenDrawings = 1; //Set how often to draw all the objects on the screen. Once every couple dozen millisenconds is usally enough
private             float   lastDrawTime;
public static       boolean ledHasBeenClicked    = false;  //This would be good to put in the led class but processing doesn't allow static fields in non static classes
public static       boolean ledHasBeenReleased   = true;
public static       boolean ledHasBeenDragged    = false;
                                                //An alternative would be to convert it to java but for now this works. http://www.processing.org/discourse/beta/num_1263237645.html
public              int   activeColor = #0000FF;                                                
public        final int     ledSize = 10; // TODO:Change this to be a ratio of the barsize and then apply it to the led object


void setup()
{
  size( screen.width, screen.height/2 );
  frame.setResizable(true);             //Allows window to be resized. 
  frameRate(25);
  background(160);                      //Draw a grey background once. This will be over written later. 

  aMasterArrayOfAllLeds = new LedObject[totalNumberOfLeds]; // Create new array containing the object and index of all 4096 leds. 
  //text("Waiting 1000 miliseconds before updateing display", width/2- 100, height/2); // Expiramental code to test millisecondsBetweenDrawings feature for performance

  theCube = new CubeObject();

}//end setup


void draw()
{

  //Improve performance by not redrawing all the leds every clock cycle. Only draw fast enough to appear smooth
  
  //get the number of millisends since app started
  float currentMillisecond = millis();
//  if( currentMillisecond - lastDrawTime >= millisecondsBetweenDrawings)  //if the number of milliseconds is > 200 then draw lines
//  {
      // Fill the background with neutral grey
      background(160);
      // Draw divider lines
      drawLines();
      // Draw the actual leds
      drawCube();
      
      //reset lastdrawtime to now.
//      lastDrawTime = currentMillisecond;  
//  }// end if

}//end draw =================================


void mousePressed()
{
  
  ledHasBeenClicked = true; // set this global variable to true and update the led color respectivly
}//=====================================

void mouseReleased()
{

  ledHasBeenClicked = false;
}


void mouseDragged()
{
    
}

void keyPressed()
{
  if ( keyCode == CONTROL ) 
  {
    debug("CTRL Pressed");
    exportToFile();
//      if ( key == 's' || key == 'S' )
//      {
//        debug("S pressed");
//        //Pressing CTRL + S saves file
//        exportToFile();
//      }
  }
  if (key == 'i' || key == 'I' )
  {
    importFromFile();
  }
  
  if ( key == 'r' || key == 'R' ) // pressing r on keyboard sets color mode to red. all subsequent leds clicked will turn red. 
  {
      activeColor = #FF0000;
  }
  if ( key == 'g' || key == 'G' ) // pressing g on keyboard sets color mode to green. all subsequent leds clicked will turn green. 
  {
      activeColor = #00FF00;
  }
  if ( key == 'b' || key == 'B' )
  {
      activeColor = #0000FF;
  }
  if ( key == 'p' || key == 'P' )
  {
      activeColor = #FF00FF;
  }
  if ( key == 'o' || key == 'O' )
  {
      activeColor = #FF7D00;
  }
  if ( key == 'y' || key == 'Y' )
  {
      activeColor = #FFFF00;
  }
  if ( key == 'w' || key == 'W' )
  {
      activeColor = #FFFFFF;
  }
  if ( key == '0'  )
  {
      //Draw Grey
      activeColor = #969696;
  }
  
}//end keyPressed

//Reusable method to print out text only if debug is true
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
  for (int aLineCounter = 0; aLineCounter  <= ( xNumberOfLedsPerRow * ( zNumberOfPanelsPerCube / 2 ) )  ; aLineCounter++ )// TODO: rename this counter
  {
      // float anXLineVariable = (  8.2   * aLineCounter);
      float distanceBetweenLines = (    width /  (xNumberOfLedsPerRow * ( zNumberOfPanelsPerCube / 2 ) )    *  aLineCounter );
  
  
      //Vertical Lines
      if ( aLineCounter !=0 && aLineCounter % xNumberOfLedsPerRow == 0 ) 
      { 
        stroke (color(0)); // Draw Black line
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


void drawCube()
{
  theCube.displayOneCube();
}

void exportToFile()
{
      debug("Exporting to file");
      // Create a new thread to allow screen to continue to refresh  
     // while we open the file
    new Thread(
      //Create a new runnable class inside the thread
      new Runnable() 
          {
          // Call the runnable with the actual code to execute
          public void run()
          {      
              //Prompt user where to save file
              String locationOfFileToExport = selectOutput();
              
              //Verify the user did not click cancel
              if ( locationOfFileToExport == null )
              { println("No File Selected"); }
              else
              {
                  // Create aray of strings with 4096 spaces in it
                  String[] arrayOfLedsToExport = new String[totalNumberOfLeds];
                  
                    for( int ledToFileCounter = 0; ledToFileCounter < aMasterArrayOfAllLeds.length ; ledToFileCounter++ )
                    {
                      
                      String numberOfLed = aMasterArrayOfAllLeds[ledToFileCounter].getLedNumberInCube() + "";
                      String colorOfLed = aMasterArrayOfAllLeds[ledToFileCounter].getLedColor() + "";
                   
                      
                      arrayOfLedsToExport[ledToFileCounter] = ( numberOfLed +"\t"+ colorOfLed);
                      
                    }// end for ledToFileCounter
                    
                

                // Prompt the user for a file and save that location to a string
                // example = c:\someFile.txt   
                saveStrings( locationOfFileToExport, arrayOfLedsToExport);
                
              }//end if locationOfFileToExport = null
      
      
      
          }// end run()
          }//end Runnable
          ).start();
              
      
      

}//end exportToFile

void importFromFile()
{
 
 
   debug("Importing to file");
      // Create a new thread to allow screen to continue to refresh  
     // while we open the file
    new Thread(
      //Create a new runnable class inside the thread
      new Runnable() 
          {
          // Call the runnable with the actual code to execute
          public void run()
          {      
            
            
              // locationOfFileToImport example c:\someText.txt
              String locationOfFileToImport = selectInput();
              
              //Verify the user did not click cancel
              if ( locationOfFileToImport == null )
              { println("No file selected"); }
              else
              {
                  // Create aray of strings
                  // Add the file to the array
                  String[] arrayOfLedsToImport = loadStrings(locationOfFileToImport);

                  //Look at every character in the file
                  for( int fileToLedCounter = 0; fileToLedCounter < arrayOfLedsToImport.length ; fileToLedCounter++ )
                  {
                    
                        // Every time we encounter a space save the 
                        // preceding text to a single string
          	    	    String[] wordsSplitFromLines = split(arrayOfLedsToImport[ fileToLedCounter ],"\t");  // Split strings using " " as a delimeter
            	   
                        //Get the led number as a string 0 to 4096
                        //Convert it to a number 0-4096
                        int ledNumberInTextFile = int(wordsSplitFromLines[0]);
                        
                        //Get the led color saved as a string -650000
                        //convert it to an int
                        int ledColorInTextFile = int(wordsSplitFromLines[1]);
                        
                        //Lookup the led number that matches in the array
                        //and update the object attributes
                        aMasterArrayOfAllLeds[ledNumberInTextFile].setLedColor(ledColorInTextFile);
                    
                  }//end for fileToLedCounter
              
              }//end else
           }//end run()
          }//end Runnable()
    ).start();//end thread
    
}//end importFromFile()

