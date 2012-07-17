
class RowObject extends LedController
{

 
  // Create a Treemap. A RowObject is a tree map of 16 items. There will be 36 row objects. 
 
   RowObject(int rowCoordinates)
   {
     
     //Add the row cordinates to the object
      this.rowCoordinates = rowCoordinates;
      
      /*Create an array list  ledArrayList[led000,led001] up to 16 characters in length
            Add 16 of those to the array list, (The array list wont allways start with led000. 
                        
                        If we are creating the row at y0 z0 then the array would include  [led0 -   led 15]
                        If we are creating the row at y1 z0 then the array would include  [led16 -  led 31]
                        If we are creating the row at y2 z0 then the array would include  [led32 -  led 47]
                        If we are creating the row at y15 z0 then the array would include [led256 - led 271]
                        If we are creating the row at y0 z1 then the array would include  [led272 - led 287]
                        formula = (1 + y + z * 16 )* 16 -16  // Just so you know that took FOREVER!!! to figure out!!!!
                        // the 16 at the end is because we are using base 0
                        
         
      
      15,0[ 256 - 271 ]16          
      
      
      4,0[  64 -  79 ]
      3,0[  48 -  63 ]4          3,1[ 304 - 319 ]19
      2,0[  32 -  47 ]3          2,1[ 288 - 303 ]18
      1,0[  16 -  31 ]2          1,1[ 272 - 287 ]17
      0,0[   0 -  15 ]1          0,1[ 256 - 271 ]16
      
       Add each led object to that led list
      */
    
      
  //    LedController aLedController = new LedController();
 
   } //end constuctor
   

   
   public void displayOneRow()
   {
     // fill(this.ledColor);
     // ellipse(this.ledSize, this.ledSize, 10, 10 );
      
   }
//   public void displayOneLed(int ledXLocationOnScreen, int ledYLocationOnScreen)
//   {
//      fill(this.ledColor);
//      ellipse( ledXLocationOnScreen, ledYLocationOnScreen , this.ledSize, this.ledSize);
//      
//   }
//   
   
   
   

        // Row Coordinates
        //===============================
        public void setRowCoordinates (int ledCoordinates) 
        {
          //  this.ledCoordinates = ledCoordinates; 
            
        }                                         //end setLedCoordinates
        
        public int getRowCoordinates()
        {
          //  return this.ledCoordinates;
            
        }                                         //end getLedCoordinates
        
        

    
    
} // end class RowObject


