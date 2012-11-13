package model;
import java.util.ArrayList;

import controller.ConvertLedType;

/**
 * Write a description of class AnimationOfSnapshots here.
 * 
 * @author (your name) 
 * @2.0
 */
public class AnimationOfSnapshots
{
  // Create a new arrayList of Cubes
  // There will only be 1 array total per project
   ArrayList<CubeSnapshot> anArrayOfCubeSnapshots = new ArrayList<CubeSnapshot> ();
   
 
    public AnimationOfSnapshots()
    {
        //Create a new cube and add it to the array
        CubeSnapshot aCubeSnapshot = new CubeSnapshot();
        
        anArrayOfCubeSnapshots.add( aCubeSnapshot );
              
    }

   public void addNewCubeToAnimation()
  {
        //Create a new cube and add it to the array
        CubeSnapshot aCubeSnapshot = new CubeSnapshot();
        
        anArrayOfCubeSnapshots.add( aCubeSnapshot );
  }
  
 
  public CubeSnapshot getCubeFromAnimation( int CubeNumberInArrayListOfCubes )
  {
      CubeSnapshot aCubeSnapshot = anArrayOfCubeSnapshots.get(CubeNumberInArrayListOfCubes);
      return aCubeSnapshot;
  }



  
  public int getHighestCubeNumberInAnimation()
  {
   // debug("anArrayOfCubeSnapshots.size is " + anArrayOfCubeSnapshots.size() +"\n");
    //we subtract one because we are asking for highest number
    //if there is only 1 cube then that cube is cube 0
    return anArrayOfCubeSnapshots.size() - 1;
    
    
  }
  
  public LedObject getLed(int cubeNumber, int ledNumber)
  {
	  //TODO: 
	  return null;
  }
  
  
  public LedObject getLed(int cubeNumber, int ledX, int ledY, int ledZ)
  {
	  
	  //Calls the method getLed using different format
	  return getLed(cubeNumber, ConvertLedType.relativeToAbsolute(ledX, ledY, ledZ) );
  }
  
}// end class AnimationOfSnapshots
