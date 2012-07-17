
public class RowController 
{


  //These are inherited by the child class
  //=====================================
  int[] rowCoordinates; //example 00, 01   

  TreeMap treeMapOfRows = new TreeMap();

//TODO: I am tired ,do I really need to add the row objects to the treemap or are they already uniquily identifiable?


  //default constructor
  RowController() {
  }


  //Create the number of rows specifed by the parent a cube has 16 panels, a panel has 16 rows, a row has 16 leds
  RowController(int yNumberOfRows ) // in all my tests this will be 16
  {
     //Create a bunch of row objects (256) that are identifed by rowCoordinates [0,0] through [15,15]
     
     //for loop to create 256 row objects
     for (int yRowIterator = 0; yRowIterator < yNumberOfRows; yRowIterator ++ )
       {
           for (int zRowIterator = 0; zRowIterator < zNumberOfPanels; zRowIterator ++)
           {
             rowCoordinates = new int[2] ;
             rowCoordinates[0] = yRowIterator;
             rowCoordinates[1] = zRowIterator;
             
             RowObject aRowObject = new RowObject(rowCoordinates);
             
             //Add row object to treemap 
             
           }
           
         
       }
       
  }// end RowController Constructor
    

  void displayOneRow()
  {
    /*
    Methodology to display one row
    Get the location relative to the parent where we want to draw it. The parent could be the processing
    window, but more likely is the relative location inside a plane/panel
    Since a row does not have a physical shape, but rather draws leds, then loop through the drawOneLed.
    for each loop - number of leds inside a row
        if you said the left side of the row should be drawn at (50 pixels in, screen.height/2)
      drawOneLed (
        
      
    */
  }



  
} // end class RowController

