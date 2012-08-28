import processing.serial.*;

//import java.util.ArrayList;
//import java.util.List;

//import processing.core.PApplet;
//import processing.serial.Serial;


//public class PresentTest 
//{

	public int frameInAnimation;
	public int previousFrameInAnimation;
	ArrayList<List<Integer>> aListOfAllSnapshots = new ArrayList<List<Integer>>();

        boolean debugMode = false;
		Serial aSerialPort;
  
        static int xNumberOfLedsPerRow 		= 16;
        static int yNumberOfRowsPerPanel 	= 16;
        static int zNumberOfPanelsPerCube 	= 16; 
	
	
	
	public void keyPressed()
	{
	  if (key == 'i' || key == 'I' )
	  {
		  //If we are reimporting the file, then reset the counters
		  frameInAnimation 			= 0;
		  previousFrameInAnimation  = 0;
		  importFromFile();
	  }
	}//end keyPressed()
	
	public void mouseReleased() 
	{
		  if(mouseButton == LEFT) 
		  {  debug("Left mouse pressed");
                     debug("previous frame is " + previousFrameInAnimation + "Setting to " + frameInAnimation);
                     	  previousFrameInAnimation = frameInAnimation;
			  frameInAnimation++;
			  diffCubes(frameInAnimation, previousFrameInAnimation);
		  }
		  if(mouseButton == RIGHT) 
		  {
			  //Make sure we aren't going to go negative numbers
			  if (frameInAnimation > 0)
			  {
				  previousFrameInAnimation = frameInAnimation;
				  frameInAnimation--;
				  diffCubes(frameInAnimation,previousFrameInAnimation);
			  }
			  else { debug("Already at frame 0 no previous frames");}
			  
		  }
		  
	}//end mouseReleased()
	
	
		
	public void setup()
	{
		size(screen.width, screen.height);
		println( Serial.list() );
		  // aSerialPort = new Serial(this, Serial.list()[0], 115200);
		   //http://forum.processing.org/topic/serial-library-in-eclipse
		   
		frameInAnimation 	= 0;
		previousFrameInAnimation = 0;
		
		importFromFile();
		
	}
	
	public void draw()
	{
		background(128);
		textSize(72);
		text(frameInAnimation+"", width/2, height/2, width/2, height/2);
	}
	
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
//	                  theAnimation = null;

	                   
	                   //Recreate the animation object
//	                   theAnimation = new AnimationOfSnapshots();

	                   // Create aray of strings
	                   // Add the file to the array
	                   String[] arrayOfLedsToImport = loadStrings( locationOfFileToImport );
	                   
	                   //Look at every character in the file
	                   debug("About to import " + arrayOfLedsToImport.length + " lines from " + locationOfFileToImport +"\n");

	                   for( int fileToLedCounter = 0; fileToLedCounter < arrayOfLedsToImport.length ; fileToLedCounter++ )
	                   {
	                        // Every time we encounter a space save the 
	                        // preceding text to a single string
	         	    	String[] wordsSplitFromLines  = split(arrayOfLedsToImport[ fileToLedCounter ],"\t");  // Split strings using " " as a delimeter
	                        
	                        //Get the cube in animation sequence number
	                        int cubeInAnimationInTextFile = Integer.parseInt( wordsSplitFromLines[0] );
	                        
	                        //Get the led number as a string 0 to 4096 and convert to int
	                        int ledNumberInTextFile       = Integer.parseInt( wordsSplitFromLines[1] );
	                        
	                        //Get the led color saved as a string -650000 & convert to int
	                        int ledColorInTextFile        = Integer.parseInt( wordsSplitFromLines[2] 	);
	                        
	                        //See if first word is bigger than the number of objects 	we have
	                        //debug(" the cubeInAnimationInTextFile is " + cubeInAnimationInTextFile + "theAnimation.getNumberOfCubesInAnimation() is " + theAnimation.getHighestCubeNumberInAnimation() + "\n");
                        
	                        //Get the cube object we are working with and add all the leds to it
	                       // theAnimation.anArrayOfCubeSnapshots.get(cubeInAnimationInTextFile).getLedObjectForParent(ledNumberInTextFile).setLedColor(ledColorInTextFile);
	              
	                        /*
	                         * If the cubeInAnimationInTextFile has changed, add a new arraylist to the arraylist
	                         */
//	                        println( "The array list index is " +( aListOfAllSnapshots.size() -1 )+ " the cubeInAnimationInTextFile is " + cubeInAnimationInTextFile);
//	                        println( " There are "+ aListOfAllSnapshots.size() + " snapshots currently " );
//	                        
	                        if( cubeInAnimationInTextFile == aListOfAllSnapshots.size() ) 
	                        {
	                        	//ArrayList<List<Integer>> aListOfColors = new ArrayList<List<Integer>>();
	                        	
	                        	//If we get to a new new cube number create a new arraylist and add it to the arraylist
	                        	aListOfAllSnapshots.add( new ArrayList<Integer>() );
	                        	debug("Parsing a new cube number, added a new arrayList, there are now " + aListOfAllSnapshots.size() + " snapshots");
	                        	
	                        }
	                        //Add the color to the inner array list 
	                        aListOfAllSnapshots.get(cubeInAnimationInTextFile).add(ledColorInTextFile);
//	                        println( "Added " + ledColorInTextFile + " to outer array index " + aListOfAllSnapshots.size() + " inner array index " + (aListOfAllSnapshots.get(cubeInAnimationInTextFile).size() -1));
	                        
	                        
//	                        println("");
	                   }//end for fileToLedCounter
	                   
//	                 println("Imported " + arrayOfLedsToImport.length+ " lines from " + locationOfFileToImport);
	                   //Change the name of the title bar to reflect the number of frames in sequence
	                // updateWindowTitle();
//	                 
//             		 println("Debug snapshot 0, led    2 has color of " + aListOfAllSnapshots.get(0).get(2) );
//	                 println("Debug snapshot 1, led    2 has color of " + aListOfAllSnapshots.get(1).get(2) );
//	                 println("Debug snapshot 0, led 4095 has color of " + aListOfAllSnapshots.get(0).get(4095) );
//	                 println("Debug snapshot 1, led 4095 has color of " + aListOfAllSnapshots.get(1	).get(4095) );
	               }//end else          
	            }//end run()
	           }//end Runnable()
	     ).start();//end thread  
	}//end importFromFile()

	void flattenArrayList(ArrayList<List<Integer>> aListOfLedsChanged)
	{

	  if ( aListOfLedsChanged.size() < 1 )
	  {
	    debug("Error: List of leds different between cubes is 0");
	  }
	  else if( aListOfLedsChanged.size() > 4096)
	  {
		  //TODO: BAD, BAD, BAD Programmer, no mountain dew for you, Had to hard code these values to meet deadline. 
	    debug("Error: Attempting to send " + aListOfLedsChanged.size() + " leds over serial, but cube is only "+ 4096 + " leds big");
	  }
	  else if( aListOfLedsChanged.size() > 127 )
	  {
	    //Split the arraylist into multiple byte arrays

	    

	  } 
	  else if( (aListOfLedsChanged.size() * 5) <= 127 )
	  {
	    debug("Creating byte array of size " + aListOfLedsChanged.size() );
	    byte[] byteArrayToSendViaSerial = new byte[ aListOfLedsChanged.size() * 5 + 2 ]; 
	    //Number of Leds to send will all fit in one buffer, how convenient. 
	    //Each led has 4 values, X-Y-Z-Color
	    //Convert to array of bytes, and return byte array so we can send over serial.

	    //For set Led the first 2 bytes will always be 11 and the message length
	    //Counter to keep track of where I am in byte array
	    int byteArrayLocationCounter = 0;
	    //unsigned char anUnsignedByte = (138);
	    int messageType = 11 + 128; //11 is the message type, add 128 for kevins sync bit. 
	    byte messageTypeConverted = (byte) messageType;
	    byteArrayToSendViaSerial[ byteArrayLocationCounter ] = messageTypeConverted; //subtract 256 because we need unsigned
	    //byteArrayToSendViaSerial[ byteArrayLocationCounter ] = byte( 11 + 128);
	    //byteArrayToSendViaSerial[ byteArrayLocationCounter ] = byte(anUnsignedByte);
	    byteArrayLocationCounter++;

	    byteArrayToSendViaSerial[ byteArrayLocationCounter ] = (byte) (aListOfLedsChanged.size() * 5) ;
	    byteArrayLocationCounter++;


	    //Flatten data from arrylist
	    for ( int outerArrayCounter = 0; outerArrayCounter < aListOfLedsChanged.size(); outerArrayCounter++ )
	    {

	        //println("in outter for loop, counter is " + outerArrayCounter);

	        int absoluteLedNumber = aListOfLedsChanged.get(outerArrayCounter).get(0);
	       // println("led changed " + outerArrayCounter + " led number is " +  aListOfLedsChanged.get( outerArrayCounter).get(0) );
	        //Get the led number convert to relative and save to byte array


	    // X value
	        byteArrayToSendViaSerial[ byteArrayLocationCounter ] = (byte) (LedAbsoluteToConverterClass.getLedNumberInRow(absoluteLedNumber) );
	        //  println("Led " + absoluteLedNumber + " is X: " + LedAbsoluteToConverterClass.getLedNumberInRow(absoluteLedNumber));
	          debug( (byte) ( LedAbsoluteToConverterClass.getLedNumberInRow(absoluteLedNumber ))  + " should match " + byteArrayToSendViaSerial[ byteArrayLocationCounter ] );
	        byteArrayLocationCounter++;

	    // Y value
	        byteArrayToSendViaSerial[ byteArrayLocationCounter ] = (byte) (LedAbsoluteToConverterClass.getLedRowNumberInPanel(absoluteLedNumber) );
	        //  println("Led " + absoluteLedNumber + " is Y: " + LedAbsoluteToConverterClass.getLedRowNumberInPanel(absoluteLedNumber));
	          debug( (byte) ( LedAbsoluteToConverterClass.getLedRowNumberInPanel(absoluteLedNumber ))  + " should match " + byteArrayToSendViaSerial[ byteArrayLocationCounter ] );
	        byteArrayLocationCounter++;

	    // Z value
	        byteArrayToSendViaSerial[ byteArrayLocationCounter ] = (byte) (LedAbsoluteToConverterClass.getPanelThatContainsLed(absoluteLedNumber) );
	        //  println("Led " + absoluteLedNumber + " is Y: " + LedAbsoluteToConverterClass.getPanelThatContainsLed(absoluteLedNumber));
	          debug( (byte) ( LedAbsoluteToConverterClass.getPanelThatContainsLed(absoluteLedNumber ))  + " should match " + byteArrayToSendViaSerial[ byteArrayLocationCounter ] );
	        byteArrayLocationCounter++;

	    // Color 
	        int ledColorInArrayList = aListOfLedsChanged.get(outerArrayCounter).get(1);
	        println("ledColorInArrayList = " + ledColorInArrayList);

	        int ledConverted = ColorConverterClass.intColorLookupTable( ledColorInArrayList );
	        println("ledConverted = " + ledConverted);
	        byteArrayToSendViaSerial[ byteArrayLocationCounter ] = (byte)(ledConverted);
	        byteArrayLocationCounter++;

	    // Message byte not yet needed
	        byteArrayToSendViaSerial [ byteArrayLocationCounter ] = 0;
	        byteArrayLocationCounter++;
	       
	    }// end for loop


	    println("");
	    print(" Array list is [ ");
	    for ( int byteArrayTroubleshootCounter = 0; byteArrayTroubleshootCounter < byteArrayToSendViaSerial.length; byteArrayTroubleshootCounter++ )
	    {
	        print( byteArrayToSendViaSerial[ byteArrayTroubleshootCounter ] + "," );
	    }
	    println(" ]");

	   
	  sendToSerial( byteArrayToSendViaSerial );
	  println("Should have Sent to serial port");
	  }//end if elseif elseif

	  
	}//end flattenArrayList

	void sendToSerial( byte[] byteArrayToSendViaSerial )
	{
	    aSerialPort.write( byteArrayToSendViaSerial );
	    println("Sent to serial port");
	}

	//Take 2 cube objects, if they have an led that is different, add its absolute index and color to the list
	//ArrayList<List<Integer>> aListOfLedsChanged( CubeSnapshot currentSnapshotToDiff , CubeSnapshot nextSnapshotToDiff )
	ArrayList<List<Integer>> diffCubes( int frameInAnimation , int previousFrameInAnimation ) 
	{
	  
	  ArrayList<List<Integer>> aListOfLedsChanged = new ArrayList<List<Integer>>();
	  debug("About to diff cubes");
	  
	  if (frameInAnimation != previousFrameInAnimation)
	  {
		  
	  
			  //Look at every led in two snapshots, only save the different ones
			  for (int ledInSnapshotCounter = 0; ledInSnapshotCounter < aListOfAllSnapshots.get(0).size(); ledInSnapshotCounter++ )
			  {
                            debug("ledInSnapshotCounter is " + ledInSnapshotCounter);
				  
				  //Example: Compare led 0 of snapshot 0 to led 0 of snapshot 1, if they are different, add to new array
//BAD BAD Programmer! You are doing a string compare because you coundt compare unsigned ints. very expensive
				  if ( !( aListOfAllSnapshots.get(frameInAnimation).get(ledInSnapshotCounter)+"").equals(aListOfAllSnapshots.get(previousFrameInAnimation).get(ledInSnapshotCounter) +""))
  				  //if ( aListOfAllSnapshots.get(frameInAnimation).get(ledInSnapshotCounter).equals(aListOfAllSnapshots.get(previousFrameInAnimation).get(ledInSnapshotCounter) ))
                                  {
                                    
					  debug( "frameInAnimation = " + aListOfAllSnapshots.get(frameInAnimation).get(ledInSnapshotCounter) + 
                                                  " previousFrameInAnimation = " + aListOfAllSnapshots.get(previousFrameInAnimation).get(ledInSnapshotCounter) + " Aparently arent the same" );

					  int ledNumber = ledInSnapshotCounter;
					  int ledColor = aListOfAllSnapshots.get(frameInAnimation).get(ledInSnapshotCounter);
					  
                                          debug("About to create new inner array at " +(aListOfLedsChanged.size()) );
					  //Create a new inner array

					  aListOfLedsChanged.add( new ArrayList<Integer>() );//Add the led number to index 0 of the inner array

                                          debug("About to add ledNumber " +ledNumber + " to outer array " + frameInAnimation);
                                          debug("The last index in list of leds changed is " + (aListOfLedsChanged.size() - 1) );
					  
                                          //Add the led number and led color to an inner array
                                          //The outer array is the cube snapshot
                                          
					  aListOfLedsChanged.get( aListOfLedsChanged.size() - 1 ).add( ledNumber );//Add the led color to index 1 of the inner array
					  aListOfLedsChanged.get( aListOfLedsChanged.size() - 1 ).add( ledColor );


                                   }
			  }//end for
debug(aListOfLedsChanged.size() +" leds were changed between "+  frameInAnimation + " and " + previousFrameInAnimation);
debug("");
debug(" aListOfLedsChanged[");
for(int debugNewArrayCounter = 0; debugNewArrayCounter < aListOfLedsChanged.size(); debugNewArrayCounter++)
{
 debug(aListOfLedsChanged.get(debugNewArrayCounter).get(0) + " , "  + aListOfLedsChanged.get(debugNewArrayCounter).get(1) + " , " );
}
debug("]");
debug("");  				  
			  	
//			  		 println("no leds changed");
//			  	 
//			  		 println("Debug aListOfLedsChanged [0] has led and color " + aListOfLedsChanged.get(0).get(0) + ", " +aListOfLedsChanged.get(0).get(1));
//			  		 println("Debug aListOfLedsChanged [1] has led and color " + aListOfLedsChanged.get(1).get(0) + ", " +aListOfLedsChanged.get(1).get(1));
//			  	 
//				 
//					 println("Debug aListOfLedsChanged [2] has led and color " + aListOfLedsChanged.get(2).get(0) + ", " +aListOfLedsChanged.get(2).get(1));
//				 
				 
	  }
	  else
	  {
		  //First time the program is run, there is no previous snapshot, just draw the entire snapshot out
		  debug("The snapshots to diff, actually are the same, returning the complete snapshot");
		  
		  //TODO:Save the snapshot to a new array
	  }

	  /*
	  
	  
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
	            //Add new row to 2d array list
	            aListOfLedsChanged.add( new ArrayList<Integer>() );

	            //Get the arraylist we just added, it should be the last one
	            //TODO:This is risky code, should check to see if null / empty
	            int currentPositionInOuterArrayList = aListOfLedsChanged.size() - 1 ;

	            //debug( "currentPositionInOuterArrayList = " + currentPositionInOuterArrayList );

	              //Add the led number to the inner arraylist
	              aListOfLedsChanged.get(currentPositionInOuterArrayList).add(nextLedNumber);

	              //Add the color to the inner arrayList
	              println("added color to arraylist " + nextCubeLedValue );
	            aListOfLedsChanged.get(currentPositionInOuterArrayList).add(nextCubeLedValue);
	            
	          }

	  }
	  // if (aListOfLedsChanged.size() > (totalNumberOfLeds / 2 ) )
	  // {
	  //   //TODO: If we are changing more tha 50% of the cube, it is faster to clear it and write new values
	  //   println("We have changed more than half the leds, better to just rewrite");
	  // }
*/
	  debug("Diff has updated " + aListOfLedsChanged.size() + " leds");

	  return aListOfLedsChanged;


	}// end aListOfLedsChanged

void debug(String aDebugMessage) 
{
  if (debugMode = true) 
  {
    println(aDebugMessage);
  }
}// end debug



//	public static void main(String[] args) 
//	{
//		PApplet.main(new String[] {"--present", "PresentTest"});
//
//	}

//}

