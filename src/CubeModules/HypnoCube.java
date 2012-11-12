package cubeModules;

import java.util.ArrayList;


/**
 * Write a description of class AdaptiveCube here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
/*

*/
public class HypnoCube implements controller.AllSparkAPI
{

  int serialBaudRate = 9600;
  ArrayList<Integer> adaptiveMessageStruture = new ArrayList<Integer>();

  ArrayList<Byte> messageToSend = new ArrayList<Byte>();
  
    
  HypnoCube()
  {
      this.serialBaudRate = serialBaudRate;
    
  }// end HypnoCube constructor
  
  public void writeToSerial(model.CubeSnapshot currentlyDisplayedSnapshot, model.CubeSnapshot snapshotToDisplay )
  {



      //Clear the Array for the new data
      messageToSend.clear();
      
    
  }// end writeCurrentSnapshotToSerial

  //method to only add the data that has changed to an array
  void diffTwoSnapshots( model.CubeSnapshot currentlyDisplayedSnapshot, model.CubeSnapshot snapshotToDisplay )
  {
    int numberOfLedsToChange = 0;

    //Clear the message
    messageToSend.clear();



  }

  
 public int getSerialBaudRate()
 {
     return this.serialBaudRate;
 }
  
 public int getXNumberOfLedsPerRow()
 {
    return 8;    
 }
  
 public int getYNumberOfLedsPerPanel()
 {
    return 8;    
 }
 public int getZNumberOfPanelsPerCube()
 {
    return 8;    
 }
public int getTotalNumberOfLeds()
{
    //TODO: Return 4095, check for 0's which will screw everything up. 
    return 0;
}
  
}// end AdaptiveCube