package controller;

public class ConvertLedType {
	/**
	 * http://en.wikipedia.org/wiki/Singleton_pattern	
	 * There are two common implementations, lazy and eager. This code represents eager 
	 */
	private static final ConvertLedType instance = new ConvertLedType();
	
	private ConvertLedType(){}
	
	public static ConvertLedType getInstance()
	{
		return instance;
	}
	
	
	public static int absoluteToXPositionInRow(int aLed)
	{
		/**
		 * Retrieves the absolute led number of the first led in the same row then subtracts this led number
		 * to give the location in the row. On a 16x16x16 cube with 0,0,0 as the origin, this number will always be less than 15
		 */
		int aLedAbsoulteNumber = aLed;
		int XPositionInRow = controller.CubeAttributes.getxNumberOfLedsPerRow();
		int firstLedInRow;
		
		return 0;
	}
	
	public static int absoluteToYPositionInCube(int aLed)
	{
		
		
	}
	
	public static int absoluteToYPostitionInPanel(int aLed)
	{
		
		
	}
	
	public static int absoluteToZPositionInCube(int aLed)
	{
		
		
	}
	
	public static int relativeToAbsolute(int xPosition, int yPosition, int zPosition)
	{
	
		
	}
	
	public static int relativeToAbsolute(int[] arrayOfLeds)
	{
		
		
	}

}
