float xmag, ymag = 0;
float newXmag, newYmag = 0; 
int redColorVar;
int greenColorVar;
int blueColorVar;



//   setup() === runs once ===========================================
void setup() 
{
  // Create a window
  size(800, 800, P3D); /*Size must always be first, P3D is suns JOGL library for fast rendering, with processings easy export*/
  noStroke(); // Not sure what it does
  colorMode(RGB, 2); // Not sure what it does
   redColorVar = 0;
   greenColorVar = 0;
   blueColorVar = 0;
    
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





void mousePressed() {
  

       //background(192, 64, 0);
       
       // every time mouse is clicked, change color
 
       //if red is selected, change to green
       
       switch(redColorVar)
       {
         case 0:
             println("red is "+ redColorVar + " checking green");
             switch(greenColorVar)
             {
                 case 0:
                     println("green is "+ greenColorVar + " checking blue");
                     switch(blueColorVar)
                     {  
                        case 0:
                              println("blue is "+ blueColorVar);
                              println("");
                              println("cube is black, setting to red");
                              println("red is " + redColorVar);
                              //led is black, turn red
                              redColorVar=1;
                              println("red is " + redColorVar);
                              break;
                              
                             
                        case 1:
                            blueColorVar = 0;
                            redColorVar = 1;
                            
                     }//end blue
                     
                 case 1:
                 greenColorVar = 0;
                 blueColorVar = 1;
                 
             }//end green
       case 1:
          redColorVar = 0;
          blueColorVar = 0;
          
     }//end red

    
      
       
     }

