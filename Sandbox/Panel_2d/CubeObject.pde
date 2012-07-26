
class CubeObject
{
  // Create a new array of Panels 
  PanelObject[] anArrayOfPanels;

  //Panel Constuctor. Actually makes the object. 
  CubeObject()
  {
      

        
        //Every panel creates an array of 16 rows
        this.anArrayOfPanels = new PanelObject[zNumberOfPanelsPerCube];
        
        //Create up to 16 row objects and add those objects to the array
        for (int panelInCubeCounter = 0; panelInCubeCounter < zNumberOfPanelsPerCube; panelInCubeCounter++)
        {
            //Create up to 16 Panels Objects
            PanelObject aPanelObject = new PanelObject(panelInCubeCounter);
            
            //Add the row object to the array starting at array index 0 to 15
            anArrayOfPanels[panelInCubeCounter] = aPanelObject;
            
            //Decomission the object to the java garbage collector will come delete it
            aPanelObject = null;
          
        }//end for
        
        //Call the java garbage collector to delete the temporary objects. 
        //TODO: Research if this acutally helps speed up program
        System.gc();
        

                 
  } //end Panel Constuctor




  //Method to draw the panel. 
  public void displayOneCube()
  {

        // For each cube draw the associated panels. 
        for (int panelInCubeCounter = 0; panelInCubeCounter < zNumberOfPanelsPerCube ; panelInCubeCounter++ )
        {
            //Draw every row that is a part of this panel
            this.anArrayOfPanels[panelInCubeCounter].displayOnePanel(); 
        }//end for loop

  }// end displayOneRow


//  //Calling aPanel.getPanelCoordinate from parent class will 
//  //return the integer of the panel object 0 -15
//  public int getPanelCoordinate()
//  {
//      return this.panelCoordinateZ;
//
//  }//end getPanelCoordinate


  
} // end class RowObject

