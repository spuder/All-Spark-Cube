/*
http://en.wikipedia.org/wiki/Strategy_pattern
*/
public interface AllSparkAPI
{
  
  void writeSnapshotToSerial(CubeSnapshot currentlyDisplayedSnapshot, CubeSnapshot snapshotToDisplay );
  int getSerialBaudRate();
  
}// end intrface AllSparkAPI
