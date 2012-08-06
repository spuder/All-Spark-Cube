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
public class HypnoCube implements AllSparkAPI
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
  int serialBaudRate = 9600;
  List<Integer> HypnoMessageStruture = new ArrayList<Integer>();
  
    
  HypnoCube()
  {
      this.serialBaudRate = serialBaudRate;
    
  }// end AdaptiveCube constructor
  
  void writeSnapshotToSerial(CubeSnapshot currentlyDisplayedSnapshot, CubeSnapshot snapshotToDisplay )
  {
      println("Hypno Class serial method called, About to write snapshot to serial");
      //Get the current CubeSnapshot √
      //Get the snapshot to change to √
      //Create a transmisison object = diff of current snapshot and 
        //next snapshot( this is what makes the adaptive cube unique )
      //Generate first 255 characters of message
      //Send those 255 characters to serial port
      
    
  }// end writeCurrentSnapshotToSerial


  
  
 public int getSerialBaudRate()
 {
     return this.serialBaudRate;
 }
  
  
  
}// end AdaptiveCube
