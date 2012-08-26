import processing.opengl.*; 
/*
This code was copied from http://processing.org/discourse/beta/num_1194442962.html
and demonstrates how to use a mouse in 3d space. it is perfect
for what we are trying to do. 
*/

final int grille = 80; 		// space between spheres 
int zoom = -1000; 			// initial zoom - mouse wheel  
int ledSize = 15; 			// size of LED
int ledDetail = 1; 			// detail of LED, default 6, lower value offers better performance.
int h,i,j;  				// LED x y z position variables
int cubeSize = 16;  		// Number of LEDs on one axis
int framesPerSecond = 30;  	// Specifies the number of frames/second
int cnt = 0; 				// count 0-4095 

float rotBuffX = 0;  		// angle of rotation X
float rotBuffY = 0;  		// angle of rotation Y
final float rotVit = 0.01; 	// step of rotation 
float threshhold = 8;  		// Hover tolerance - lower number means you must be more precise in your clicking of the LEDs
float goldenRatio = 0.6180339887;

boolean rotateMode = false; // mouse rotation 
boolean ledHasBeenClicked;  // Value for if the LED is on or off
int ledColor = #0000FF;	// Color of LED (Red, Green, Yellow, Blue, White, Orange, Purple)
boolean ledIsHoveredOver = false;  	// hover variable
boolean debug = false;  	// turn debugging on and off

// coordinates from matrix 
float x[] = new float[cubeSize*cubeSize*cubeSize]; 
float y[] = new float[cubeSize*cubeSize*cubeSize]; 
float z[] = new float[cubeSize*cubeSize*cubeSize];

Map<Integer, Integer> ledList = new HashMap<Integer, Integer>(cubeSize*cubeSize*cubeSize);  // hashmap for whether LED is on or off



void setup() { 
<<<<<<< HEAD
	size(screen.width, screen.height, OPENGL); 
=======
  //TODO: test that size does work with variables after export to applet, docs say it doesnt
	size(int(screen.width*goldenRatio),int(screen.height*goldenRatio), OPENGL); //Do not use variables as the parameters to size() command, because it will cause problems when exporting your sketch.
>>>>>>> development-dualpane
	frameRate(framesPerSecond);
        frame.setResizable(true);
	sphereDetail(ledDetail);
	noStroke(); 
	// mouse Wheel 
	addMouseWheelListener(new java.awt.event.MouseWheelListener() {  
		public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
			if (evt.getWheelRotation()<0){ zoom+=evt.getScrollAmount()+grille;}  // number of grid elements to move per mouse wheel rotation 
			else{ zoom-=evt.getScrollAmount()+grille; } 
		 redraw(); 
		} 
	}
	); 
 

	clearHashMap();  // Sets all the values in the hashMap to false
} 


void draw() { 
 background(0); 
lights(); 
 // rotate mode 
 if (rotateMode) { 
   rotBuffX= mouseY*rotVit; 
   rotBuffY= -1*mouseX*rotVit; // the speed that the mouse rotates the screen
 } 

<<<<<<< HEAD
  // center cube on the window 
 translate(width/2, height/2,zoom); 
=======
 translate(width/2,height/2,zoom); // center cube on the screen, dont use screen.width. but rather just width
>>>>>>> development-dualpane
 rotateX(rotBuffX); 
 rotateY(rotBuffY); 
 pushMatrix(); 
 /// show center of rotation 
 fill(255,0,0); // make LED in center red
 sphere(ledSize);  // draw red LED in center of cube
 
 
 // center of rotation 
 // Offset distance from center red dot
 translate(-((grille*cubeSize/2)-(grille/2)),-((grille*cubeSize/2)-(grille/2)),-((grille*cubeSize/2)-(grille/2)));   
 cnt=0;
 for (h=0; h<cubeSize; h++) { 
   for (i=0; i<cubeSize; i++) { 
    for (j=0; j<cubeSize; j++) { 
      pushMatrix(); 
      translate(i*grille, j*grille, h*grille); 
      x[cnt] = screenX(0, 0, 0); // This code lights up surrounding leds (doesnt actually work right now)
      y[cnt] = screenY(0, 0, 0); 
      z[cnt] = screenZ(0, 0, 0); 
      ledIsHoveredOver = checkDist(x[cnt],y[cnt],z[cnt]);  // threshold is fourth value, default is 15 - We deleted the hover over code...
          
      if (ledIsHoveredOver) { // LED is being hovered over
            if (debug){ println("ledIsHoveredOver = true, led "+cnt+" is hovered over");}
            
            if (ledHasBeenClicked == true){  // LED has been hovered and clicked
				if (debug){ println("ledHasBeenClicked = true, led "+cnt+" is marked as clicked");}
				if (debug){ println("Clicked LED "+cnt);}
                  
				if(ledList.get(cnt).equals(#000000)) { 		// LED has been hovered, clicked, and is turned off
					ledList.put(cnt,ledColor); 			// assigns true value to ledList hashmap to turn the LED on.
				}
				else {  										// LED has been hovered, clicked and is currently on
					ledList.put(cnt,#000000);  			// assigns off value to ledList hashmap.
				}
            }
            ledHasBeenClicked = false; 							// user didn't click anything
      }
    
    
	if(ledList.get(cnt).equals(#FF0000)){  // turns LED on from ledList value
       fill(#FF0000);  // LED is red
    }
	else if (ledList.get(cnt).equals(#00FF00)){
		fill(#00FF00);  // LED is green
	}
	else if (ledList.get(cnt).equals(#0000FF)){
		fill(#0000FF);  // LED is blue
	}
	else if (ledList.get(cnt).equals(#FFFF00)){
		fill(#FFFF00);  // LED is yellow
	}
	else if (ledList.get(cnt).equals(#FF7D00)){
		fill(#FF7D00);  // LED is orange
	}
	else if (ledList.get(cnt).equals(#FF00FF)){
		fill(#FF00FF);  // LED is purple
	}
	else if (ledList.get(cnt).equals(#FFFFFF)){
		fill(#FFFFFF);  // LED is white
	}
    else {  // led is off and should stay off
       fill(#5A5A5A);  // LED is gray (off)
    }
      
    sphere(5); 
    popMatrix(); 
    cnt++; 

    }   // end for (j=0; j<cubeSize; j++) 
   }  // end for (i=0; i<cubeSize; i++)  
 }// end for (h=0; h<cubeSize; h++)  

 popMatrix(); 
} 

void keyPressed() {
	if (keyCode == SHIFT){ // activate rotation mode when Shift key is pressed
		rotateMode = true; 
		loop(); 
	}
 
	if (keyCode == ALT){  // Print hashMap
		for (Map.Entry entry : ledList.entrySet()) {
			println(entry.getKey() + ", " + entry.getValue());
		}
	}
	
	if (keyCode == DELETE){  // clear hashMap
		clearHashMap();  // Calls clearHashMap function - This should be renamed
	}
	
	if (key == 'd'){  // turn debug mode on and off
		if (debug == true){ debug = false; }  // turns debug off if it was on
		else { debug = true; }  // turns debug on if it was off
	}
	
	if (key == 'b'){ledColor = #0000FF; } // Sets LED color
	if (key == 'r'){ledColor = #FF0000; } // Sets LED color
	if (key == 'g'){ledColor = #00FF00; } // Sets LED color
	if (key == 'y'){ledColor = #FFFF00; } // Sets LED color
	if (key == 'o'){ledColor = #FF7D00; } // Sets LED color
	if (key == 'w'){ledColor = #FFFFFF; } // Sets LED color
	if (key == 'p'){ledColor = #FF00FF; } // Sets LED color
	if (key == 'i'){importHashMap(); } // import file
	
	if (key == 't'){  // timestamp
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");  // Converts date into human readable
		Date date = new Date();  // Creates new date object
		println(dateFormat.format(date));  // Prints current timestamp to console/terminal
	}
	
	if (keyCode == CONTROL){ // user pushed CTL key on keyboard
<<<<<<< HEAD
		exportToFile();
	}
=======
		saveToText(); // call the saveToText method

    }
>>>>>>> development-dualpane
} 

void keyReleased()   { 
	if (keyCode == SHIFT){ // deactivate rotation mode 
		rotateMode = false; 
		loop(); 
	} 
} 

void mouseReleased() {
	if (debug){ println("mouse has been clicked, fyi led is currently" +cnt);}
	ledHasBeenClicked = true;  // Sets current clicked LED to true on next loop iteration.
}

boolean checkDist(float x1,float y1,float z1) { // check distance between mouse & object
 float theDist = dist(mouseX,mouseY,0,x1,y1,z1);
   if (theDist< threshhold) {
     return true;
   } else {
       return false;
   }
}

<<<<<<< HEAD
void clearHashMap () {  // Function to set all hashmap values to off
	for (int loop=0; h<cubeSize*cubeSize*cubeSize; h++) { 
		ledList.put(h,#000000);  // Sets all hashmap values to off
	}
}


void importHashMap () {  // Function to import hashmap from file
     // Create a new thread to allow screen to continue to refresh  
     // while we open the file
    new Thread(
      //Create a new runnable class inside the thread
      new Runnable() 
          {
          // Call the runnable with the actual code to execute
          public void run()
          {      
              // Prompt the user for a file and save that location to a string
              // example = c:\someFile.txt     
      	      String inputFile = selectInput();
              
              // Verify the user did not click cancel
              if (inputFile == null) { println("No file selected"); }
              else
              {
              
              //loadStrings creates an array of all the text of a file
              String importStringArray[] = loadStrings(inputFile);
              
                
                // look at every single character in the file one by one
      	        for (int s=0; s<importStringArray.length; s++)
      	        {
                    // Every time we encounter a space save the preceding 
                    // Text to a single string
      	    	    String[] tempList = split(importStringArray[s],"\t");  // Split strings using " " as a delimeter
        	   
                    // Add the 1st and 2nd word on each line of the
                    // text file to our hashmap example 48 red
                    ledList.put(int(tempList[0]),int(tempList[1]));  // Turns LED on
      	        }
              // Debugging print out that the import completed
	      println("Finished import");
              } //end else
    
          }//end run()
          }//end Runnable
    ).start();//end thread
}//end importHashMap

void exportToFile() {  // Function to export hashmap into file
 // Create a new thread to allow screen to continue to refresh  
 // while we open the file
  new Thread( new Runnable() { public void run()
  { 
      String outputFile = selectOutput();
      if (outputFile == null) { println("No file selected"); }
       else
      {
	// Loop through hashmap & export
	Iterator loopdaloop = ledList.entrySet().iterator();
	String[] outputStringArray = new String[cubeSize*cubeSize*cubeSize];
	int arrayLoop = 0;
    	    while (loopdaloop.hasNext())
            {
    	    	    Map.Entry entry = (Map.Entry) loopdaloop.next();
    		    int key = (Integer)entry.getKey();
    		    int value = (Integer)entry.getValue();
    		    outputStringArray[arrayLoop]=key+"\t"+value;
    		    arrayLoop++;
    	    }// end while
    
	saveStrings(outputFile,outputStringArray);  // Lets user choose location and name of exported file.
	println("File has been saved!");
      }
      
      }//end run()
    }//end Runnable
    ).start();//end thread
    
}//end exportToFile()
=======
void saveToText() {
  // Loop through hashmap & export
    Iterator loopdaloop = ledList.entrySet().iterator();
    String[] outputStringArray = new String[cubeSize*cubeSize*cubeSize+1];
    int arrayLoop = 0;
    while (loopdaloop.hasNext()){
      Map.Entry entry = (Map.Entry) loopdaloop.next();
      String key = (String)entry.getKey();
      Boolean value = (Boolean)entry.getValue();
      outputStringArray[arrayLoop]=key;
      arrayLoop++;
    }
    saveStrings("output.txt",outputStringArray);
        if (debug){ println("File has been saved to output.txt");}
  

}// end saveToText  
>>>>>>> development-dualpane
