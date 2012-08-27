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

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(0).add(4);
							 aListOfLedsChanged.get(0).add(1);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(1).add(6);
							 aListOfLedsChanged.get(1).add(2);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(2).add(7);
							 aListOfLedsChanged.get(2).add(2);

							 aListOfLedsChanged.add( new ArrayList<Integer>() );
							 aListOfLedsChanged.get(3).add(10);
							 aListOfLedsChanged.get(3).add(1);




void setup()
{

	
	
	//prepareForSerial ( aListOfLedsChanged );
	sendToSerial ( splitArray( 32, flattenArrayList( aListOfLedsChanged ) ) );

	//sendToSerial( prependArray( splitArray( flattenArrayList( aListOfLedsChanged )));
	//sendToSerial( aListOfLedsChanged );

		println("");
			    print(" Array list is [ ");
			    for ( int byteArrayTroubleshootCounter = 0; byteArrayTroubleshootCounter < byteArrayToSendViaSerial.length; byteArrayTroubleshootCounter++ )
			    {
			        print( byteArrayToSendViaSerial[ byteArrayTroubleshootCounter ] + "," );
			    }
			    println(" ]");

}//end setup

void draw()
{

}


ArrayList<Integer> flattenArrayList(ArrayList<List<Integer>> aListOfLedsChanged)
{
	ArrayList<Integer> aFlattenedArrayList = new ArrayList()<Integer>;
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

}//end flattenArrayList


void splitArray( int sizeToSplitTo, ArrayList<Integer> aFlattenedArrayList )
{

	//create a new array that we will reuseover and over
	byte[] aSplitArray = new Array[32];
	//create a speical array for the parts that wont fit in 32 byte array, this will change every time
	//Example 52 - (30 * (52 / int(30) )
	int numberOfFullByteArrays  = aFlattenedArrayList.size() / sizeToSplitTo;
	int bytesInShortArray 		= aFlattenedArrayList.size() - (sizeToSplitTo * numberOfFullByteArrays )
	
	//If the Array length is not divisible by 30, you will have one short array
	//Add 2 for the message headers
	byte theShortArray = new Array[ bytesInShortArray + 2];


	//Take flattened arrayList and itterate through it
	for(int counterInFlattenedArrayList = 0; counterInFlattenedArrayList < aFlattenedArrayList.size(); counterInFlattenedArrayList++)
	{
		//Leave first 2 bytes blank for message headers
		//Look ahead and see if there are 32 bytes left in the arraylist
		//If there are not 32 bytes left then add data to special array
		//If there are 32 bytes left then add data to new array
			//If we have reached the end of the special array or the end of normal array, send to 
			//..serial and dump array

		//If we are on the last short array
		if( counterInFlattenedArrayList > aFlattenedArrayList.size() - bytesInShortArray )
		{
			// Derive a counter 
			// 52 - 31 - 22 = -1
			// Since we are counting from the end of the array, the number will be negative
			// Invert it to a positive and you will have the correct counter every time
			int locationInShortArray = Math.abs( aFlattenedArrayList.size() - counterInFlattenedArrayList - bytesInShortArray ) ;

			theShortArray[ locationInShortArray ] = aFlattenedArrayList.get(counterInFlattenedArrayList);
		}
		else
		{
			int locationInArray; 
			//We aren't on the last remaining bytes, so we must be in the front of the array
			// Derive the index of the current array
			// 0 = 0, 1 = 1, 30 = 0, 31 = 1, 59 = 29, 60 = 0, 61 = 1
			// 61 - ( ( 61 / 30 ) * 30 ) = 1
			//I know there is a mathmatical formula for this, but I cant find/ figure it out after hours
			if ( counterInFlattenedArrayList < sizeToSplitTo - 2)
			{ 
				locationInArray = counterInFlattenedArrayList;
			}
			else 
			{
				// 61 - ( ( 61 / 30 ) * 30 ) = 1
				locationInArray = ( counterInFlattenedArrayList - ( ( ( (sizeToSplitTo -2) % counterInFlattenedArrayList )  * numberOfFullByteArrays )/ (sizeToSplitTo -2) * (sizeToSplitTo -2))
			}
			 

 
		}

/*		//If we are starting the array, add the headers [0]
			if( counterInFlattenedArrayList == aFlattenedArrayList.size()  - bytesInShortArray )
			{
				theShortArray[ counterInFlattenedArrayList ] = (byte) (11+128);
			}
			//If we are at [1] of the short array add the length
			else if ( counterInFlattenedArrayList  -1 == aFlattenedArrayList.size()   - bytesInShortArray  )
*/



	}
	//Send to prepend array


	
}


void sendToSerial( byte[] anArrayToSendToSerial )
{
	Serial.write( anArrayToSendToSerial );
}








