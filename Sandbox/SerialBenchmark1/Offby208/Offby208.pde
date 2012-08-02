import processing.serial.*;

//import cc.arduino.*;

 
 int aNumberInt = 1;
 byte aNumberByte = 1;
void setup()
{ 
  Serial aSerialPort = new Serial(this,9600);
 
  println( aNumberInt );
  println( aNumberByte);
  aSerialPort.write( aNumberInt );
}

void draw()
{
  
}
