// A class to contain a collection of cubes, each cube is a 
// frame of the animation sequence. 
class AnimationObject
{
  // Create a new arrayList of Cubes
  // There will only be 1 array total per project
   List<CubeObject> anArrayOfCubes = new ArrayList<CubeObject> ();
   
 

  //Animation Constuctor. Actually makes the object. 
  AnimationObject()
  {
        //Every Animation creates a new Cube
        //this.anArrayOfCubes = new ArrayList<CubeObject> ();
        
        //Create a new cube and add it to the array
        CubeObject aCube = new CubeObject();
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
        CubeObject aCube = new CubeObject();
        anArrayOfCubes.add(aCube);
  }
  
  public CubeObject getCubeFromAnimation(int CubeNumberInArrayListOfCubes)
  {
      CubeObject aCube = anArrayOfCubes.get(CubeNumberInArrayListOfCubes);
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

