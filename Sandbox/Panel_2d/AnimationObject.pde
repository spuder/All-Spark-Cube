// A class to contain a collection of cubes, each cube is a 
// frame of the animation sequence. 
class AnimationObject
{
  // Create a new arrayList of Cubes
  // There will only be 1 array total per project
   List<CubeSnapshot> anArrayOfCubes = new ArrayList<CubeSnapshot> ();
   
 

  //Animation Constuctor. Actually makes the object. 
  AnimationObject()
  {
        //Every Animation creates a new Cube
        //this.anArrayOfCubes = new ArrayList<CubeSnapshot> ();
        
        //Create a new cube and add it to the array
        CubeSnapshot aCube = new CubeSnapshot();
        anArrayOfCubes.add(aCube);
              
  } //end Animation Constuctor




  //Method to draw the Cube. 
  public void displayOneAnimation(int theCubeToDisplay)
  {
    
    //Display the desired cube from the list of cubes
    anArrayOfCubes.get(theCubeToDisplay).displayOneCube();
    //aTemoraryCube.displayOneCube();
    
       

  }// end displayOneAnimation


  public void addNewCubeToAnimation()
  {
            //Create a new cube and add it to the array
        CubeSnapshot aCube = new CubeSnapshot();
        anArrayOfCubes.add(aCube);
  }
  
  public CubeSnapshot getCubeFromAnimation(int CubeNumberInArrayListOfCubes)
  {
      CubeSnapshot aCube = anArrayOfCubes.get(CubeNumberInArrayListOfCubes);
      return aCube;
  }



  
  public int getHighestCubeNumberInAnimation()
  {
   // debug("anArrayOfCubes.size is " + anArrayOfCubes.size() +"\n");
    //we subtract one because we are asking for highest number
    //if there is only 1 cube then that cube is cube 0
    return anArrayOfCubes.size() - 1;
    
    
  }
  
} // end class AnimationObject

