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




void setup()
{
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


    CubeSnapshot aTestObject = theAnimation.getCubeFromAnimation(0);
    //aTestObject.getPanelThatContainsLed(4095);
    
    CubeSnapshot aNewFakeCube = theAnimation.getCubeFromAnimation(1);
    TreeMap<Integer, Integer> aListOfLedsChanged = diffCubeSnapshots(aNewFakeCube, aTestObject);
    sendDiffToSerial( aListOfLedsChanged );


    debug("Led " + aListOfLedsChanged.get(0) + "'s color is " + aListOfLedsChanged.get(0) +"\n");

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
        //If we are looking at the last cube in the sequence, create a new cube 
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
                          String colorOfLed      = theAnimation.anArrayOfCubeSnapshots.get(cubeInAnimationCounter).getLedObjectForParent(ledInCubeCounter).getLedColor() + "";
                          
                          arrayOfCubesToExport[ (cubeInAnimationCounter * totalNumberOfLeds) + ledInCubeCounter ] = ( cubeInAnimation +"\t"+ ledInCube +"\t"+ colorOfLed);

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


//Take 2 cube objects, if they have an led that is different, add its absolute index and color to the list
TreeMap<Integer, Integer> diffCubeSnapshots(CubeSnapshot currentSnapshotToDiff , CubeSnapshot nextSnapshotToDiff)
{
  TreeMap<Integer, Integer> aListOfLedsChanged = new TreeMap<Integer, Integer>();
  debug("About to diff cubes");
  //Get color value from led 000 in cube 1 and cube 1
  //If color is different, save cube 2 color to arrayList
  println("Led0 in current is " + currentSnapshotToDiff.getLedObjectForParent(0).getLedColor() );
  println("Led0 in next is "    + nextSnapshotToDiff.getLedObjectForParent(0).getLedColor() );

  //Loop through all of the new leds, if they are not equal to the current led, save the new one
  for (int countOfAllLedsInCube = 0; countOfAllLedsInCube < totalNumberOfLeds; countOfAllLedsInCube++)
  {
    //Get the current cube color and the next led color
    int currentCubeLedValue = currentSnapshotToDiff.getLedObjectForParent( countOfAllLedsInCube ).getLedColor();
    int nextCubeLedValue    = nextSnapshotToDiff.getLedObjectForParent( countOfAllLedsInCube ).getLedColor();

    //We think we already know the led number because of the for loop, but just to be sure actually go get
    //the led and verify its name is what we think it is. Obsessive and paranoid? Yes. 
    int nextLedNumber       = nextSnapshotToDiff.getLedObjectForParent( countOfAllLedsInCube ).getLedNumberInCube();
      
      //If the new cube led is different then the new one, then save it to the array
      if (nextCubeLedValue != currentCubeLedValue ) 
      {
        aListOfLedsChanged.put(nextLedNumber, nextCubeLedValue);
      }
  }
  if (aListOfLedsChanged.size() > (totalNumberOfLeds / 2 ) )
  {
    //TODO: If we are changing more tha 50% of the cube, it is faster to clear it and write new values
    println("We have changed more than half the leds, better to just rewrite");
  }

  debug("Diff has updated " + aListOfLedsChanged.size() + " leds");

  return aListOfLedsChanged;


}// end diffCubeSnapshots

//Take a TreeMap of all the leds to update, Split into bytes, and send to arduino. 
//*****TODO: This code needs to be moved to the AllSpark API, not all cubes take the data in the
//same format. This code is put here to meet a deadline. 
void sendDiffToSerial(TreeMap<Integer, Integer> diffCubeSnapshots)
{
  //Take array list, get the length
  //if the length is longer than the cube supports then
  //split it into multiple arrays of bytes
  //This is a little tricky http://stackoverflow.com/questions/5618978/convert-arrayliststring-to-byte


  if ( diffCubeSnapshots.size() <1 )
  {
    debug("Error: List of leds different between cubes is 0");
  }
  else if( diffCubeSnapshots.size() > totalNumberOfLeds)
  {
    debug("Error: Attempting to send " + diffCubeSnapshots.size() + " leds over serial, but cube is only "+ totalNumberOfLeds + " leds big");
  }
  else if( diffCubeSnapshots.size() > 127 )
  {
    //Split the treemap into multiple byte arrays

  } 
  else if( (diffCubeSnapshots.size() * 4) <= 127 )
  {
    debug("Creating byte array of size " + diffCubeSnapshots.size() );
    byte[] byteArrayToSendViaSerial = new byte[ diffCubeSnapshots.size() ]; 
    //Number of Leds to send will all fit in one buffer, how convenient. 
    //Each led has 4 values, X-Y-Z-Color
    //Convert to array of bytes, and send over serial.


    //http://stackoverflow.com/questions/1318980/how-to-iterate-over-a-treemap
    //http://www.java2s.com/Code/JavaAPI/java.util/TreeMapentrySet.htm
    //http://code.google.com/p/processing/issues/detail?id=880
    //Known issues with processing and hashmap entrysets, must use iterator instead

    //Set<Map.Entry<Integer, Integer>> set = diffCubeSnapshots.entrySet();

    //For set Led the first 2 bytes will always be 11 and the message length
    byteArrayToSendViaSerial[0] = byte( 11 );
    byteArrayToSendViaSerial[1] = byte( diffCubeSnapshots.size() * 4 );

    Iterator i = diffCubeSnapshots.entrySet().iterator(); 
    int indexInMap = 1;
    while ( i.hasNext() ) 
    {
      
      Map.Entry me = (Map.Entry)i.next();
      
      //move to index 3 in array
      indexInMap ++;
      //Get the led then convert it to its x value
      //This is bad code, should be in its own reusalbe class, must cut corner for delivery date, 
      //This is only acceptable because it is sandbox code. 
      int currentLed = me.getKey();
    int ledTotalRowNumber = (currentLed / xNumberOfLedsPerRow); // 48 would return 3rd row TODO:Consider renaming locationInY
    int ledPanelNumber    = (me.getKey() / xNumberOfLedsPerRow / yNumberOfRowsPerPanel); //4095 would return panel 15, 300 returns panel 1 TODO:Consider renaming to locationINZ 
    int ledVerticalRowNumber = (ledTotalRowNumber - (yNumberOfRowsPerPanel * ledPanelNumber)); //we need to know how high from the ground, not how many rows there are total
    int firstLedInRow     = ((1 + ledVerticalRowNumber + ledPanelNumber * zNumberOfPanelsPerCube ) * yNumberOfRowsPerPanel - xNumberOfLedsPerRow);
    

      byteArrayToSendViaSerial[ indexInMap ] = me.getKey() - firstLedInRow ; 

      indexInMap ++;
      //Get the led then convert it to its y value
      byteArrayToSendViaSerial[ indexInMap ] = me.getKey() ;

      indexInMap ++;
       //Get the led then convert it to its z value
      byteArrayToSendViaSerial[ indexInMap ] = me.getKey() ;


      print(me.getKey() + " is ");
      println(me.getValue());


      indexInMap ++;
    }

    // for (Map.Entry<Integer, Integer> me : diffCubeSnapshots.entrySet() ) {
    // Integer key  = me.getKey();
    // Integer value = me.getValue();

    // }

  }//end if elseif elseif

}//end sendDiffToSerial


