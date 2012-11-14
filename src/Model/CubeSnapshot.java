package model;


/**
 * Write a description of class CubeSnapshot here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class CubeSnapshot
{
  // Create a new array of Panels 
  PanelObject[] anArrayOfPanels;
  
  //TODO: Change the parent of the master array
 public LedObject[] anArrayOfLedsInThisCube;
  

  //Panel Constructor. Actually makes the object. 
  CubeSnapshot()
  {
    
        //Every cube creates a list of all its leds 
       // this.anArrayOfLedsInThisCube = new LedObject[AllSparkAPI.getTotalNumberOfLeds()];   
        
        //Every panel creates an array of 16 rows
        this.anArrayOfPanels = new PanelObject[ CubeAttributes.getzNumberOfPanelsPerCube() ];
        
        //Create  row objects and add those objects to the array
        for ( int panelInCubeCounter = 0; panelInCubeCounter < CubeAttributes.getzNumberOfPanelsPerCube(); panelInCubeCounter++ )
        {
            //Create up to 16 Panels Objects
            PanelObject aPanelObject = new PanelObject( panelInCubeCounter );
            
            //Add the row object to the array starting at array index 0 to 15
            anArrayOfPanels[ panelInCubeCounter ] = aPanelObject;
            
          //TODO: Research if I should null the object, or if I should reuse it
            //Effective Java, Joshua Bloch
            //aPanelObject = null;
          
        }//end for

                 
  } //end CubeSnapshot Constructor

  public PanelObject getPanelObject(int zPanelPositionInCube)
  {
	  if (zPanelPositionInCube < 0)
		  throw new IllegalArgumentException("zPanelPositionInCube must be positive, received: " + zPanelPositionInCube);
 	 return anArrayOfPanels[zPanelPositionInCube]; 
  }



  
} // end class CubeSnapshot
