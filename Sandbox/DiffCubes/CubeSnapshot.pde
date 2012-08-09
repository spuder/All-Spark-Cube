class CubeSnapshot
{
  // Create a new array of Panels 
  PanelObject[] anArrayOfPanels;
  
  //TODO: Change the parent of the master array
 public LedObject[] anArrayOfLedsInThisCube;
  


  //Panel Constuctor. Actually makes the object. 
  CubeSnapshot()
  {
    
        //Every cube creates a list of all its leds 
        this.anArrayOfLedsInThisCube = new LedObject[totalNumberOfLeds];   
        
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
        

                 
  } //end CubeSnapshot Constuctor




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


  public LedObject[] getMasterArrayOfAllLeds()
  {

    return this.anArrayOfLedsInThisCube;

  }// end getMasterArrayOfAllLeds


  public void saveAllLedsToArray()
  {
    // Loop through all 4096 leds
    // Create a duplicate of those led objects
    // Save those duplicate objects to an arrary
    //this.anArrayOfLedsInThisCube.add(aTemporaryLed)
    //Delete that led object
    //aTemporaryLed.finalize();
  }

  public void setLedColor(int ledToSetColor, int colorToSetLed ) 
  {
      anArrayOfLedsInThisCube[ledToSetColor].setLedColor(colorToSetLed);
  }

  public int getPanelThatContainsLed(int ledToFind)
  {
      int ledTotalRowNumber     = (ledToFind / xNumberOfLedsPerRow);      
      int ledPanelNumber        = (ledToFind / xNumberOfLedsPerRow / yNumberOfRowsPerPanel); //4095 would return panel 15, 300 returns panel 1 TODO:Consider renaming to locationINZ 
      //  debug("Led number " + ledToFind + " is in panel "+ ledPanelNumber + "\n");
      return ledPanelNumber;
  }

  LedObject getLedObjectForParent(int ledToFind)
  {
      return anArrayOfPanels[getPanelThatContainsLed(ledToFind)].getLedObjectForParent(ledToFind);
      //return anArrayOfRows[getRelativeRowThatContainsLed(ledToFind)].getLedObjectForParent(ledToFind);
  }

  
} // end class CubeSnapshot

