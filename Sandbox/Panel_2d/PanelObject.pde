
class PanelObject
{

  RowObject[] anArrayOfRows;
  // Create a new array of Leds for just this row (16 long)

  int panelCoordinateZ;
  


  //Panel Constuctor. Actually makes the object. 
  PanelObject(int panelCoordinateZ)
  {
      
        //Add the coordinate attribute to the panel
        this.panelCoordinateZ = panelCoordinateZ;
        
        //Every panel creates an array of 16 rows
        this.anArrayOfRows = new RowObject[yNumberOfRowsPerPanel];
        
        //Create up to 16 row objects and add those objects to the array
        for (int rowInPanelYCounter = 0; rowInPanelYCounter < yNumberOfRowsPerPanel; rowInPanelYCounter++)
        {
            //Create up to 16 rows where row Y =  rowInPanelYCounter and row Z = panelCoordinateZ
            RowObject aRowObject = new RowObject(rowInPanelYCounter, this.panelCoordinateZ);
            
            //Add the row object to the array starting at array index 0 to 15
            anArrayOfRows[rowInPanelYCounter] = aRowObject;
            
            //Decomission the object to the java garbage collector will come delete it
            aRowObject = null;
          
        }//end for
        
        //Call the java garbage collector to delete the temporary objects. 
        //TODO: Research if this acutally helps speed up program
        //System.gc();
        

                 
  } //end Panel Constuctor




  //Method to draw the panel. 
  public void displayOnePanel()
  {

        //For each panel draw the associated rows. 
        for (int rowInPanelCounter = 0; rowInPanelCounter < zNumberOfPanelsPerCube; rowInPanelCounter++ )
        {
            //Draw every row that is a part of this panel
            this.anArrayOfRows[rowInPanelCounter].displayOneRow(); 
        }//end for loop

  }// end displayOneRow


  //Calling aPanel.getPanelCoordinate from parent class will 
  //return the integer of the panel object 0 -15
  public int getPanelCoordinate()
  {
      return this.panelCoordinateZ;

  }//end getPanelCoordinate


  
} // end class RowObject

