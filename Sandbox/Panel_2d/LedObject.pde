//class LedObject extends LedController implements Serializable
//class LedObject extends RowObject implements Serializable
class LedObject 
{

 
 /*This is the class that will be for all our led objects
 It has mulitple constuctors so that no all information needs to be entere
 for a led. 
 */
 /*TODO: should this be a string 0-0-0 ? Answer: maybe, it depends how you want the Parent (Row controller 
 to be able to address each led. It may be simpler to use an array. instead of led 000 through led 151515 you have 
 led 0 through 4095. It makes it much simpler to iterate through each one. Because the developer doesn't need
 to interact with each led in a 3d space there is no reason not to simply use integer 4095. Leds will be 
 abstracted out to row[led0,1,2,3,4....15]. A led is uniquely identifiable as (panel 0 [row0 [led0] ] )
   
 
 
 */
 
  int ledNumberInCube;
  //int   ledCoordinates; //example 000, 001 
  color ledColor;       //example red, green, blue, (255,0,0)
  float ledBrightness;  //example 0 - 4096 it will be divisable so it is a float
  int   ledSize;  

   LedObject()  // default empty constuctor, created led with no attribuetes
   {
       
   }
 
   
   LedObject(int ledNumberInCube, color ledColor, float ledBrightness, int ledSize)
   {
     
      this.ledNumberInCube = ledNumberInCube;
      this.ledColor = ledColor;
      this.ledBrightness = 255; // for testing set a perminate value and dont worry about it
      this.ledSize = 10; // for testing set to 10 and dont worry about it
   } //end constuctor
   
     //for whatever reason I cant have multiple constructors
//   LedObject(int ledColor)
//   {
//      this.ledColor = ledColor;
//   }
//   
//   
//   LedObject(int ledSize)
//   {
//      this.ledSize = ledSize;
//   }
//   
   
   
//TODO: Make this display relative to the parent
   public void displayOneLed(float ledXLocationOnScreen, float ledYLocationOnScreen)
   {
      fill(this.ledColor);
      ellipse( ledXLocationOnScreen, ledYLocationOnScreen , this.ledSize, this.ledSize);
      noFill();
      
   }
   
   
   
   

        // Led Coordinates
        //===============================
        public void setLedNumberInCube (int ledNumberInCube) 
        {
            this.ledNumberInCube = ledNumberInCube; 
            
        }                                         //end setLedCoordinates
        
        public int getLedNumberInCube()
        {
            return this.ledNumberInCube;
            
        }                                         //end getLedCoordinates
        

        
        
        // Led Color
        //================================
        public void setLedColor(color ledColor)
        {
            this.ledColor = ledColor;
            
        }                                         //end setLedColor
        
        public color getLedColor()
        {
            return this.ledColor;
        }                                         //end getLedColor
        
        
        // Led Brightness
        //================================
        public void setLedBrightness(float ledBrightness)
        {
            this.ledBrightness = ledBrightness;
            
        }                                         //end setLedBrightness
        
        public float getLedBrightness()
        {
            return this.ledBrightness;
            
        }                                         //end getLedBrightness
    
    
        // Led Size
        //==================================
        public void setLedSize(int ledSize)
        {
            this.ledSize = ledSize;
            
        }                                          //end setLedSize
        
        public int getLedSize()
        {
            return this.ledSize;
        
        }                                          //end getLedSize
    
    
    
} // end class LedObjects
