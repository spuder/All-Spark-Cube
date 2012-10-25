//Disabled OPENGL because it was running more slowly 
//import processing.opengl.*;

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
//CubeSnapshot theCube;


AnimationOfSnapshots theAnimation;

//This code should no longer be needed now that classes can pass to others
List<LedObject> aMasterArrayOfAllLedsInAllCubes;


public              boolean   debugMode = true;


public static final int       xNumberOfLedsPerRow         = 16; // this is used in the ledController class to know how many leds to make 16 * yNumberOfRowsPerPanel * zNumberOfPanels
public        final int       yNumberOfRowsPerPanel       = 16;
public        final int       zNumberOfPanelsPerCube      = 16;
public        final int       totalNumberOfLeds = xNumberOfLedsPerRow * yNumberOfRowsPerPanel * zNumberOfPanelsPerCube;

//private       final float   millisecondsBetweenDrawings = 1; //Set how often to draw all the objects on the screen. Once every couple dozen millisenconds is usally enough
//private             float   lastDrawTime;
public static       boolean   ledHasBeenClicked    = false;  //This would be good to put in the led class but processing doesn't allow static fields in non static classes
public static       boolean   ledHasBeenReleased   = true;
public static       boolean   ledHasBeenDragged    = false;
                                                //An alternative would be to convert it to java but for now this works. http://www.processing.org/discourse/beta/num_1263237645.html
public              int       activeColor = #0000FF;                                                
public        final int       ledSize = 10; // TODO:Change this to be a ratio of the barsize and then apply it to the led object
public              int       activeAnimation = 0;
Map<Integer, Integer> colorLookupTableByKey = new HashMap<Integer, Integer>(10);  // hashmap for colors of LEDs
Map<Integer, Integer> colorLookupTableByValue = new HashMap<Integer, Integer>(10);  // hashmap for colors of LEDs





void setup()
{
	// manually add Spencer's colors to Kevins values
	
	colorLookupTableByValue.put(0,-6908266); 		//Off
	colorLookupTableByValue.put(1,-65536); 		//Red
	colorLookupTableByValue.put(2,-16711936); 		//Green
	colorLookupTableByValue.put(3,-16776961); 		//Blue
	colorLookupTableByValue.put(4,-1); 			//White
	colorLookupTableByValue.put(5,-256); 			//Yellow
	colorLookupTableByValue.put(6,-65281); 			//Magenta
	//colorLookupTableByValue.put(7,); 			//Cyan
	colorLookupTableByValue.put(8,-33536); 			//Orange
	//colorLookupTableByValue.put(9,); 			//Purple
	
	colorLookupTableByKey.put(-6908266,0); 		//Off
	colorLookupTableByKey.put(-65536,1); 		//Red
	colorLookupTableByKey.put(-16711936,2); 		//Green
	colorLookupTableByKey.put(-16776961,3); 		//Blue
	colorLookupTableByKey.put(-1,4); 			//White
	colorLookupTableByKey.put(-256,5); 			//Yellow
	colorLookupTableByKey.put(-65281,6); 			//Magenta
	//colorLookupTableByKey.put(7); 			//Cyan
	colorLookupTableByKey.put(-33536,8); 			//Orange
	//colorLookupTabByKey.put(,9); 			//Purple
	
		
		
   //Disabled OPENGL because it was running more slowly //size( screen.width, screen.height/2 , OPENGL);
  size( screen.width, screen.height/2 );
   
    //Allows the panel to be resized, known to have some glitches
    frame.setResizable(true); 
    
    //Change the title bar text
    frame.setTitle("All Spark Cube");
    
    //Always start the panel in the bottom left, only works with opengl
    frame.setLocation(0, screen.height/2); 
    
    //Speed screen redraws
    //frameRate(60);
  //Draw a grey background once. This will be over written later.
  background(160);   
  
  aMasterArrayOfAllLedsInAllCubes = new ArrayList<LedObject>();
  //theCube = new CubeSnapshot`();
  //Create a collection of cubeSnapshots (aka animation)
  //TODO: This should only be made when we know wheter we are importing an existing or creating a new
  theAnimation = new AnimationOfSnapshots();

}//end setup


void draw()
{
      // Fill the background with neutral grey
      background(160);
      
      // Draw divider lines
      drawLines();
      
      // Draw the actual leds      
      drawAnimation();

}//end draw


void mousePressed()
{
  
    ledHasBeenClicked = true; // set this global variable to true and update the led color respectivly
}// end mousePressed

void mouseReleased()
{

  ledHasBeenClicked = false;
}// end mouseReleased


void mouseDragged()
{
    
}// end mouseDragged

void keyPressed()
{
  
  if (key == 'd' || key == 'D')
  {

    CubeSnapshot aTestObject = new CubeSnapshot();
    //aTestObject.getPanelThatContainsLed(4095);
    int testLedToFind = 350;


    debug("Led " + testLedToFind + "'s color is " + aTestObject.getLedObjectForParent(testLedToFind).getLedColor()+"\n");
  }

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
  if (keyCode == RIGHT)
  {
        //Pressing the right key moves to the next animation
        //in the sequence
        debug("activeAnimation is " + activeAnimation);

        //See if we are navigating to a new cube sequence or an existing one
        if (activeAnimation < theAnimation.getHighestCubeNumberInAnimation() )
        {
            debug("activeAnimation is " + activeAnimation + " NumberOfCubesInAnimation is " + theAnimation.getHighestCubeNumberInAnimation() );
            activeAnimation = activeAnimation + 1;
            debug("activeAnimation been changed to " + activeAnimation);
        }
        else 
        {
            theAnimation.addNewCubeToAnimation();
            activeAnimation = activeAnimation + 1;
            debug("created new cube in animation");
        }
        
      // Change the title bar from All Spark Cube to Animation x of x
      updateWindowTitle();

    }// end RIGHT
    
   if (keyCode == LEFT )
   {

       // See if we are at the first cube in sequnce
       // Prevent negative animations
       debug("Left key pressed");
       debug("activeAnimation is " + activeAnimation + "\n");

       if (activeAnimation >= 1)
       {
         activeAnimation = activeAnimation - 1;
         debug("Decreased activeAnimation by 1");
       }
       else
       {
          debug("Already at cube 0"); 
       }
    // Change the title bar from All Spark Cube to Animation x of x
    updateWindowTitle();
     
   }// end LEFT
    

   if (keyCode == ESC )
   { key=0;
   }
  
}//end keyPressed


//Reusable method to print out text only if debug is true
void debug(String aDebugMessage) 
{
  if (debugMode = true) 
  {
    println(aDebugMessage);
  }
}// end debug


void updateWindowTitle()
{
  frame.setTitle("Animation " + activeAnimation + " of " + theAnimation.getHighestCubeNumberInAnimation());
}// end updateWindowTitle


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


void drawAnimation()
{
  //Draw the cube to the screen
  //activeAnimation = the number in the animation, 0 - infinity
   theAnimation.displayOneAnimation(activeAnimation); 
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
          //~~~~~~~~~~~~~~~~~~~~~~~ Thread Creation ~~~~~~~~~~~~~~~~~~~~~~~~

              //Prompt user where to save file
              String locationOfFileToExport = selectOutput();
              
              //Verify the user did not click cancel
              if ( locationOfFileToExport == null )
              { println("No File Selected"); }
              else
              {
                debug("Exporting to " + locationOfFileToExport);
                // Create aray of strings with 4096 spaces in it
                String[] arrayOfCubesToExport = new String[ (theAnimation.getHighestCubeNumberInAnimation() + 1) * totalNumberOfLeds];
                debug(theAnimation.getHighestCubeNumberInAnimation() +" Text file will have "+(theAnimation.getHighestCubeNumberInAnimation() + 1) * totalNumberOfLeds +  " lines in it");
                
                /*
                For every cube in the cubearray in animation
                  for every led in cube array
                    get the cube number
                    get the led number
                    get the color
                    save to string
                */
                    // Look at all the leds in every cube
                    for( int cubeInAnimationCounter = 0; cubeInAnimationCounter <= theAnimation.getHighestCubeNumberInAnimation(); cubeInAnimationCounter++)
                    {
                        for( int ledInCubeCounter = 0; ledInCubeCounter <= totalNumberOfLeds - 1; ledInCubeCounter++ )
                        {
                          String cubeInAnimation = cubeInAnimationCounter + "";
                          String ledInCube       = ledInCubeCounter       + "";
						  String ledLocationX = theAnimation.anArrayOfCubeSnapshots.get(cubeInAnimationCounter).getLedObjectForParent(ledInCubeCounter).getLedNumberInRow()+"";
						  String ledLocationY = theAnimation.anArrayOfCubeSnapshots.get(cubeInAnimationCounter).getPanelThatContainsLed(ledInCubeCounter)+"";
						  //String ledLocationY = theAnimation.anArrayOfCubeSnapshots.get(cubeInAnimationCounter).getLedObjectForParent(ledInCubeCounter).getLedYPixelLocation()+""; getPanelCoordinate();

						  String ledLocationZ = theAnimation.anArrayOfCubeSnapshots.get(cubeInAnimationCounter).getPanelThatContainsLed(ledInCubeCounter)+"";
                         // String colorOfLed      = theAnimation.anArrayOfCubeSnapshots.get(cubeInAnimationCounter).getLedObjectForParent(ledInCubeCounter).getLedColor() + "";
						 println(colorLookupTableByKey.get(theAnimation.anArrayOfCubeSnapshots.get(cubeInAnimationCounter).getLedObjectForParent(ledInCubeCounter).getLedColor() + " = LED color after conversion"));

						  int colorOfLed      = colorLookupTableByKey.get(theAnimation.anArrayOfCubeSnapshots.get(cubeInAnimationCounter).getLedObjectForParent(ledInCubeCounter).getLedColor());
                          println(colorOfLed + " = LED color after conversion");
						  
						  //Cube#,Led#,Color
                          arrayOfCubesToExport[ (cubeInAnimationCounter * totalNumberOfLeds) + ledInCubeCounter ] = ( cubeInAnimation +"\t"+ ledLocationZ +"\t"+ ledLocationX +"\t"+ ledLocationY +"\t"+ colorOfLed );

                        }// end ledInCubeCounter

                    }// end cubeInAnimationCounter 
              /* There was additional Logic here, but should not be needed anymore, deleted 7/4/2012 0:12am*/
              
                //Save to file locationOfFileToExport example  "C:\someFile" 
                saveStrings( locationOfFileToExport, arrayOfCubesToExport);
                debug("Done Exporting to " + locationOfFileToExport);
                
              }//end if locationOfFileToExport = null
      

          //~~~~~~~~~~~~~~~~~~~~~~~ Thread Completion ~~~~~~~~~~~~~~~~~~~~~~~
      
          }// end run()
          }//end Runnable
          ).start();
              

}//end exportToFile

void importFromFile()
{
 
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
                 
                  //Deconstruct the object to the best ability of java
                  theAnimation = null;

                   /*
                   Create array of strings for every line in file✓
                   create array of strings for every word in line✓
                   Analyse the first word in line (the cube number in sequence)
                   Create a new Animation Object 
                   for every change in the first word of line
                       Create a new cube object
                       apply the second and 3rd lines to the cube object list of leds
                   */
                   
                   //Recreate the animation object
                   theAnimation = new AnimationOfSnapshots();

                   // Create aray of strings
                   // Add the file to the array
                   String[] arrayOfLedsToImport = loadStrings(locationOfFileToImport);
                   
                   //Look at every character in the file
                   debug("About to import " + arrayOfLedsToImport.length + " lines from " + locationOfFileToImport +"\n");

                   for( int fileToLedCounter = 0; fileToLedCounter < arrayOfLedsToImport.length ; fileToLedCounter++ )
                   {
                        // Every time we encounter a space save the 
                        // preceding text to a single string
         	    	String[] wordsSplitFromLines  = split(arrayOfLedsToImport[ fileToLedCounter ],"\t");  // Split strings using " " as a delimeter
                        
                        //Get the cube in animation sequence number
                        int cubeInAnimationInTextFile = int(wordsSplitFromLines[0]);
                        
                        //Get the led number as a string 0 to 4096 and convert to int
                        int ledNumberInTextFile       = int(wordsSplitFromLines[1]);
                        
                        //Get the led color saved as a string -650000 & convert to int
                        int ledColorInTextFile        = int(wordsSplitFromLines[2]);
                        
                        //See if first word is bigger than the number of objects we have
                        //debug(" the cubeInAnimationInTextFile is " + cubeInAnimationInTextFile + "theAnimation.getNumberOfCubesInAnimation() is " + theAnimation.getHighestCubeNumberInAnimation() + "\n");
                        if ( cubeInAnimationInTextFile > theAnimation.getHighestCubeNumberInAnimation() )
                        {
                            debug("Creating a new cube in animation");
                            theAnimation.addNewCubeToAnimation();
                        }
                        
                        //Get the cube object we are working with and add all the leds to it
                        theAnimation.anArrayOfCubeSnapshots.get(cubeInAnimationInTextFile).getLedObjectForParent(ledNumberInTextFile).setLedColor(ledColorInTextFile);
              

                   }//end for fileToLedCounter
                   
                 println("Imported " + arrayOfLedsToImport.length+ " lines from " + locationOfFileToImport);
                   //Change the name of the title bar to reflect the number of frames in sequence
                 updateWindowTitle();

               }//end else
               
               
            }//end run()
           }//end Runnable()
     ).start();//end thread
    
}//end importFromFile()


