package model;

import controller.ConvertLedType;

public class CubeAttributes {

	//In this case we do want an instance of CubeAttribute, but only 1 instance. 
	private static final CubeAttributes instance = new CubeAttributes();
	
	//The default Cube Attributes is a 1x1x0 cube
	public static int xNumberOfLedsPerRow 		= 1;
	public static int yNumberOfRowsPerPanel 	= 1;
	public static int zNumberOfPanelsPerCube 	= 0;

//	This class has no constructor, it is instead called statically 
	private CubeAttributes(){throw new IllegalStateException("The CubeAttributes constuctor was called, should not have been possible");}
	
	
	public static CubeAttributes getInstance()
	{
		return instance;
	}
	
	
	public static int getxNumberOfLedsPerRow() {
		return xNumberOfLedsPerRow;
	}
	public static void setxNumberOfLedsPerRow(int xNumberOfLedsPerRow) {
		if (xNumberOfLedsPerRow < 1) 
			throw new IllegalStateException("CubeAttributes.xNumberOfLedsPerRow must contain atleast 1, recived: "+ xNumberOfLedsPerRow);
		CubeAttributes.xNumberOfLedsPerRow = xNumberOfLedsPerRow;
	}
	public static int getyNumberOfRowsPerPanel() {
		return yNumberOfRowsPerPanel;
	}
	public static void setyNumberOfRowsPerPanel(int yNumberOfRowsPerPanel) {
		if (yNumberOfRowsPerPanel < 1) 
			throw new IllegalStateException("CubeAttributes.yNumberOfRowsPerPanel must contain atleast 1, recived: "+ yNumberOfRowsPerPanel);
		CubeAttributes.yNumberOfRowsPerPanel = yNumberOfRowsPerPanel;
	}
	public static int getzNumberOfPanelsPerCube() {
		return zNumberOfPanelsPerCube;
	}
	public static void setzNumberOfPanelsPerCube(int zNumberOfPanelsPerCube) {
		//This is different than X or Y because you can have a cube with only 1 Panel
		if ( zNumberOfPanelsPerCube < 0 ) 
			throw new IllegalStateException("CubeAttributes.zNumberOfPanelsPerCube cannot be negative, zNumberOfPanelsPerCube = "+ zNumberOfPanelsPerCube);
		
		CubeAttributes.zNumberOfPanelsPerCube = zNumberOfPanelsPerCube;
	}


	
	public static int getNumberOfLedsPerCube()
	{	
		//User is attempting to getNumber of Leds without having set X >= 1
		if( xNumberOfLedsPerRow < 1 )
			throw new IllegalStateException("CubeAttributes.xNumberOfLedsPerRow in method getNumberOfLedsPerCube has a value of: " + xNumberOfLedsPerRow + "\nYou must set a value greater than 1");
		//User is attempting to getNumber of Leds without having set X >= 1
		if( yNumberOfRowsPerPanel < 1 )
			throw new IllegalStateException("CubeAttributes.yNumberOfRowsPerPanel in method getNumberOfLedsPerCube has a value of: " + yNumberOfRowsPerPanel + "\nYou must set a value greater than 1");
		//Unlike x and y, z CAN be 0. It would be a single dimensional plane, and not a cube
		if( zNumberOfPanelsPerCube < 0 )
			throw new IllegalStateException("CubeAttributes.zNumberOfPanelsPerCube in method getNumberOfLedsPerCube has a negative value of: " + zNumberOfPanelsPerCube );
		
		
		// This is derived (x*y*z) allowing for 0's 
		int numberOfLedsPerCube = xNumberOfLedsPerRow * yNumberOfRowsPerPanel;
		if ( zNumberOfPanelsPerCube > 0)
		{
			numberOfLedsPerCube = numberOfLedsPerCube * zNumberOfPanelsPerCube;
		}
		return numberOfLedsPerCube;
	}
	
}
