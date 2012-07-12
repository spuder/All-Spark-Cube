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

// angle of rotation 
float rotBuffX = 0;  
float rotBuffY = 0; 

final float rotVit = 0.01; // step of rotation 

boolean rotateMode = false; // mouse rotation 

// coordinates from matrix 
float x[] = new float[4096]; 
float y[] = new float[4096]; 
float z[] = new float[4096];

Map<String, Boolean> ledList = new HashMap<String, Boolean>(4096);  // hashmap for whether LED is on or off
RectButton rect1, rect2;

int h,i,j;  // LED x y z position variables
boolean ledHasBeenClicked;
boolean locked;  // for Button class

// We don't know exactly what this does
int ledSelected = -1; 

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
 translate(-((grille*8)-(grille/2)),-((grille*8)-(grille/2)),-((grille*8)-(grille/2)));   
 int cnt = 0; // count 0-125 
 for (h=0; h<16; h++) { 
   for (i=0; i<16; i++) { 
    for (j=0; j<16; j++) { 
     pushMatrix(); 
      translate(i*grille, j*grille, h*grille); 
      x[cnt] = screenX(0, 0, 0); 
      y[cnt] = screenY(0, 0, 0); 
      z[cnt] = screenZ(0, 0, 0); 
      boolean picked = checkDist(x[cnt],y[cnt],z[cnt],6,h,i,j);  // threshold is fourth value, default is 15.
          
      if (picked) { // LED is being hovered over
            if (ledHasBeenClicked == true){  // LED has been hovered and clicked
            
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
      }
    
    
    if (ledList.containsKey(h+" "+i+" "+j)==false){  // turns LED off from ledList value
       fill(0,64,255);  // LED is blue (off)    
    }
    else if(ledList.get(h+" "+i+" "+j)==true){  // turns LED on from ledList value
       fill(255,255,255);  // LED is white (on)
    }

    
      
     sphere(5); 
     popMatrix(); 
     cnt++; 
    } 
   } 
 } 
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

void mousePressed() {
 ledHasBeenClicked = true; 
}

boolean checkDist(float x1,float y1,float z1, float threshold, int h, int i, int j ) {
// check distance between mouse & object
 float theDist = dist(mouseX,mouseY,0,x1,y1,z1);
   if (theDist< threshold) {
     return true;
   } else {
       return false;
   }
}
