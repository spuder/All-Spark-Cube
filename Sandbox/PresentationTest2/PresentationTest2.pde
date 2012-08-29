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
			  splitArray( 32, flattenArrayList( diffCubes(frameInAnimation, previousFrameInAnimation)));
		  }
		  if(mouseButton == RIGHT) 
		  {
			  //Make sure we aren't going to go negative numbers
			  if (frameInAnimation > 0)
			  {
				  previousFrameInAnimation = frameInAnimation;
				  frameInAnimation--;
				  splitArray( 32, flattenArrayList( diffCubes(frameInAnimation,previousFrameInAnimation)));
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

ArrayList<Integer> flattenArrayList(ArrayList<List<Integer>> aListOfLedsChanged)
{
	ArrayList<Integer> aFlattenedArrayList = new ArrayList<Integer>();
	//Loop through outter array list 
	for( int locationInOutterArrayList = 0; locationInOutterArrayList < aListOfLedsChanged.size(); locationInOutterArrayList++ )
	{
		//Loop through inner array list
		for ( int locationInInnerArray =0; locationInInnerArray < aListOfLedsChanged.get(locationInOutterArrayList).size(); locationInInnerArray++)
		{
			//Add each item in multidimentional array to new array
			aFlattenedArrayList.add( aListOfLedsChanged.get(locationInOutterArrayList).get(locationInInnerArray) );
		}
	}

	println("MD Array [0][0] should be equal New array[0], Does 4 = " + aListOfLedsChanged.get(0).get(0) + " = " +aFlattenedArrayList.get(0) + " ?");
	println("MD Array [0][1] should be equal New array[1], Does 1 = " + aListOfLedsChanged.get(0).get(1) + " = " +aFlattenedArrayList.get(1) + " ?");
	println("MD Array [1][0] should be equal New array[2], Does 6 = " + aListOfLedsChanged.get(1).get(0) + " = " +aFlattenedArrayList.get(2) + " ?");
	
	return aFlattenedArrayList;

}//end flattenArrayList()


void splitArray( int sizeToSplitTo, ArrayList<Integer> aFlattenedArrayList )
{
println("Called splitArray method");
	
		println("about to create a new array that we will reuseover and over of 32 bytes");
	byte[] aSplitArray = new byte[32];

	//create a speical array for the parts that wont fit in 32 byte array, this will change every time
	//Example 52 - (30 * (52 / int(30) )
	int numberOfFullByteArrays  = aFlattenedArrayList.size() / sizeToSplitTo; 
		println("numberOfFullByteArrays is " + numberOfFullByteArrays);

	int bytesInShortArray 		= aFlattenedArrayList.size() - ( (sizeToSplitTo -2 ) * numberOfFullByteArrays );
		println("bytesInShortArray is " + bytesInShortArray);
	
	//If the Array length is not divisible by 30, you will have one short array
	//Add 2 for the message headers
	byte[] theShortArray = new byte[ bytesInShortArray + 2];
		println("Created theShortArray of length " + theShortArray.length );

	//Counter for inside arrays
	int locationIn32byteArray = 2;
	int locationInShortArray = 2;


	//Take flattened arrayList and itterate through it
	for(int counterInFlattenedArrayList = 0; counterInFlattenedArrayList < aFlattenedArrayList.size(); counterInFlattenedArrayList++)
	{

		/*Decision Tree
				Normal Array [32]------------------- Small Array[<32]
				/			\							/			\
		At End 	----------- not at end 				At End ------------- Not at End 
		add byte 			send to serial 			add byte 			 send to serial
		Increment counter 	reset coutner 			Increment coutner 	 reset counter
							purge array 								purge array
		*/
		//Leave first 2 bytes blank for message headers
		//Look ahead and see if there are 32 bytes left in the arraylist
		//If there are not 32 bytes left then add data to special array
		//If there are 32 bytes left then add data to new array
			//If we have reached the end of the special array or the end of normal array, send to 
			//..serial and dump array

	//If we are on the small array
		//if( counterInFlattenedArrayList > aFlattenedArrayList.size()  - bytesInShortArray )
		if( counterInFlattenedArrayList >= numberOfFullByteArrays * (sizeToSplitTo - 2) )				
		{
			// Derive a counter 
			// 52 - 31 - 22 = -1
			// Since we are counting from the end of the array, the number will be negative
			// Invert it to a positive and you will have the correct counter every time
			//int locationInShortArray = Math.abs( aFlattenedArrayList.size() - counterInFlattenedArrayList - bytesInShortArray ) ;
				//println("locationInShortArray is " + locationInShortArray);

		//If Not at end of short array
							//println("why wont locationInShortArray exceede aFlattenedArrayList.size() ? " +(locationInShortArray + bytesInShortArray)+ " " +  aFlattenedArrayList.size()	);	

				// if( locationInShortArray < theShortArray.length )
				// {
					println("counterInFlattenedArrayList = " + counterInFlattenedArrayList);
					//Add the led in the flattened array to the shorteded array
					int intToByte = aFlattenedArrayList.get( counterInFlattenedArrayList );
					theShortArray[ locationInShortArray ] = (byte)intToByte;
							println("Added intToByte " + intToByte + " to index " +locationInShortArray + " of the short array");
					//Increment counter
					locationInShortArray++;
							println("");
							println("locationInShortArray = " + locationInShortArray);

				// }
		//If at end of short array
				//else if (locationInShortArray >= aFlattenedArrayList.size() || locationInShortArray >= counterInFlattenedArrayList) 
				//else if (locationInShortArray == theShortArray.length ) 
				if (locationInShortArray == theShortArray.length ) 
				{
					println("At end of short array");
					//Prepend array
					theShortArray[0] = (byte)138;
					int theShortArrayLength = theShortArray.length;
					theShortArray[1] = (byte)theShortArrayLength;

					//Send to serial
					aSerialPort.write( theShortArray );
						println("***********Sent short to serial port***********");
						println( theShortArray );	
					//Reset counter
						locationInShortArray = 2;
					//Purge Array
						Arrays.fill(theShortArray, byte(0) ); // not nessesary
				}
				// else
				// {
				// 	println("Error: This code should be unreachable, locatinInArray is in limbo");
				// }
		

		}
	//If we are on the normal 32 byte array
		else
		{
			
		//If Not at end of normal array
			//println("");
			//println("sizeToSplitTo = " + (sizeToSplitTo - 2)) ;
			// if ( locationIn32byteArray < sizeToSplitTo   ) 
			// { 

				//Add byte to array
				int byteToAddToNormalArray 		= aFlattenedArrayList.get( counterInFlattenedArrayList ) ;
				aSplitArray[ locationIn32byteArray ] 	= (byte)byteToAddToNormalArray;

				println("Added "+ aFlattenedArrayList.get( counterInFlattenedArrayList  )+ "  to aSplitArray["+locationIn32byteArray+"]" );

				//Increment counter
				locationIn32byteArray++;
				println(" locationIn32byteArray is now "+ locationIn32byteArray);

			// }
		//If at end of normal array
			// else if (locationIn32byteArray == sizeToSplitTo  )
			if (locationIn32byteArray == sizeToSplitTo  )
			{
					//Add message type to [0]
					aSplitArray[0] = (byte)138;

					//Add length to [1], should always be 32
					int splitArrayLength = aSplitArray.length;
					aSplitArray[1] = (byte) splitArrayLength ;

					//Send to serial port
					aSerialPort.write(aSplitArray);
						println("***********Sent to serial port***********");
						println(aSplitArray);

					//reset counter, skip first 2 indicies in array for headers
					locationIn32byteArray = 2; 

					//purge array
					Arrays.fill( aSplitArray, (byte)0 );

					
					/*
					This is a bandaid because we are using the for loop counter as the 
					index to put the led into the new array. 
					Once every 30th itterations, we don't add anything to the arrays because
					we are writting to the serial port, because of this, we have to compensate for the 
					next message, or else it will loose the first byte
					I am seeing that byte 31 never gets added, because the 31st loop, no arrays are modified.
					*/

			}
			//else{println("locationIn32byteArray is in limbo, should be unreachable");}
			 
 
		}//end check normal / small

	} //end for loop
	
}//end split Array






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

