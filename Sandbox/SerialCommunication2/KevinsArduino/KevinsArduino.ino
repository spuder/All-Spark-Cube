

/*I think you’re dealing with buffering issues somewhere.  
The Arduino USART uses buffered IO, and serial.read pulls 
from that buffer.  Here is my serial receiver code, with the 
bit 7 detection included and with a buffer overflow detector, 
which I call once per loop.  */



// Declare these global variables.

byte rxBuffer[255];                         // Incoming Packet Storage.

int byteCounter = 0;                       // Incoming Byte Counter.



void SerialReceiver
{

    While (serial.available >0)

    {

        rxBuffer[bytecounter] = serial.read();    // read the next byte from the serial buffer.

        If (rxBuffer[byteCounter] >= 128)            // check for the opening packet delimiter (bit 7 set)
        {
            byteCounter = 0 // reset the byte counter to resync the packet.
        }

        If (byteCounter == 255) // check for receive buffer overflow.
        {
            Bytecounter = 0; // Buffer Overflow.  Reset the byte pointer.
        }

        bytecounter ++;                                                               // increment the byte pointer.

        if (bytecounter > 1) // check if the message type and length bytes have arrived.

        {

            If (rxBuffer[1] >= byteCounter) // check the Length Byte against the total bytes received.
            {
                // We have enough bytes to process one packet.

                // check the MsgType and call the appropriate protocol message processor.

                  Switch (rxBuffer[0])
                  {
                  Case 139 :            // SetVoxel Command

                        // Process the SetVoxel Message
                        setVoxel(rxBuffer);
                        break;
                  case othermessagetype :
                        // Process other message types
                        Break;
                  }
                    // reset the byte counter to receive the next packet.
                  byteCounter = 0;

            }

        } 

    }//end While

}// end SerialBuffer


/*
You can see that the code always regains sync by just looking for the byte with the 7th bit set (value greater than or equal to 128).  It simply resets the packet byte counter if a character with bit 7 arrives set.   Once the Arduino identifies the first (msg type) byte, then the next byte WILL be the length byte.  If the length byte is corrupted or if either byte is lost, then we simply wait for the next delimiter and ignore the bad data.  
This solves the issue sync issue you are experiencing.
To implement this, you only have to change the Message Type from 11 decimal (hex  0x0B) to 139 decimal (hex 8B).  And we’ll shift all of future message types to plus 128 to make this happen (which effectively sets the MSB to 1).  Easy fix. 



If you still get missing characters or out of sync messages even with this code, then we’ll have to look deeper into the problem..



We can also acknowledge receipt of each packet if that would help you. 



I’ll be in the garage.  Text me if you respond and I’ll come check my email.  Or call me.



Kevin

*/
