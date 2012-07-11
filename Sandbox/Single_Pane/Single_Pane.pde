/* matrix programmer by Randy Starcher

Based on LED_Cube_Editor by Tim Ballas
http://www.atomicvpp.com/wpblog/category/projects/led-cube/

This program is meant to convert LED matrix display information to
integer codes used by the A6276AE 16 Output LED Sink Driver.
The program is somewhat scalable and contains code for 4, 8, and 16
wide rows.  Other widths possible with code changes.

Change ROWX and ROWY to scale the matrix.

When you are ready to output the code, place the mouse over the red
rectangle then copy/paste into the animation code.

Output code reads left to right, top to bottom
*/

int rectX, rectY;      // Position of square button
int ROWX, ROWY;
int rectSizeX = 80;     // Width of rect
int rectSizeY = 20;     // Height of rect
int circleSize = 20;   // Diameter of circle
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

void setup() {
 //number of rows and columns
 ROWX= 8;
 ROWY= 8;

 size((ROWX*40+10), (ROWY*44+30));
 noStroke();
 frameRate(10);
 smooth();
 rectX = ROWX*20-30;
 rectY = ROWY*44+5;
 
 // Colors
 rectColor = color(#FF0000);
 rectHighlight = color(#FFFF00);
 circleColorOff = color(#444444);
 circleColorOn = color(#ff0000);
 circleHighlight = color(#CCFF00);
 baseColor = color(#222222);
 circleCurrentColor = circleColorOff;
 rectCurrentColor = rectColor;

circleOn = new boolean[ROWX][ROWY];
for(int i=0; i<=(ROWY-1); i++) {
 for(int j=0; j<=(ROWX-1); j++) {
   circleOn[j][i] = false;
 }
}
circlePos = new int[2][(ROWX*ROWY+1)];

// X Posistions
for(int i=0; i<(ROWX*ROWY-(ROWX-1)); i=i+ROWX) {
int Xpos = 25;
  for(int ii=0; ii<ROWX; ii++) {
     circlePos[0][i+ii] = Xpos;
     Xpos += 40;
  }
}

// Y Positions
int Ypos = 40;
 for(int i=0; i<(ROWX*ROWY-(ROWX-1)); i+=ROWX) {
  for(int ii=0; ii<ROWX; ii++) {
     circlePos[1][i+ii] = Ypos;
  }
        Ypos += 40;
 }


circleOver = new boolean[ROWX][ROWY];
for(int i=0; i<=(ROWY-1); i++) {
 for(int j=0; j<=(ROWX-1); j++) {
   circleOver[j][i] = false;
 }
}
}


void draw()
{
 update(mouseX, mouseY);
 background(baseColor);

 if(rectOver) {
   fill(rectHighlight);

// if(mousePressed){
     int val=0;
     int valold = 0;
     int chip = 1;
     int yyy=0;
     print("\t{ ");

  for(int yy=0; yy<(ROWY);yy++){
    val=0;
  for(int xx=0; xx<(ROWX);xx++){
         if(circleOn[xx][yy] == true){
           val=val+(1<<xx);
         }
  }
     switch(ROWX){
     
       case 4:
       yyy=yy%4;
         val=val<<(yyy*4);
         valold+=val;
       if(yyy==3){
         print(valold);
         valold=0;
         val=0;
         if (yy!=ROWY-1){
             print(", ");    } 
       }
          break;

      case 8:
           if (yy%2==1){
             val=val<<8;
             val=val+valold;
           print(val);

           if (yy!=ROWY-1){
             print(", ");    }  
          }else{
          valold=val;
          }
          break;
          
           default:
           print(val);
           if (yy!=ROWY-1){
             print(", ");    }  
           val=0; 
           break;
}
}

         println(" },");
   delay(1500);
 } else {
   fill(rectColor);
 }

 stroke(255);
 rect(rectX, rectY, rectSizeX, rectSizeY);
 noStroke();

int k=0;
for(int i=0; i<ROWY; i++){
 for(int j=0; j<ROWX; j++){
     colorCircle(j, i, k);
     ellipse(circlePos[0][k], circlePos[1][k], circleSize, circleSize);
     k++;
 }
}
}

void update(int x, int y)
{
 for(int i=0; i<=(ROWY-1); i++) {
   for(int j=0; j<=(ROWX-1); j++) {
     for(int k=0; k<(ROWX*ROWY+1); k++){
       if( overCircle(circlePos[0][k], circlePos[1][k], circleSize) ) {
         circleOver[j][i] = true;
         for(int m=0; m<ROWY; m++){
           for(int n=0; n<ROWX; n++){
             if(n != j && m != i){
               circleOver[n][m] = false;
             } else {
                 circleOver[n][m] = true;
             }
           }
         }
         rectOver = false;
       } else if ( overRect(rectX, rectY, rectSizeX, rectSizeY) ) {
         rectOver = true;
           for(int m=0; m<ROWY; m++){
             for(int n=0; n<ROWX; n++){
                 circleOver[n][m] = false;
             }
           }
       } else {
           rectOver = false;
           for(int m=0; m<ROWY; m++){
             for(int n=0; n<ROWX; n++){
                 circleOver[n][m] = false;
             }
           }

       }
     }
   }
 }
}

boolean overRect(int x, int y, int width, int height)
{
 if (mouseX >= x && mouseX <= x+width &&
     mouseY >= y && mouseY <= y+height) {
   return true;
 } else {
   return false;
 }
}

boolean overCircle(int x, int y, int diameter)
{
 float disX = x - mouseX;
 float disY = y - mouseY;
 if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
   return true;
 } else {
   return false;
 }
}

void colorCircle(int indexX, int indexY, int posIndex){
 if( overCircle(circlePos[0][posIndex], circlePos[1][posIndex], circleSize) ) {
   if(mousePressed){
     if(circleOn[indexX][indexY] == true){
       circleOn[indexX][indexY] = false;
       circleCurrentColor = circleColorOff;
       delay(delayedby);
     } else {
       circleOn[indexX][indexY] = true;
       circleCurrentColor = circleColorOn;
       delay(delayedby);
     }
   }
   fill(circleHighlight);
 } else {
     if(circleOn[indexX][indexY] == true){
       circleCurrentColor = circleColorOn;
     } else {
         circleCurrentColor = circleColorOff;
       }
     fill(circleCurrentColor);
   }
}


void keyReleased() {
 if (key == 'c' || key == 'C') {
   for(int i=0; i<=(ROWY-1); i++) {
     for(int j=0; j<=(ROWX-1); j++) {
       circleOn[j][i] = false;
     }
   }
 }
   if (key == 'f' || key == 'F') {
   for(int i=0; i<=(ROWY-1); i++) {
     for(int j=0; j<=(ROWX-1); j++) {
       circleOn[j][i] = true;
     }
   }
 }

 if (key == 'q' || key == 'Q') {
   exit(); // Stops the program
 }
}
