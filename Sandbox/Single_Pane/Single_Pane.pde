/* matrix programmer by Randy Starcher
 
 Based on LED_Cube_Editor by Tim Ballas
 http://www.atomicvpp.com/wpblog/category/projects/led-cube/
 
 This program is meant to convert LED matrix display information to
 integer codes used by the A6276AE 16 Output LED Sink Driver.
 The program is somewhat scalable and contains code for 4, 8, and 16
 wide rows.  Other widths possible with code changes.
 
 Change ledsPerRow and  ledsPerColumn to scale the matrix.
 
 When you are ready to output the code, place the mouse over the red
 rectangle then copy/paste into the animation code.
 
 Output code reads left to right, top to bottom
 */

int rectPositionX, rectPositionY;      // Position of square button
int ledsPerRow = 16;
int ledsPerColumn = 16;
int numberOfPanels = 16; //the depth of the cube and how many panels to draw
int rectSizeX = 80;     // Width of rect
int rectSizeY = 20;     // Height of rect
int circleSize = 15;   // Diameter of circle
int distanceBetweenCirclesX = 20;
int distanceBetweenCirclesY = 20;
int selectTolerance = 10; //how precise you need to be to select a led, 3 = within 3 pixels of the led 
color rectColor, circleColorOff, circleColorOn, baseColor;
color rectHighlight, circleHighlight;
color circleCurrentColor;
color rectCurrentColor;
boolean rectOver = false;
boolean debugMode = true;


// State of LEDs
boolean[][] circleOn;

// Position of LED buttons
int[][] circlePos;

// Mouse Over LED buttons?
boolean [][] circleOver;

int delayedby = 50;

//Hashmap to save the setting of each led 
//Map<String, Boolean> ledList = new HashMap<String, Boolean>(ledsPerRow*ledsPerColumn*numberOfPanels);  // hashmap for whether LED is on or off
Map ledList = new TreeMap();  // hashmap for whether LED is on or off // Tree map sorts when inputed, where hashmap is the order of insertion, hashmap is faster



void setup() {


  //size (800, 800);
  size((ledsPerRow * distanceBetweenCirclesX + 2 * distanceBetweenCirclesX), ( ledsPerColumn * distanceBetweenCirclesY + 5 * distanceBetweenCirclesY));//size of panel 40 is some arbitrary number
  noStroke();
  frameRate(10);
  smooth();
  rectPositionX =  distanceBetweenCirclesX  + ((ledsPerRow -1) /2  * circleSize) ; //distance from 0,0 pixel to the red box in bottom center
  rectPositionY = height - rectSizeY -rectSizeY/2 ; //distance from 0,0 pixel to the red box in bottom center

  // Colors
  rectColor          = color(#FF0000);
  rectHighlight      = color(#FFFF00);
  circleColorOff     = color(#444444);
  circleColorOn      = color(#ff0000);
  circleHighlight    = color(#CCFF00);
  baseColor          = color(#222222);
  circleCurrentColor = circleColorOff;
  rectCurrentColor   = rectColor;

  circleOn = new boolean[ledsPerRow][ ledsPerColumn];
  for (int i=0; i<=( ledsPerColumn-1); i++) {
    for (int j=0; j<=(ledsPerRow-1); j++) {
      circleOn[j][i] = false;
    }
  }

  circlePos = new int[2][(ledsPerRow* ledsPerColumn+1)];

  // X Posistions 
  for (int i=0; i<(ledsPerRow* ledsPerColumn-(ledsPerRow-1)); i=i+ledsPerRow) {
    int xDistanceFromEdge = 25;        // How far to the left we start drawing the circles
    for (int ii=0; ii<ledsPerRow; ii++) {
      circlePos[0][i+ii] = xDistanceFromEdge;
      xDistanceFromEdge += distanceBetweenCirclesX;
    }
  }

  // Y Positions
  int yDistanceFromEdge = circleSize * distanceBetweenCirclesY + ledsPerColumn + circleSize; //was 40, then 400
  for (int i=0; i < (ledsPerRow * ledsPerColumn-(ledsPerRow-1)); i += ledsPerRow) { //Draws leds from bottom left to top left, but shifts unexpectedly
  //  for (int i= (ledsPerRow* ledsPerColumn-(ledsPerRow-1)) ; i<=0; i-=ledsPerRow) { //Draws leds from top left to bottom left
    for (int ii = ledsPerRow; ii >= 0; ii--) {
    //for (int ii=0; ii<ledsPerRow; ii++) {
     // circlePos[1][i+ii] = yDistanceFromEdge; //how far from the top we start drawing circles
       circlePos[1][i+ii] = yDistanceFromEdge;
    }
    //yDistanceFromEdge += distanceBetweenCirclesY;
    yDistanceFromEdge -= distanceBetweenCirclesY ;

  }


  circleOver = new boolean[ledsPerRow][ ledsPerColumn];
  for (int i=0; i<=( ledsPerColumn-1); i++) {
    for (int j=0; j<=(ledsPerRow-1); j++) {
      circleOver[j][i] = false;
    }
  }
}//end setup()


void draw()
{
  update(mouseX, mouseY); //get where the mouse is
  background(baseColor); // draw backgound color

    //whenever someone hovers over the rectangular button
  if (rectOver && mousePressed) {
    fill(rectHighlight);
      if (debugMode){println("Pressed the mouse button while hovered over red rectangle");}
      saveToText(); // clicked the rectangle so save to file
      

  } // end if (rectOver)
  else {
    fill(rectColor); //We aren't hovered over the rectangle, so fill it red (opposed to yellow);
  }

  stroke(255); // Draw White
  rect(rectPositionX, rectPositionY, rectSizeX, rectSizeY); 
  noStroke();


  //Draw all off the leds to screen with color
  int k=0;
  for (int i=0; i< ledsPerColumn; i++) {
    for (int j=0; j<ledsPerRow; j++) {
      colorCircle(j, i, k); // set color of led (255,255,255)
      ellipse(circlePos[0][k], circlePos[1][k], circleSize, circleSize);

      //k iterates up to 255
      //j iterates up to 15
      //i iterates up to 15 parallel with j


      //******************************
      // Experiment, is this where I write to the hashmap? NO defenitely not
      // println("k is :"+k+" j is :"+j+" i is :"+i);

      //addToHashmap()

      k++; // iterates up to 255
    }
  }
}// end draw()

void update(int x, int y)
{
  for (int i=0; i<=( ledsPerColumn-1); i++) {
    for (int j=0; j<=(ledsPerRow-1); j++) {
      for (int k=0; k<(ledsPerRow* ledsPerColumn+1); k++) {

        if ( overCircle(circlePos[0][k], circlePos[1][k], circleSize) ) {
          circleOver[j][i] = true;

          for (int m=0; m< ledsPerColumn; m++) { //Scan through every Column looking to see if we hovered over a circle
            for (int n=0; n<ledsPerRow; n++) { //Scan through every Row looking to see if we hovered over a circle
              if (n != j && m != i) {

                circleOver[n][m] = false;
              } 
              else {
                circleOver[n][m] = true;


                /*
                         I finallly found where to add the led status change
                 
                 Never mind this is just where we change the color to yellow because we hovered over it, you really need CircleOn
                 
                 */
              }//end if n!=j
            }//end for n
          }//end for m

          rectOver = false; // see if we have our mouse over the button
        } 
        else if ( overRect(rectPositionX, rectPositionY, rectSizeX, rectSizeY) ) { // if your mouse is over the rectangle
          rectOver = true;
          for (int m=0; m< ledsPerColumn; m++) {
            for (int n=0; n<ledsPerRow; n++) {
              circleOver[n][m] = false;
            }
          }//end else if
        } 
        else {
          rectOver = false;
          for (int m=0; m< ledsPerColumn; m++) {
            for (int n=0; n<ledsPerRow; n++) {
              circleOver[n][m] = false;
            }
          }//end else
        }//end if elseif else
      }
    }
  }
}//end update()


boolean overRect(int x, int y, int width, int height)
{
  if (mouseX >= x && mouseX <= x+width+selectTolerance &&
    mouseY >= y && mouseY <= y+height+selectTolerance) {
    return true;
  } 
  else {
    return false;
  }
}//end overRect


boolean overCircle(int x, int y, int diameter)
{
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } 
  else {
    return false;
  }
}//end overCircle  did you find this comment Spencer??  your funny looking.. 

void colorCircle(int indexX, int indexY, int posIndex) {  // Loop to draw all the circles depending on wheter they are selected or not. 
  if ( overCircle(circlePos[0][posIndex], circlePos[1][posIndex], circleSize) ) { // If the loop comes to a circle who is hovered get the color?
    if (mousePressed) { //If hovered over and mouse is clicked, then change the color
      if (circleOn[indexX][indexY] == true) {
        circleOn[indexX][indexY] = false;
        circleCurrentColor = circleColorOff;
        /*
 Finally found where to put the save output method. 
         */
        ledList.remove(indexX +"-"+indexY +"-"+ 0); // save new status of led to hashmap
        if (debugMode) { 
          println(indexX +"-"+ indexY + " false: Should be equal to " + ledList.get(indexX +"-"+indexY +"-"+ 0) );
        }

        //delay(delayedby); // no idea why he is delaying
      } 
      else {

        circleOn[indexX][indexY] = true;
        circleCurrentColor = circleColorOn;

        ledList.put(indexX +"-"+ indexY +"-"+ 0, 255); //save new status of led to hashmap
        if (debugMode) { 
          println(indexX +"-"+ indexY + " true: Should be equal to " + ledList.get(indexX +"-"+indexY +"-"+ 0) );
        }

       // delay(delayedby); // no idea why he is delaying
      }//end else
    }
    fill(circleHighlight);
  } 
  else {
    if (circleOn[indexX][indexY] == true) {
      circleCurrentColor = circleColorOn;
    } 
    else {
      circleCurrentColor = circleColorOff;
    }
    fill(circleCurrentColor);
  }
}//end colorCircle


void keyReleased() {
  if (key == 'c' || key == 'C') {
    for (int i=0; i<=( ledsPerColumn-1); i++) {
      for (int j=0; j<=(ledsPerRow-1); j++) {
        circleOn[j][i] = false;
      }
    }
  }
  if (key == 'f' || key == 'F') {
    for (int i=0; i<=( ledsPerColumn-1); i++) {
      for (int j=0; j<=(ledsPerRow-1); j++) {
        circleOn[j][i] = true;
      }
    }
  }
  if (key == 'q' || key == 'Q') {
    // exit(); // Stops the program
  }
  if (key == 's' || key == 'S' ) {
    saveToText();
  }
}// end keyReleased


/*

 //method to save status of each led
 // this method is called everytime an led is changed
 void addToHashmap(int ledXValue, int ledYValue, int ledZValue, boolean onOrOff) {
 //save to hashmap like
 //0-0-0 true
 ledList.put(ledXValue+"-"+ledYValue+"-"+ledZValue, onOrOff);
 
 }//end addToHashmap
 */
void saveToText() {
  //If we are using a hashmap or array list iterate through it
  Iterator loopdaloop = ledList.entrySet().iterator();
  int arrayLoop = 0;

  //Create a string array to actually dump
  String[] outputStringArray = new String[ledsPerRow * ledsPerColumn + 1 ]; // Convert the hashmap to a serializable String. 16x16 long

  //For or while loop
  while (loopdaloop.hasNext ()) {
    Map.Entry anEntry = (Map.Entry) loopdaloop.next();
    //add items to string array
    String aKey = (String)anEntry.getKey(); 
    String aValue = anEntry.getValue().toString(); 

      outputStringArray [arrayLoop] = aKey + "\t" + aValue + ""; // saves just 0-0-0 to the array, (dont use word 'key' because that is a reserved word)

    arrayLoop++;
  }
  saveStrings("output.txt", outputStringArray);
  if (debugMode) { 
    println("File has been saved to output.txt");
  }
}//end saveToText



