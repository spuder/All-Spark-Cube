/*
Implementation for the Adaptive Computing All Spark Cube
The Adaptive Cube consists of 16 x 16 x 16 RGB leds. 
Due to the limitaions of the usb->serial, only the leds that have changed
states are sent over the serial. To save bandwith only the code number for
a command is sent , and the led/pane that command applies to. The codes are
listed below. The most common will be #11 SetVoxel. A voxel is the terminology
used by seekway for one led. 
Message layout is
[Message Type, MessageLength, x, y, z, data, x, y, z, data.....]
The limit for each message is 255
If you wanted to set led# 000 and 15,15,15 to red the message would look like this
[11, 8, 0,0,0,red,15,15,15,red]
**red may be changed to a table value as well
*/
public class AdaptiveCube implements AllSparkAPI
{
  /*
  Protocol List
  1 KeepAlive
  2 SetValue
  3 GetValue
  4 ValueReport
  5 setMode
  6 ModeReport
  7 ClearCube
  8 AllOn
  9 PlaneOn
  10 PlaneOff
  11 SetVoxel
  plus more
  */
  int serialBaudRate = 15200;
  List<Integer> adaptiveMessageStruture = new ArrayList<Integer>();

  List<Byte> messageToSend = new ArrayList<Byte>();
  
    
  AdaptiveCube()
  {
      this.serialBaudRate = serialBaudRate;
    
  }// end AdaptiveCube constructor
  
  void writeSnapshotToSerial(CubeSnapshot currentlyDisplayedSnapshot, CubeSnapshot snapshotToDisplay )
  {


      println("Adaptive Class serial method called, About to write snapshot to serial");
      //Get the current CubeSnapshot √
      //Get the snapshot to change to √
      //Create a transmisison object = diff of current snapshot and 
        //next snapshot( this is what makes the adaptive cube unique )
      //Generate first 255 characters of message
      //Send those 255 characters to serial port

      //Clear the Array for the new data
      messageToSend.clear();
      
    
  }// end writeCurrentSnapshotToSerial

  //method to only add the data that has changed to an array
  void diffTwoSnapshots(CubeSnapshot currentlyDisplayedSnapshot, CubeSnapshot snapshotToDisplay )
  {
    int numberOfLedsToChange = 0;

    //Clear the message
    messageToSend.clear();

    //Add the header information to the message
    //11 means setVoxel (set led)
    //messageToSend.add(11);
    //This is how many bytes the adaptive cube will look for, for now
    //it is zero, we wont know until we start counting
    //messageToSend.add(numberOfLedsToChange);

    //Look at every led 1 by 1, 

    //If the led is different, convert it's data from absolute to relative

    //Add the x y z and coordinate to the message

    //Update the messageToSend Length


  }

  
  
 public int getSerialBaudRate()
 {
     return this.serialBaudRate;
 }
  
  

  
}// end AdaptiveCube
