package controller;

public class CubeAttributes {

	
	
	public static int xNumberOfLedsPerRow;
	public static int yNumberOfRowsPerPanel;
	public static int zNumberOfPanelsPerCube;
	public static int numberOfLedsPerCube;
	/**
	 * This class has no constructor, it is instead called statically
	 */
	private CubeAttributes(){}
	
	public static int getxNumberOfLedsPerRow() {
		return xNumberOfLedsPerRow;
	}
	public static void setxNumberOfLedsPerRow(int xNumberOfLedsPerRow) {
		CubeAttributes.xNumberOfLedsPerRow = xNumberOfLedsPerRow;
	}
	public static int getyNumberOfRowsPerPanel() {
		return yNumberOfRowsPerPanel;
	}
	public static void setyNumberOfRowsPerPanel(int yNumberOfRowsPerPanel) {
		CubeAttributes.yNumberOfRowsPerPanel = yNumberOfRowsPerPanel;
	}
	public static int getzNumberOfPanelsPerCube() {
		return zNumberOfPanelsPerCube;
	}
	public static void setzNumberOfPanelsPerCube(int zNumberOfPanelsPerCube) {
		CubeAttributes.zNumberOfPanelsPerCube = zNumberOfPanelsPerCube;
	}
	
	public static int getNumberOfLedsPerCube()
	{
		//TODO:Calculate total number of leds including if one of them is 0
		return 0;
//return xNumberOfLedsPerRow * yNumberOfRowsPerPanel * zNumberOfPanelsPerCube;
	}
	
}
