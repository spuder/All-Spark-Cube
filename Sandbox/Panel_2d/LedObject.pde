//class LedObject extends LedController implements Serializable
//class LedObject extends RowObject implements Serializable
class LedObject 
{

 
 /*TODO: should this be a string 0-0-0 ? Answer: maybe, it depends how you want the Parent (Row controller 
 to be able to address each led. It may be simpler to use an array. instead of led 000 through led 151515 you have 
 led 0 through 4095. It makes it much simpler to iterate through each one. Because the developer doesn't need
 to interact with each led in a 3d space there is no reason not to simply use integer 4095. Leds will be 
 abstracted out to row[led0,1,2,3,4....15]. A led is uniquely identifiable as (panel 0 [row0 [led0] ] ) and absolute 4095

 */
 
  int   ledNumberInCube;
  color ledColor;       //example red, green, blue, (255,0,0)
  float ledBrightness;  //example 0 - 4096 it will be divisable so it is a float
  int   ledSize;
  int   ledXPixelLocation;
  int   ledYPixelLocation;


   LedObject(int ledNumberInCube, color ledColor, float ledBrightness, int ledSize)
   {
     
      this.ledNumberInCube = ledNumberInCube;
      this.ledColor = ledColor;
      this.ledBrightness = 255; // for testing set a perminate value and dont worry about it
      this.ledSize = 10; // for testing set to 10 and dont worry about it
   } //end constuctor
   
   
   
//TODO: Make this display relative to the parent
  // public void displayOneLed(float ledXLocationOnScreen, float ledYLocationOnScreen)
  public void displayOneLed()
   {
     
     //Draw a white line around the led if the mouse is over it. 
     
      fill(this.ledColor);
      
      
      
      //if the mouse x is > (led pixel locationX - 5) and < the (led pixel location + 5) then the mouse is in the same column as this led
      //if the mouse y is > (led pixel locationY - 5) and < the (led pixel location + 5) then the mouse is in the same row  as this led. 
      if (   (mouseX > this.ledXPixelLocation - (this.ledSize / 2) ) 
          && (mouseX < this.ledXPixelLocation + (this.ledSize / 2) ) 
          && (mouseY > this.ledYPixelLocation - (this.ledSize / 2) ) 
          && (mouseY < this.ledYPixelLocation + (this.ledSize / 2)   ) )
      {
        stroke(255); // if the mouse is over an led, draw a white line around it
      }
      
      
      ellipse( this.ledXPixelLocation, this.ledYPixelLocation , this.ledSize, this.ledSize); // draw the led to the screen 
      noStroke();
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
        

        public int getLedNumberInRow()
        {
            //If you pass in a number such as 65 it would return 1 because led is the second led in row
            //Find first led in row
            //subtract firstLedInRow from ledNumberInCube
            //Subtract 1 for base 0

            int ledTotalRowNumber = (this.ledNumberInCube / xNumberOfLedsPerRow); // 48 would return 3rd row TODO:Consider renaming locationInY
            int ledPanelNumber = (this.ledNumberInCube / xNumberOfLedsPerRow / yNumberOfRowsPerPanel); //4095 would return panel 15, 300 returns panel 1 TODO:Consider renaming to locationINZ 
            int ledVerticalRowNumber = (ledTotalRowNumber - (yNumberOfRowsPerPanel * ledPanelNumber)); //we need to know how high from the ground, not how many rows there are total
	    int firstLedInRow = ((1 + ledVerticalRowNumber + ledPanelNumber * zNumberOfPanels ) * yNumberOfRowsPerPanel - xNumberOfLedsPerRow);
	  return (this.ledNumberInCube - firstLedInRow);
        }
        
        
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
    
    
        
        public void setLedXPixelLocation(int ledXPixelLocation)
        {
          this.ledXPixelLocation = ledXPixelLocation;
        }
        
        public void setLedYPixelLocation(int ledYPixelLocation)
        {
          this.ledYPixelLocation = ledYPixelLocation;
        }
        
        public int getLedXPixelLocation()
        {
          return this.ledXPixelLocation;
        }
        
        public int getLedYPixelLocation()
        {
          return this.ledYPixelLocation;
        }

    
    
} // end class LedObjects
