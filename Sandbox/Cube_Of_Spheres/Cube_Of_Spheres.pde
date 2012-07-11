import processing.opengl.*; 
/*
This code was copied from http://processing.org/discourse/beta/num_1194442962.html
and demonstrates how to use a mouse in 3d space. it is perfect
for what we are trying to do. ```
*/

final int grille = 40; // space between spheres 

int zoom = -200; // zoom - mouse wheel  

// angle of rotation 
float rotBuffX = 0;  
float rotBuffY = 0; 

final float rotVit = 0.01; // step of rotation 

boolean rotateMode = false; // mouse rotation 

// coords from matrix 
float x[] = new float[125]; 
float y[] = new float[125]; 
float z[] = new float[125];

int ledSelected = -1; 

void setup() { 
 size(600,600, OPENGL); 
 sphereDetail(6);
 noStroke(); 
 // mouse Wheel 
 addMouseWheelListener(new java.awt.event.MouseWheelListener() {  
   public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
     if (evt.getWheelRotation()<0) { 
       zoom+=evt.getScrollAmount()+5; 
     }  else { 
       zoom-=evt.getScrollAmount()+5; 
     } 
     redraw(); 
   } 
 } 
 ); 
} 


void draw() { 
 background(0); 
lights(); 
 //////// rotate mode 
 if (rotateMode) { 
   rotBuffX= mouseY*rotVit; 
   rotBuffY= mouseX*rotVit; 
 } 
 translate(300,300,zoom); // center cube on the screen 
 rotateX(rotBuffX); 
 rotateY(rotBuffY); 
 pushMatrix(); 
 /// show center of rotation 
 fill(255,0,0); 
 sphere(10);  
 // center of rotation 
 translate(-80, -80, -80);   
 int cnt = 0; // count 0-125 
 for (int h=0; h<5; h++) { 
   for (int i=0; i<5; i++) { 
    for (int j=0; j<5; j++) { 
     pushMatrix(); 
      translate(i*grille, j*grille, h*grille); 
      x[cnt] = screenX(0, 0, 0); 
      y[cnt] = screenY(0, 0, 0); 
      z[cnt] = screenZ(0, 0, 0); 
      boolean picked = checkDist(x[cnt],y[cnt],z[cnt],15);
      if (picked) {
          fill(255,255,255); // white if mouse over
      } else {
          fill(0,64,255); // otherwise blue 
      }
     sphere(5); 
     popMatrix(); 
     cnt++; 
    } 
   } 
 } 
 popMatrix(); 
} 

void keyPressed() { 
 if (keyCode == CONTROL) { // activate rotation mode 
   rotateMode = true; 
   loop(); 
 } 
} 

void keyReleased()   { 
 if (keyCode == CONTROL) { // deactivate rotation mode 
   rotateMode = false; 
   loop(); 
 } 
} 

boolean checkDist(float x1,float y1,float z1, float thresh) {
// check distance between mouse & object
 float theDist = dist(mouseX,mouseY,0,x1,y1,z1);
   if (theDist< thresh) {
     return true;
   } else {
       return false;
   }
}
