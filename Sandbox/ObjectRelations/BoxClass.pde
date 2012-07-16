/*
This code is to experiment with different relations of objects

How to draw a box with leds inside it. The leds are not drawn relative to the 
screen but relative to the box. 
Based on Processing example

A Project has many Snapshots, a snapshot has many panels, 
those panels can be extended to a cube, the panels have 
many leds, an led has many states/colors/brightness

*/

 class BoxClass extends ObjectRelations {
 
 // float xLocation, yLocation; // this must be global because multiple methods use it
  
    BoxClass(  float xLocation, float  yLocation) {  //Default Constructor
    rect( xLocation, yLocation, 55, 55 ); //create a rectangle 55 pixels by 55 pixels at specified location
    
   
    } //end default constructor BoxClass
    
    void display() {
      
       
    }//end BoxClass.display()
    
    
    void moveBox(float xTranslateAmount, float yTranslateAmount) {
      
      translate( xTranslateAmount, yTranslateAmount);
      
    } // end BoxClass.moveBox()
    
    
  
}//end class BoxClass


