float xmag, ymag = 0;
float newXmag, newYmag = 0; 
int redColorVar = 0;
int greenColorVar = 0;
int blueColorVar = 0;



//   setup() === runs once ===========================================
void setup() 
{
  // Create a window
  size(800, 800, P3D); /*Size must always be first, P3D is suns JOGL library for fast rendering, with processings easy export*/
  noStroke(); // Not sure what it does
  colorMode(RGB, 2); // Not sure what it does
  
}//end setup()============================================================




//   draw() === repeats continuiously ===============================
void draw() 
{
  //ellipse(40,40,mouseX,mouseY);
  //background(192,64,0);
 //ellipse(width/2,width/2,mouseX,mouseY);
 
 background(0.5); // Dark grey background, 0=black 1=white?
 pushMatrix(); // not sure
 translate(width/2, height/2, -30); // not sure
 newXmag = mouseX/float(width) * TWO_PI; //not sure
 newYmag = mouseY/float(height) * TWO_PI; // not sure
 float diff = xmag-newXmag;
 
 if (abs(diff) >  0.01) { xmag -= diff/4.0; }
 diff = ymag-newYmag;
 
 if (abs(diff) >  0.01) { ymag -= diff/4.0; }
 
 rotateX(-ymag); 
 rotateY(-xmag); 
 
 scale(150); // not sure
 
 beginShape(QUADS);


 fill(redColorVar,blueColorVar,greenColorVar);  vertex(-1,  1,  1);
 fill(redColorVar,blueColorVar,greenColorVar);  vertex( 1,  1,  1);
 fill(redColorVar,blueColorVar,greenColorVar);  vertex( 1, -1,  1);
 fill(redColorVar,blueColorVar,greenColorVar);  vertex(-1, -1,  1);

vertex( 1,  1,  1);
vertex( 1,  1, -1);
vertex( 1, -1, -1);
vertex( 1, -1,  1);

vertex( 1,  1, -1);
vertex(-1,  1, -1);
vertex(-1, -1, -1);
vertex( 1, -1, -1);

vertex(-1,  1, -1);
vertex(-1,  1,  1);
vertex(-1, -1,  1);
vertex(-1, -1, -1);

vertex(-1,  1, -1);
vertex( 1,  1, -1);
vertex( 1,  1,  1);
vertex(-1,  1,  1);

vertex(-1, -1, -1);
vertex( 1, -1, -1);
vertex( 1, -1,  1);
vertex(-1, -1,  1);

  endShape();
  popMatrix(); /* Without this line, you will get too may calls to pushMatrix(), suspect this empties the buffer so the program doesn't freeze*/
  
}// end draw()============================================================





void mousePressed() 
{
  // Prevents code from undoing what it just did
boolean recentlyChanged = false;
  if (redColorVar == 0 && greenColorVar == 0 && blueColorVar == 0)
  {
    redColorVar =2;
    recentlyChanged = true;
    logging(); 
  }
  
  if (redColorVar ==2 && recentlyChanged == false)
  {
    redColorVar = 0;
    greenColorVar = 2;
    recentlyChanged = true;
  }
  
  if (greenColorVar ==2 && recentlyChanged == false)
  {
    greenColorVar = 0;
    blueColorVar = 2;
    recentlyChanged = true;
  }
  
  if (blueColorVar ==2 && recentlyChanged == false)
  {
    // Will now be black
    blueColorVar = 0;
    recentlyChanged = true;
  }

redraw();

       
 }
 

void logging()
{
  println("Red = " +redColorVar);  
  println("Green = " +greenColorVar); 
  println("Blue = " +blueColorVar); 
  println("");
}


