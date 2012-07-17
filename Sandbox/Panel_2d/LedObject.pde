class LedObject extends LedController
{

 
 /*This is the class that will be for all our led objects
 It has mulitple constuctors so that no all information needs to be entere
 for a led. 
 */
 //TODO: should this be a string 0-0-0 ? 
//int   ledCoordinates; //example 000, 001 
//color ledColor;       //example red, green, blue, (255,0,0)
//float ledBrightness;  //example 0 - 4096 it will be divisable so it is a float
//int   ledSize;     
 /*  LedObject()  // default empty constuctor, created led with no attribuetes
   {
       
   }
   //for whatever reason I cant have multiple constructors
   */
  // LedObject(){}
   
   LedObject(int ledCoordinates, color ledColor, float ledBrightness, int ledSize)
   {
     
      this.ledCoordinates = ledCoordinates;
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
   
   
   public void displayOneLed()
   {
      fill(this.ledColor);
      ellipse(this.ledSize, this.ledSize, 10, 10 );
      
   }
   public void displayOneLed(int ledXLocationOnScreen, int ledYLocationOnScreen)
   {
      fill(this.ledColor);
      ellipse( ledXLocationOnScreen, ledYLocationOnScreen , this.ledSize, this.ledSize);
      
   }
   
   
   
   

        // Led Coordinates
        //===============================
        public void setLedCoordinates (int ledCoordinates) 
        {
            this.ledCoordinates = ledCoordinates; 
            
        }                                         //end setLedCoordinates
        
        public int getLedCoordinates()
        {
            return this.ledCoordinates;
            
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
