
import processing.serial.*;
/*
A program to test how to chomp one multidimentional integer arraylist 
to multiple byte arrays

first number vertically is the index of the outter array
second number vertically is the first number in inner array - (led number)
thrid number vertically is the second number in the inner array - led color (1=red, 2=blue)

 [ 	0       1  		2		3		]  
    [4]		[6]		[7]		[10]
    [1]   	[2]		[2]		[1]


    This needs to be flattened and split into multiple arrays
    the array to split into are downcast from array lists to simple arrays
    the arrays can have max of 32 bytes (kevins request) 
    the arrays have index 0 of 139 (kevins recieve code) and index 1 of message length

*/

    ArrayList<List<Integer>> aListOfLedsChanged = new ArrayList<List<Integer>>();
Serial aSerialPort;





void setup()
{
	aSerialPort = new Serial(this, Serial.list()[0], 115200);
	delay(1000);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(0).add(0);
							 aListOfLedsChanged.get(0).add(1);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(1).add(2);
							 aListOfLedsChanged.get(1).add(3);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(2).add(4);
							 aListOfLedsChanged.get(2).add(5);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(3).add(6);
							 aListOfLedsChanged.get(3).add(7);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(4).add(8);
							 aListOfLedsChanged.get(4).add(9);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(5).add(10);
							 aListOfLedsChanged.get(5).add(11);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(6).add(12);
							 aListOfLedsChanged.get(6).add(13);

							aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(7).add(14);
							 aListOfLedsChanged.get(7).add(15);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(8).add(16);
							 aListOfLedsChanged.get(8).add(17);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(9).add(18);
							 aListOfLedsChanged.get(9).add(19);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(10).add(20);
							 aListOfLedsChanged.get(10).add(21);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(11).add(22);
							 aListOfLedsChanged.get(11).add(23);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(12).add(24);
							 aListOfLedsChanged.get(12).add(25);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(13).add(26);
							 aListOfLedsChanged.get(13).add(27);

							  aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(14).add(28);
							 aListOfLedsChanged.get(14).add(29);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(15).add(30);
							 aListOfLedsChanged.get(15).add(31);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(16).add(32);
							 aListOfLedsChanged.get(16).add(33);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(17).add(34);
							 aListOfLedsChanged.get(17).add(35);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(18).add(36);
							 aListOfLedsChanged.get(18).add(37);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(19).add(38);
							 aListOfLedsChanged.get(19).add(39);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(20).add(40);
							 aListOfLedsChanged.get(20).add(41);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(21).add(42);
							 aListOfLedsChanged.get(21).add(43);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(22).add(44);
							 aListOfLedsChanged.get(22).add(45);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(23).add(46);
							 aListOfLedsChanged.get(23).add(47);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(24).add(48);
							 aListOfLedsChanged.get(24).add(49);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(25).add(50);
							 aListOfLedsChanged.get(25).add(51);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(26).add(52);
							 aListOfLedsChanged.get(26).add(53);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(27).add(54);
							 aListOfLedsChanged.get(27).add(55);
							 
							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(28).add(56);
							 aListOfLedsChanged.get(28).add(57);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(29).add(58);
							 aListOfLedsChanged.get(29).add(59);
							 
							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(30).add(60);
							 aListOfLedsChanged.get(30).add(61);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(31).add(62);
							 aListOfLedsChanged.get(31).add(63);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(32).add(64);
							 aListOfLedsChanged.get(32).add(65);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(33).add(66);
							 aListOfLedsChanged.get(33).add(67);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(34).add(68);
							 aListOfLedsChanged.get(34).add(69);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(35).add(70);
							 aListOfLedsChanged.get(35).add(71);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(36).add(72);
							 aListOfLedsChanged.get(36).add(73);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(37).add(74);
							 aListOfLedsChanged.get(37).add(75);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(38).add(76);
							 aListOfLedsChanged.get(38).add(77);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(39).add(78);
							 aListOfLedsChanged.get(39).add(79);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(40).add(80);
							 aListOfLedsChanged.get(40).add(81);


	delay(1000);
	
	//prepareForSerial ( aListOfLedsChanged );
	splitArray( 32, flattenArrayList( aListOfLedsChanged ) ) ;

	//sendToSerial( prependArray( splitArray( flattenArrayList( aListOfLedsChanged )));
	//sendToSerial( aListOfLedsChanged );
	 

		// println("");
		// 	    print(" Array list is [ ");
		// 	    for ( int byteArrayTroubleshootCounter = 0; byteArrayTroubleshootCounter < byteArrayToSendViaSerial.length; byteArrayTroubleshootCounter++ )
		// 	    {
		// 	        print( byteArrayToSendViaSerial[ byteArrayTroubleshootCounter ] + "," );
		// 	    }
		// 	    println(" ]");

}//end setup

void draw()
{

}


ArrayList<Integer> flattenArrayList(ArrayList<List<Integer>> aListOfLedsChanged)
{
	ArrayList<Integer> aFlattenedArrayList = new ArrayList<Integer>();
	//Loop through outter array list 
	for( int locationInOutterArrayList = 0; locationInOutterArrayList < aListOfLedsChanged.size(); locationInOutterArrayList++ )
	{
		//Loop through inner array list
		for ( int locationInInnerArray =0; locationInInnerArray < aListOfLedsChanged.get(locationInOutterArrayList).size(); locationInInnerArray++)
		{
			//Add each item in multidimentional array to new array
			aFlattenedArrayList.add( aListOfLedsChanged.get(locationInOutterArrayList).get(locationInInnerArray) );
		}
	}

	println("MD Array [0][0] should be equal New array[0], Does 4 = " + aListOfLedsChanged.get(0).get(0) + " = " +aFlattenedArrayList.get(0) + " ?");
	println("MD Array [0][1] should be equal New array[1], Does 1 = " + aListOfLedsChanged.get(0).get(1) + " = " +aFlattenedArrayList.get(1) + " ?");
	println("MD Array [1][0] should be equal New array[2], Does 6 = " + aListOfLedsChanged.get(1).get(0) + " = " +aFlattenedArrayList.get(2) + " ?");
	
	return aFlattenedArrayList;

}//end flattenArrayList()





void splitArray( int sizeToSplitTo, ArrayList<Integer> aFlattenedArrayList )
{
println("Called splitArray method");
	
		println("about to create a new array that we will reuseover and over of 32 bytes");
	byte[] aSplitArray = new byte[32];

	//create a speical array for the parts that wont fit in 32 byte array, this will change every time
	//Example 52 - (30 * (52 / int(30) )
	int numberOfFullByteArrays  = aFlattenedArrayList.size() / sizeToSplitTo; 
		println("numberOfFullByteArrays is " + numberOfFullByteArrays);

	int bytesInShortArray 		= aFlattenedArrayList.size() - ( (sizeToSplitTo -2 ) * numberOfFullByteArrays );
		println("bytesInShortArray is " + bytesInShortArray);
	
	//If the Array length is not divisible by 30, you will have one short array
	//Add 2 for the message headers
	byte[] theShortArray = new byte[ bytesInShortArray + 2];
		println("Created theShortArray of length " + theShortArray.length );

	//Counter for inside arrays
	int locationIn32byteArray = 2;
	int locationInShortArray = 2;


	//Take flattened arrayList and itterate through it
	for(int counterInFlattenedArrayList = 0; counterInFlattenedArrayList < aFlattenedArrayList.size(); counterInFlattenedArrayList++)
	{

		/*Decision Tree
				Normal Array [32]------------------- Small Array[<32]
				/			\							/			\
		At End 	----------- not at end 				At End ------------- Not at End 
		add byte 			send to serial 			add byte 			 send to serial
		Increment counter 	reset coutner 			Increment coutner 	 reset counter
							purge array 								purge array
		*/
		//Leave first 2 bytes blank for message headers
		//Look ahead and see if there are 32 bytes left in the arraylist
		//If there are not 32 bytes left then add data to special array
		//If there are 32 bytes left then add data to new array
			//If we have reached the end of the special array or the end of normal array, send to 
			//..serial and dump array

	//If we are on the small array
		//if( counterInFlattenedArrayList > aFlattenedArrayList.size()  - bytesInShortArray )
		if( counterInFlattenedArrayList >= numberOfFullByteArrays * (sizeToSplitTo - 2) )				
		{
			// Derive a counter 
			// 52 - 31 - 22 = -1
			// Since we are counting from the end of the array, the number will be negative
			// Invert it to a positive and you will have the correct counter every time
			//int locationInShortArray = Math.abs( aFlattenedArrayList.size() - counterInFlattenedArrayList - bytesInShortArray ) ;
				//println("locationInShortArray is " + locationInShortArray);

		//If Not at end of short array
							//println("why wont locationInShortArray exceede aFlattenedArrayList.size() ? " +(locationInShortArray + bytesInShortArray)+ " " +  aFlattenedArrayList.size()	);	

				// if( locationInShortArray < theShortArray.length )
				// {
					println("counterInFlattenedArrayList = " + counterInFlattenedArrayList);
					//Add the led in the flattened array to the shorteded array
					int intToByte = aFlattenedArrayList.get( counterInFlattenedArrayList );
					theShortArray[ locationInShortArray ] = (byte)intToByte;
							println("Added intToByte " + intToByte + " to index " +locationInShortArray + " of the short array");
					//Increment counter
					locationInShortArray++;
							println("");
							println("locationInShortArray = " + locationInShortArray);

				// }
		//If at end of short array
				//else if (locationInShortArray >= aFlattenedArrayList.size() || locationInShortArray >= counterInFlattenedArrayList) 
				//else if (locationInShortArray == theShortArray.length ) 
				if (locationInShortArray == theShortArray.length ) 
				{
					println("At end of short array");
					//Prepend array
					theShortArray[0] = (byte)138;
					int theShortArrayLength = theShortArray.length;
					theShortArray[1] = (byte)theShortArrayLength;

					//Send to serial
					aSerialPort.write( theShortArray );
						println("***********Sent short to serial port***********");
						println( theShortArray );	
					//Reset counter
						locationInShortArray = 2;
					//Purge Array
						Arrays.fill(theShortArray, byte(0) ); // not nessesary
				}
				// else
				// {
				// 	println("Error: This code should be unreachable, locatinInArray is in limbo");
				// }
		

		}
	//If we are on the normal 32 byte array
		else
		{
			
		//If Not at end of normal array
			//println("");
			//println("sizeToSplitTo = " + (sizeToSplitTo - 2)) ;
			// if ( locationIn32byteArray < sizeToSplitTo   ) 
			// { 

				//Add byte to array
				int byteToAddToNormalArray 		= aFlattenedArrayList.get( counterInFlattenedArrayList ) ;
				aSplitArray[ locationIn32byteArray ] 	= (byte)byteToAddToNormalArray;

				println("Added "+ aFlattenedArrayList.get( counterInFlattenedArrayList  )+ "  to aSplitArray["+locationIn32byteArray+"]" );

				//Increment counter
				locationIn32byteArray++;
				println(" locationIn32byteArray is now "+ locationIn32byteArray);

			// }
		//If at end of normal array
			// else if (locationIn32byteArray == sizeToSplitTo  )
			if (locationIn32byteArray == sizeToSplitTo  )
			{
					//Add message type to [0]
					aSplitArray[0] = (byte)138;

					//Add length to [1], should always be 32
					int splitArrayLength = aSplitArray.length;
					aSplitArray[1] = (byte) splitArrayLength ;

					//Send to serial port
					aSerialPort.write(aSplitArray);
						println("***********Sent to serial port***********");
						println(aSplitArray);

					//reset counter, skip first 2 indicies in array for headers
					locationIn32byteArray = 2; 

					//purge array
					Arrays.fill( aSplitArray, (byte)0 );

					
					/*
					This is a bandaid because we are using the for loop counter as the 
					index to put the led into the new array. 
					Once every 30th itterations, we don't add anything to the arrays because
					we are writting to the serial port, because of this, we have to compensate for the 
					next message, or else it will loose the first byte
					I am seeing that byte 31 never gets added, because the 31st loop, no arrays are modified.
					*/

			}
			//else{println("locationIn32byteArray is in limbo, should be unreachable");}
			 
 
		}//end check normal / small

	} //end for loop
	
}


void sendToSerial( byte[] anArrayToSendToSerial )
{
	aSerialPort.write( anArrayToSendToSerial );
}








