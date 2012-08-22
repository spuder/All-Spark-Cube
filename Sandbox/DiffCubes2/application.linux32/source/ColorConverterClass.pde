public static final class ColorConverterClass
{

	public static int intColorLookupTable(int colorToConvert)
	{

		println("intColorLookupTable method called with parameter " + colorToConvert);
		//-6908266 = red;

		//grey = 0
		if ( colorToConvert == -6908266)
		{
			println("recieved -6908266 or off");
			 return 0;
		}
		//red = 1
		else if (colorToConvert == -65536)
		{
			println("recieved -65536 or red");
			return 1;
		}
		//green = 2
		else if (colorToConvert == -16711936)
		{
			return 2;
		}
		//blue = 3 
		else if (colorToConvert == -16776961)
		{
			return 3; 
		}
		//white = 4
		else if (colorToConvert == -1)
		{
			println("returning 4");
			return 4;
		}
		//yellow = 5
		else if (colorToConvert == -256)
		{
			return 5;
		}
		//purple
		else if (colorToConvert == -65281)
		{
			return 6;
		}
		else 
		{	
			println("");
			println("Color " + colorToConvert + " is not in lookup table");
			return 0;
		}

	}

}
