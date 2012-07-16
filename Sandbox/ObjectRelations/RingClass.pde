/*
This code is to experiment with different relations of objects

How to draw a box with leds inside it. The leds are not drawn relative to the 
screen but relative to the box. 
Based on Processing example

A Project has many Snapshots, a snapshot has many panels, 
those panels can be extended to a cube, the panels have 
many leds, an led has many states/colors/brightness

*/


/*
The extends means it can pass to its parent
any values it likes. It can also get a copy of the
parent. So if the parent location is x the child can 
also have a ocpy of it. To get the ineritance, You use the super() method. 
This is how an object can move in relation to another one
*/
 class RingClass  { 
   
   
float xLocation;
float yLocation;

  
    //Default Constructor
    RingClass(float xLocation, float yLocation) {
       // super(xLocation, yLocation); // get the x and y from the parent and apply it to itself. 
     this.xLocation = xLocation;
     this.yLocation = yLocation;
  
    } // end constructor RingClass
    
    
    void displayRing(int ringXLocation, int ringYLocation) {
        strokeWeight(1);
        ellipse(ringXLocation, ringYLocation, 50, 50);
      
     
    } //end display()
    
    
    
  
}//end class RingClass


