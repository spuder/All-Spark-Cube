public static final class LedAbsoluteToConverterClass
{

	static int getLedNumberInRow(int absoluteLedNumber)
	{
	    int ledTotalRowNumber 		= (absoluteLedNumber / DiffCubes2.xNumberOfLedsPerRow); // 48 would return 3rd row TODO:Consider renaming locationInY
	    int ledPanelNumber 			= (absoluteLedNumber / DiffCubes2.xNumberOfLedsPerRow / DiffCubes2.yNumberOfRowsPerPanel); //4095 would return panel 15, 300 returns panel 1 TODO:Consider renaming to locationINZ 
	    int ledVerticalRowNumber 	= (ledTotalRowNumber - (DiffCubes2.yNumberOfRowsPerPanel * ledPanelNumber)); //we need to know how high from the ground, not how many rows there are total
	    int firstLedInRow 			= ((1 + ledVerticalRowNumber + ledPanelNumber * DiffCubes2.zNumberOfPanelsPerCube ) * DiffCubes2.yNumberOfRowsPerPanel - DiffCubes2.xNumberOfLedsPerRow);
	    return (absoluteLedNumber - firstLedInRow);
	}

	static int getLedRowNumberInPanel( int absoluteLedNumber )
	{

		int ledTotalRowNumber     = (absoluteLedNumber / DiffCubes2.xNumberOfLedsPerRow);
    	int ledPanelNumber        = (absoluteLedNumber / DiffCubes2.xNumberOfLedsPerRow / DiffCubes2.yNumberOfRowsPerPanel); //4095 would return panel 15, 300 returns panel 1 TODO:Consider renaming to locationINZ 
     	int ledVerticalRowNumber  = (ledTotalRowNumber - (DiffCubes2.yNumberOfRowsPerPanel * ledPanelNumber)); //we need to know how high from the ground, not how many rows there are total
     
     	println("getLedNumberInRow was given " + absoluteLedNumber + " and is returning " + ledVerticalRowNumber);
		return ledVerticalRowNumber;

	}

	static int getPanelThatContainsLed ( int absoluteLedNumber )
	{
		int ledTotalRowNumber     = (absoluteLedNumber / DiffCubes2.xNumberOfLedsPerRow);      
      	int ledPanelNumber        = (absoluteLedNumber / DiffCubes2.xNumberOfLedsPerRow / DiffCubes2.yNumberOfRowsPerPanel); //4095 would return panel 15, 300 returns panel 1 TODO:Consider renaming to locationINZ 
        println("getPanelThatContainsLed was given " + absoluteLedNumber + " and is returning " + ledPanelNumber);

      return ledPanelNumber;
	}


}//end class ConverterClass