public class Embedded extends PApplet {

     public void setup() {
         // original setup code here ...
         size(400, 400);

         // prevent thread from starving everything else
         noLoop();
     }

     public void draw() {
         // drawing code goes here
     }

     public void mousePressed() {
         // do something based on mouse movement

         // update the screen (run draw once)
         redraw();
     }
 }
 
