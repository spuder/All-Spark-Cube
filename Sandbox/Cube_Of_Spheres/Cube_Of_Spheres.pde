import processing.opengl.*; 
/*
This code was copied from http://processing.org/discourse/beta/num_1194442962.html
and demonstrates how to use a mouse in 3d space. it is perfect
for what we are trying to do. ```
*/

final int grille = 80; // space between spheres 
int zoom = -1000; // initial zoom - mouse wheel  
int ledSize = 15; // size of LED
int ledDetail = 2; // detail of LED, default 6, lower value offers better performance.
int h,i,j;  // LED x y z position variables
int cubeSize = 16;  // Number of LEDs on one axis

float rotBuffX = 0;  // angle of rotation 
float rotBuffY = 0; 
final float rotVit = 0.01; // step of rotation 
float threshhold = 6;

boolean rotateMode = false; // mouse rotation 
boolean ledHasBeenClicked;  // Vvlue for if the LED is on or off
boolean locked;  // for Button class
boolean picked = false;

// coordinates from matrix 
float x[] = new float[cubeSize*cubeSize*cubeSize]; 
float y[] = new float[cubeSize*cubeSize*cubeSize]; 
float z[] = new float[cubeSize*cubeSize*cubeSize];

Map<String, Boolean> ledList = new HashMap<String, Boolean>(cubeSize*cubeSize*cubeSize);  // hashmap for whether LED is on or off
RectButton rect1, rect2;  // Button objects (may not be used).



void setup() { 
 size(screen.width,screen.height, OPENGL); 

 sphereDetail(ledDetail);
 noStroke(); 
 // mouse Wheel 
 addMouseWheelListener(new java.awt.event.MouseWheelListener() {  
   public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
     if (evt.getWheelRotation()<0) { 
       zoom+=evt.getScrollAmount()+grille;  // number of grid elements to move per mouse wheel rotation 
     }  else { 
       zoom-=evt.getScrollAmount()+grille; 
     } 
     redraw(); 
   } 
 } 
 ); 
 
 color buttoncolor = color(153);
 color highlight = color(103);
  rect1 = new RectButton(200, 200, 50, buttoncolor, highlight);
} 


void draw() { 
 background(0); 
lights(); 
frameRate(60);
 // rotate mode 
 if (rotateMode) { 
   rotBuffX= mouseY*rotVit; 
   rotBuffY= mouseX*rotVit;
 } 

 translate(screen.width/2,screen.height/2,zoom); // center cube on the screen 
 rotateX(rotBuffX); 
 rotateY(rotBuffY); 
 pushMatrix(); 
 /// show center of rotation 
 fill(255,0,0); 
 sphere(ledSize);  
 
 
 // center of rotation 
 // 600 = distance between LEDs * number of LEDs
 // Offset distance from center red dot
 translate(-((grille*cubeSize/2)-(grille/2)),-((grille*cubeSize/2)-(grille/2)),-((grille*cubeSize/2)-(grille/2)));   
 int cnt = 0; // count 0-125 
 for (h=0; h<cubeSize; h++) { 
   for (i=0; i<cubeSize; i++) { 
    for (j=0; j<cubeSize; j++) { 
     pushMatrix(); 
      translate(i*grille, j*grille, h*grille); 
      x[cnt] = screenX(0, 0, 0); // This code lights up surrounding leds
      y[cnt] = screenY(0, 0, 0); 
      z[cnt] = screenZ(0, 0, 0); 
      picked = checkDist(x[cnt],y[cnt],z[cnt]);  // threshold is fourth value, default is 15.
          
      if (picked) { // LED is being hovered over
            println("Picked = true, led " + +h+" "+i+" "+j +" is hovered over");
            
            if (ledHasBeenClicked == true){  // LED has been hovered and clicked
                  println("ledHasBeenClicked = true, led " + +h+" "+i+" "+j +" is marked as clicked");
                  // to do: export h i j to tsv file for parsing
                  println("Clicked LED "+h+" "+i+" "+j);
                  
                  if (ledList.containsKey(h+" "+i+" "+j)==false){ // LED has been hovered, clicked, and never set before
                      ledList.put(h+" "+i+" "+j,true); // assigns true value to ledList hashmap to turn the LED on.
                  }
                  else if(ledList.get(h+" "+i+" "+j)==false) { // LED has been hovered, clicked, and is turned off
                      ledList.put(h+" "+i+" "+j,true); // assigns true value to ledList hashmap to turn the LED on.
                  }
                  else {  // LED has been hovered, clicked and is currently on
                      ledList.put(h+" "+i+" "+j,false);  // assigns false value to ledList hashmap.
                  }
                  
                  ledHasBeenClicked = false;  // Reset LED clicked status
            }
            else {
                ledHasBeenClicked = false; // user didn't click anything // This code doesn't work
            }
      }
    
    
    if (ledList.containsKey(h+" "+i+" "+j)==false){  // turns LED off from ledList value
       fill(0,64,255);  // LED is blue (off)    
    }
    else if(ledList.get(h+" "+i+" "+j)==true){  // turns LED on from ledList value
       fill(255,255,255);  // LED is white (on)
    }
    else if(ledList.get(h+" "+i+" "+j)==false){  // led is off and should stay off
       fill(0,64,255);  // LED is blue (off)
    }

    
      
     sphere(5); 
     popMatrix(); 
     cnt++; 

    }   // end for (j=0; j<cubeSize; j++) 
   }  // end for (i=0; i<cubeSize; i++)  
 }// end for (h=0; h<cubeSize; h++)  

// println("The for loop is over :( " +h+" "+i+" "+j);
 popMatrix(); 
 //rect1.display();
} 

void keyPressed() { 
 if (keyCode == CONTROL) { // activate rotation mode 
   rotateMode = true; 
   loop(); 
 } 
 
 if (keyCode == ALT) {
  for (Map.Entry entry : ledList.entrySet()) {
    println(entry.getKey() + ", " + entry.getValue());
    println("");
  }
 }
} 

void keyReleased()   { 
 if (keyCode == CONTROL) { // deactivate rotation mode 
   rotateMode = false; 
   loop(); 
 } 
} 

void mouseReleased() {
 // println("mouse has been clicked, fyi led is currently" +h+" "+i+" "+j );
      ledHasBeenClicked = true; 
}

boolean checkDist(float x1,float y1,float z1) {
// check distance between mouse & object
 float theDist = dist(mouseX,mouseY,0,x1,y1,z1);
   if (theDist< threshhold) {
     return true;
   } else {
       return false;
   }
}
