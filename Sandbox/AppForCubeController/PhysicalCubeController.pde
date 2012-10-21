public class PhysicalCubeController
{
  //Add new libraries here
   // List<String> listOfCubeTypes = new ArrayList<String>();
  
  //TODO: Make dynamic depending on what type of cube user selected
  //AdaptiveCube thePhysicalCube;
  
  String aSerialPortNumber;
  int    theBaudRate;
 
   //TODO:Test that this can be made private
  AllSparkAPI aAllSparkAPI; 

  PhysicalCubeController(AllSparkAPI aAllSparkAPI)
  {   
    this.aAllSparkAPI = aAllSparkAPI;
       /*TODO: Change this to a hashmap that calls the proper constuctor 
       // depending on what type of cube the user selected.  
       // listOfCubeTypes.add("AdaptiveCube");
       // listOfCubeTypes.add("HypnoCube");
       */
   
      /*
      1. Prompt user what type of cube they want, adaptive or hypno
      2. Prompt user which serial port they want
      3. Get baudrate from the selected cube type
      */
      
      //this.aSerialPortNumber = 0 + "";
      //this.theBaudRate = thePhysicalCube.getSerialBaudRate();
     
  }// end PhysicalCubeController Constructor
  
   public void writeSnapshotToSerial(CubeSnapshot currentlyDisplayedSnapshot, CubeSnapshot snapshotToDisplay )
   {
      println("Physical Cube Class write Method called");
      aAllSparkAPI.writeSnapshotToSerial(currentlyDisplayedSnapshot, snapshotToDisplay);
   }
  
  public String[] getAvailableSerialPorts()
  {
      //TODO: when ported to java, implement swing JOptionBox
      println( Serial.list() ) ;
      return Serial.list();
  
  }// end getAvailalbeSerialPorts

  // public void setSerialPortNumber()
  // {
  //   //TODO: Prompt user for this number
  //   int serialPortNumber = 0;
  //    // Takes a value from 0 - 4 (or however many serialports there are)
  //    // sets the current port to that number
     
  //    // Not sure why, but you must add a space to the path for it ot accept it,
  //    //  empty string wont work
  //     this.aSerialPortNumber = Serial.list()[serialPortNumber] + " ";
  
  // }// end setSerialPort
  
 public String getSerialPortNumber()
 {
     println("About to return the serialPortNumber " + aSerialPortNumber);
     return this.aSerialPortNumber;
 }// end getSerialPortNumber


 public int getSerialBaudRate()
 {
     //println("About to reutrn baudrate " + thePhysicalCube.getSerialBaudRate() );
     return aAllSparkAPI.getSerialBaudRate();
 }
  



}//end PhysicalCubeController
