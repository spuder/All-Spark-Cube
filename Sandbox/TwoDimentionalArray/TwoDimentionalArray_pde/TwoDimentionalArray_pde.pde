	
int led0 				= 5;
int led0Color 			= 6;
int led0Brightness 		= 10;
int led1 				= 7;
int led1Color 			= 8;
int led01Brightness 	= 20;


void setup()
{
	ArrayList<List<Integer>> aListOfLedsChanged = new ArrayList<List<Integer>>();

	aListOfLedsChanged.add( new ArrayList<Integer>() );
	aListOfLedsChanged.get(0).add(led0); //5
	aListOfLedsChanged.get(0).add(led0Color); //6

	aListOfLedsChanged.add( new ArrayList<Integer>() );
	aListOfLedsChanged.get(1).add(led1); //7
	aListOfLedsChanged.get(1).add(led1Color); //8
	aListOfLedsChanged.get(1).add(42);//test ragged array


	getFromArrayList(aListOfLedsChanged);

}

void draw()
{

}


void getFromArrayList( ArrayList<List<Integer>> aListOfLedsChanged )
{


	for ( int outerArrayCounter = 0; outerArrayCounter < aListOfLedsChanged.size(); outerArrayCounter++ )
	{
		println("in outter for loop, counter is " + outerArrayCounter);

		println("led is " + aListOfLedsChanged.get(outerArrayCounter).get(0) );
		for ( int innerArrayCounter = 0; innerArrayCounter < aListOfLedsChanged.get(outerArrayCounter).size(); innerArrayCounter++)
		{
			//Goes through every item in inner array and returns the value
			println("led is " + aListOfLedsChanged.get(outerArrayCounter).get(innerArrayCounter) );

		}

	}
	println("");
	println("no for loop");
	println(aListOfLedsChanged.get(0).get(0) );
	println(aListOfLedsChanged.get(0).get(1) );
	println(aListOfLedsChanged.get(1).get(0) );
	println(aListOfLedsChanged.get(1).get(1) );

}
