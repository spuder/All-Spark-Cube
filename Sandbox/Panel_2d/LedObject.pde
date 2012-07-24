
class LedObject 
{


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
      
      // for testing set a perminate value and dont worry about it
      this.ledBrightness = 255; 
      
      // for testing set to 10 and dont worry about it
      this.ledSize = 10; 
      
   } //end constuctor
   
   
   

  public void displayOneLed()
   {
     
     
      fill(this.ledColor);
      
      
        //if the mouse x is > (led pixel locationX - 5) and < the (led pixel location + 5) then the mouse is in the same column as this led
        //if the mouse y is > (led pixel locationY - 5) and < the (led pixel location + 5) then the mouse is in the same row  as this led. 
        if (   (mouseX > this.ledXPixelLocation - (this.ledSize / 2 +2) ) //the plus 2 makes the hover a little more forgiving. but could cause problems on very close leds. 
            && (mouseX < this.ledXPixelLocation + (this.ledSize / 2 +2) ) 
            && (mouseY > this.ledYPixelLocation - (this.ledSize / 2 +2) ) 
            && (mouseY < this.ledYPixelLocation + (this.ledSize / 2 +2) ) )
        {
              //If we have hovered over the led and clicked, then change the color
              if ( ledHasBeenClicked  == true)
              {
                
                //Change the current leds color to the key that was pressed earlier (red, green, blue, ect)
                this.setLedColor(activeColor);
                
                // reset so that one click only changes 1 led. Future versions will also incorperate multiple led functionality
                ledHasBeenClicked = false; 
                
              }//end if ledHasBeenClicked
              
          // if the mouse is over an led, draw the active color line around it
          stroke(activeColor); 
          
        }//end if mousePosition = led
        
      
      // draw the led to the screen The location on screen is saved in the objects attributes
      ellipse( this.ledXPixelLocation, this.ledYPixelLocation , this.ledSize, this.ledSize); 
      
      //Stroke method is no longer needed, set stroke to nothing.
      noStroke();
      
      //Fill method is no longer needed, set fill to nothing
      noFill();
      
   }//end displayOneLed
   
   
   
   

        public int getLedNumberInCube()
        {
            return this.ledNumberInCube;    
        }//end getLedCoordinates
        

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
        }//end getLedNumberInRow
        
        
        // Led Color
        //================================
        public void setLedColor(color ledColor)
        {
            this.ledColor = ledColor;
            
        }//end setLedColor
        
        public color getLedColor()
        {
            return this.ledColor;
        }//end getLedColor
        
        
        // Led Brightness
        //================================
        public void setLedBrightness(float ledBrightness)
        {
            this.ledBrightness = ledBrightness;
            
        }                                         //end setLedBrightness
        
        public float getLedBrightness()
        {
            return this.ledBrightness;
            
        }//end getLedBrightness
    
    
        // Led Size
        //==================================
        public void setLedSize(int ledSize)
        {
            this.ledSize = ledSize;
            
        }//end setLedSize
        
        public int getLedSize()
        {
            return this.ledSize;
        
        }//end getLedSize
    
    
        // Led Location
        //==================================
        public void setLedXPixelLocation(int ledXPixelLocation)
        {
            this.ledXPixelLocation = ledXPixelLocation;
        }
        
        public int getLedXPixelLocation()
        {
            return this.ledXPixelLocation;
        }
        
        
        public void setLedYPixelLocation(int ledYPixelLocation)
        {
            this.ledYPixelLocation = ledYPixelLocation;
        }
        
        public int getLedYPixelLocation()
        {
            return this.ledYPixelLocation;
        }

    
    
} // end class LedObjects
