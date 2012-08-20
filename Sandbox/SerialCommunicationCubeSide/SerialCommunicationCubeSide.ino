// declare these values as global.

int serialPointer = 0;

byte serialBuffer[256];

//byte serialPointer = 0;

byte messages_SetVoxel = 139;

messages_StatusMessage = 140 ;

 

void readSerialPort( byte port )

{

  // Only Master Stations communicate with the PC Controller.

  // If this station is the master, then check for incoming messages from the PC Controller.

  boolean isAvailable = false;

  byte rxByte = 0;

  do

  {
    switch (port)

    {

      case 0 :

      {

        if (Serial.available())

        {

          rxByte = Serial.read();    // read the next byte from the serial Port 0 buffer.

          isAvailable = true;

        }

      }

      case 1 :

      {

        if (Serial1.available())

        {

          rxByte = Serial1.read();    // read the next byte from the serial Port 1 buffer.

          isAvailable = true;

        }

      }

      case 2 :

      {

        if (Serial2.available())

        {

          rxByte = Serial2.read();  // read the next byte from the serial Port 2 buffer.

          isAvailable = true;

        }

      }

      case 3 :

      {

        if (Serial3.available())

        {

          rxByte = Serial3.read();  // read the next byte from the serial Port 3 buffer.

          isAvailable = true;

        }

      }

    }

    if (isAvailable)

    {

      if (rxByte >= 128)            // check for the opening packet delimiter (bit 7 set)

      {

        serialPointer = 0;                               // reset the byte counter to resync the packet.

      }

      if (serialPointer == 255)                          // check for receive buffer overflow.

      {

        serialPointer = 0;                               // Buffer Overflow.  Reset the byte pointer.

      }

      serialBuffer[serialPointer] = rxByte;              // post the received data byte to the Protocol Receive Buffer.

      serialPointer ++;                                  // increment the byte pointer.

      if (serialPointer > 1)                             // check if the message type and length bytes have arrived.

      {

       // A complete packet should be the data length plus the MSG Type and Length Byte.

      // check the Length Byte against the total bytes received.

        if (serialPointer >= serialBuffer[1]+2)            

        {

          // We have enough bytes to process one packet.

          // Pass the Message to the Packet Receiver.

          protocol_Receiver(serialBuffer);

          // reset the byte counter to receive the next packet.

          serialPointer = 0;

        }

      }

    }

  } while (isAvailable);

}

 

// ************************************************************************************************//

// Serial Protocol Functions                                                                       //

// ************************************************************************************************//

void protocol_Receiver(char rxBuffer[])

{

  // This function is called when the Serial Port or I2C receiver has determined that

  // a complete packet is waiting in its Receive Buffer.  The incoming message will be

  // processed entirely here and then the rxBuffer will be cleared in preparation for the next Message.

  switch (rxBuffer[0])

  {

    case 0 :  //

    {

      // Future Use

      break;

    }

    case 1 :  //

    {

      // Future Use

      break;

    }

    case messages_SetVoxel:  // SetVoxel Message

    {

      //protocolMessageReceive_SetVoxel(rxBuffer);

    }

    case messages_StatusMessage :  // Status Message

    {

      // Print the message to the local USB Serial Port.

      // The Message Data starts at position 2 in the rxBuffer.

      //statusMessage(debugSerialPort,String(rxBuffer),true);

    }

  }

}

 
