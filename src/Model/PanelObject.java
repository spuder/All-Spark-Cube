package model;

import controller.ConvertLedType;


/**
 * Write a description of class PanelObject here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

class PanelObject
{

	// Create a new array of Leds for just this panel
	RowObject[] anArrayOfRows;

	int panelCoordinateZ;

  PanelObject(int panelCoordinateZ)
  {
      
        //Add the coordinate attribute to the panel
        this.panelCoordinateZ = panelCoordinateZ;
        
        //Every panel creates an array of the number of rows
        this.anArrayOfRows = new RowObject[ CubeAttributes.getyNumberOfRowsPerPanel() ];
        
        //Create up to 16 row objects and add those objects to the array
        for ( int rowInPanelYCounter = 0; rowInPanelYCounter < CubeAttributes.getyNumberOfRowsPerPanel(); rowInPanelYCounter++ )
        {
            //Create up to 16 rows where row Y =  rowInPanelYCounter and row Z = panelCoordinateZ
            RowObject aRowObject = new RowObject( rowInPanelYCounter, this.panelCoordinateZ );
            
            //Add the row object to the array starting at array index 0 to 15
            anArrayOfRows[ rowInPanelYCounter ] = aRowObject;

            //TODO: Research if I should null the object, or if I should reuse it
            //Effective Java, Joshua Bloch
            //aRowObject = null;
          
        }//end for
        

  } //end Panel Constructor


	public RowObject getRowObject(int yPositionInPanel)
	{
		 if (yPositionInPanel < 0)
			  throw new IllegalArgumentException("yPositionInPanel must be positive, received: " + yPositionInPanel);
		 return anArrayOfRows[yPositionInPanel]; 
	}
	
	public RowObject getRowThatContainsLed(int ledToFind)
	{
		 if (ledToFind < 0)
			  throw new IllegalArgumentException("ledToFind must be positive, received: " + ledToFind);

		 int ledY = ConvertLedType.absoluteToYPositionInPanel(ledToFind);

		 return getRowObject(ledY); 
	}

} // end class RowObject
