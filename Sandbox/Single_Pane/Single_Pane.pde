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
int circleSize = 10;   // Diameter of circle
color rectColor, circleColorOff, circleColorOn, baseColor;
color rectHighlight, circleHighlight;
color circleCurrentColor;
color rectCurrentColor;
boolean rectOver = false;

// State of LEDs
boolean[][] circleOn;

// Position of LED buttons
int[][] circlePos;

// Mouse Over LED buttons?
boolean [][] circleOver;

int delayedby = 50;

//Hashmap to save the setting of each led 
Map<String, Boolean> ledList = new HashMap<String, Boolean>(ledsPerRow*ledsPerColumn*numberOfPanels);  // hashmap for whether LED is on or off



void setup() {



     size((ledsPerRow*40+10), ( ledsPerColumn*44+30));//size of panel 40 is some arbitrary number
     noStroke();
     frameRate(10);
     smooth();
     rectPositionX = ledsPerRow*20-30; //distance from 0,0 pixel to draw box x
     rectPositionY = ledsPerColumn*44+5; //distance from 0,0 pixel to draw box y
     
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
    for(int i=0; i<=( ledsPerColumn-1); i++) {
       for(int j=0; j<=(ledsPerRow-1); j++) {
         circleOn[j][i] = false;
       }
    }

    circlePos = new int[2][(ledsPerRow* ledsPerColumn+1)];

    // X Posistions
    for(int i=0; i<(ledsPerRow* ledsPerColumn-(ledsPerRow-1)); i=i+ledsPerRow) {
    int Xpos = 25;
      for(int ii=0; ii<ledsPerRow; ii++) {
         circlePos[0][i+ii] = Xpos;
         Xpos += 40;
      }
    }

    // Y Positions
    int Ypos = 40;
     for(int i=0; i<(ledsPerRow* ledsPerColumn-(ledsPerRow-1)); i+=ledsPerRow) {
      for(int ii=0; ii<ledsPerRow; ii++) {
         circlePos[1][i+ii] = Ypos;
      }
            Ypos += 40;
     }


    circleOver = new boolean[ledsPerRow][ ledsPerColumn];
    for(int i=0; i<=( ledsPerColumn-1); i++) {
     for(int j=0; j<=(ledsPerRow-1); j++) {
       circleOver[j][i] = false;
     }
    }
}//end setup()


void draw()
{
     update(mouseX, mouseY); //get where the mouse is
     background(baseColor); // draw backgound color

    //whenever someone hovers over the rectangular button
     if(rectOver) {
       fill(rectHighlight);

    // if(mousePressed){
         int val=0;
         int valold = 0;
         int chip = 1;
         int yyy=0;
         print("\t{ ");

          for(int yy=0; yy<( ledsPerColumn ); yy++){ //look at every row (yaxis)
                val=0; //set counter back to 0 every time
                for(int xx=0; xx<(ledsPerRow);xx++){
                       if(circleOn[xx][yy] == true){
                         val=val+(1<<xx); // the << is a bit shift, very rare to see this in programming
                       }
                }
                switch(ledsPerRow){
         
                       case 4:
                       yyy=yy%4;
                         val=val<<(yyy*4); // the << is a bit shift, very rare to see this in programming
                         valold+=val;
                       if(yyy==3){
                         print(valold);
                         valold=0;
                         val=0;
                         if (yy!= ledsPerColumn-1){
                             print(", ");    } 
                       }
                          break;

                        case 8:
                             if (yy%2==1){
                               val=val<<8;
                               val=val+valold;
                             print(val);

                             if (yy!= ledsPerColumn-1){
                               print(", ");    }  
                            }else{
                            valold=val;
                            }
                            break;
                            
                             default:
                             print(val);
                             if (yy!= ledsPerColumn-1){
                               print(", ");    }  
                             val=0; 
                             break;
                }//end switch
           }//end for (yyy)

         println(" },");
       delay(1500);
     } // end if (rectOver)
      else {
       fill(rectColor);
     }

     stroke(255); // Draw White
     rect(rectPositionX, rectPositionY, rectSizeX, rectSizeY); 
     noStroke();


    //Draw all off the leds to screen with color
    int k=0;
    for(int i=0; i< ledsPerColumn; i++) {
         for(int j=0; j<ledsPerRow; j++) {
             colorCircle(j, i, k); // set color of led (255,255,255)
             ellipse(circlePos[0][k], circlePos[1][k], circleSize, circleSize);
             
             //k iterates up to 255
             //j iterates up to 15
             //i iterates up to 15 parallel with j
             

             //******************************
             // Expirament, is this where I write to the hashmap?
             println("k is :"+k+" j is :"+j+" i is :"+i);
             
             //addToHashmap()

             k++; // iterates up to 255
         }
    }

}// end draw()

void update(int x, int y)
{
 for(int i=0; i<=( ledsPerColumn-1); i++) {
   for(int j=0; j<=(ledsPerRow-1); j++) {
     for(int k=0; k<(ledsPerRow* ledsPerColumn+1); k++){
       if( overCircle(circlePos[0][k], circlePos[1][k], circleSize) ) {
         circleOver[j][i] = true;
           for(int m=0; m< ledsPerColumn; m++){
               for(int n=0; n<ledsPerRow; n++){
                 if(n != j && m != i){
                   circleOver[n][m] = false;
                 } else {
                     circleOver[n][m] = true;
                 }//end if n!=j
               }//end for n
           }//end for m
         rectOver = false; // see if we have our mouse over the button
       } else if ( overRect(rectPositionX
      , rectPositionY, rectSizeX, rectSizeY) ) {
         rectOver = true;
           for(int m=0; m< ledsPerColumn; m++){
             for(int n=0; n<ledsPerRow; n++){
                 circleOver[n][m] = false;
             }
           }
       } else {
           rectOver = false;
           for(int m=0; m< ledsPerColumn; m++){
             for(int n=0; n<ledsPerRow; n++){
                 circleOver[n][m] = false;
             }
           }

       }//end if elseif else
     }
   }
 }
}//end update()

boolean overRect(int x, int y, int width, int height)
{
 if (mouseX >= x && mouseX <= x+width &&
     mouseY >= y && mouseY <= y+height) {
   return true;
 } else {
   return false;
 }
}//end overRect

boolean overCircle(int x, int y, int diameter)
{
 float disX = x - mouseX;
 float disY = y - mouseY;
 if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
   return true;
 } else {
   return false;
 }
}//end overCircle  did you find this comment Spencer??  your funny looking..

void colorCircle(int indexX, int indexY, int posIndex){
   if( overCircle(circlePos[0][posIndex], circlePos[1][posIndex], circleSize) ) {
     if(mousePressed){
       if(circleOn[indexX][indexY] == true){
         circleOn[indexX][indexY] = false;
         circleCurrentColor = circleColorOff;
         delay(delayedby);
       } 
       else {
         circleOn[indexX][indexY] = true;
         circleCurrentColor = circleColorOn;
         delay(delayedby);
       }
     }
    fill(circleHighlight);
   } 
   else {
       if(circleOn[indexX][indexY] == true){
         circleCurrentColor = circleColorOn;
       } else {
           circleCurrentColor = circleColorOff;
         }
       fill(circleCurrentColor);
    }
}//end colorCircle


void keyReleased() {
   if (key == 'c' || key == 'C') {
       for(int i=0; i<=( ledsPerColumn-1); i++) {
           for(int j=0; j<=(ledsPerRow-1); j++) {
             circleOn[j][i] = false;
           }
       }
   }
   if (key == 'f' || key == 'F') {
       for(int i=0; i<=( ledsPerColumn-1); i++) {
           for(int j=0; j<=(ledsPerRow-1); j++) {
             circleOn[j][i] = true;
           }
       }
    }
   if (key == 'q' || key == 'Q') {
     exit(); // Stops the program
   }
}// end keyReleased


//method to save status of each led
// this method is called everytime an led is changed
void addToHashmap(int ledXValue, int ledYValue, int ledZValue, boolean onOrOff) {
  //save to hashmap like
  //0-0-0 true
  ledList.put(ledXValue+"-"+ledYValue+"-"+ledZValue, onOrOff);

}//end addToHashmap

void saveToText() {
  //If we are using a hashmap or array list iterate through it
  //Create a string array to actually dump
  //For or while loop
    //add items to string array
  //saveStrings("output.txt",someStringArrayFromEarlier);
  //if (debug){ println("File has been saved to output.txt");}
  
}//end saveToText
