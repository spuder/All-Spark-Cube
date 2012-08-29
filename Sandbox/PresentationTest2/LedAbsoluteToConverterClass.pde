public static class LedAbsoluteToConverterClass
{

//	static int xNumberOfLedsPerRow = 16;
//	static int yNumberOfRowsPerPanel = 16;
//	static int zNumberOfPanelsPerCube = 16;
	private LedAbsoluteToConverterClass(){}
	
	
	static int getLedNumberInRow(int absoluteLedNumber)
	{
	    int ledTotalRowNumber 		= (absoluteLedNumber / PresentationTest2.xNumberOfLedsPerRow); // 48 would return 3rd row TODO:Consider renaming locationInY
	    int ledPanelNumber 			= (absoluteLedNumber / PresentationTest2.xNumberOfLedsPerRow / PresentationTest2.yNumberOfRowsPerPanel); //4095 would return panel 15, 300 returns panel 1 TODO:Consider renaming to locationINZ 
	    int ledVerticalRowNumber 	= (ledTotalRowNumber - (PresentationTest2.yNumberOfRowsPerPanel * ledPanelNumber)); //we need to know how high from the ground, not how many rows there are total
	    int firstLedInRow 			= ((1 + ledVerticalRowNumber + ledPanelNumber * PresentationTest2.zNumberOfPanelsPerCube ) * PresentationTest2.yNumberOfRowsPerPanel - PresentationTest2.xNumberOfLedsPerRow);
	    return (absoluteLedNumber - firstLedInRow);
	}

	static int getLedRowNumberInPanel( int absoluteLedNumber )
	{

		int ledTotalRowNumber     = (absoluteLedNumber / xNumberOfLedsPerRow);
    	int ledPanelNumber        = (absoluteLedNumber / xNumberOfLedsPerRow / yNumberOfRowsPerPanel); //4095 would return panel 15, 300 returns panel 1 TODO:Consider renaming to locationINZ 
     	int ledVerticalRowNumber  = (ledTotalRowNumber - (yNumberOfRowsPerPanel * ledPanelNumber)); //we need to know how high from the ground, not how many rows there are total
     
     	System.out.println("getLedNumberInRow was given " + absoluteLedNumber + " and is returning " + ledVerticalRowNumber);
		return ledVerticalRowNumber;

	}

	static int getPanelThatContainsLed ( int absoluteLedNumber )
	{
	      int ledTotalRowNumber     = (absoluteLedNumber / xNumberOfLedsPerRow);      
      	      int ledPanelNumber        = (absoluteLedNumber / xNumberOfLedsPerRow / yNumberOfRowsPerPanel); //4095 would return panel 15, 300 returns panel 1 TODO:Consider renaming to locationINZ 
              System.out.println("getPanelThatContainsLed was given " + absoluteLedNumber + " and is returning " + ledPanelNumber);

              return ledPanelNumber;
	}


}//end class ConverterClass
