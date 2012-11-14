package controller;

import static org.junit.Assert.*;

import model.CubeAttributes;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class ConvertLedTypeTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception 
	{

	}
	
	@After
	public void tearDown() throws Exception 
	{
	}

	@Test
	public void testAbsoluteToXPositionInRow()
	{
		CubeAttributes.setxNumberOfLedsPerRow(16);
		CubeAttributes.setyNumberOfRowsPerPanel(16);
		CubeAttributes.setzNumberOfPanelsPerCube(16);
//		CubeAttributes.setNumberOfLedsPerCube(4096);
		
		assertEquals(3,  ConvertLedType.absoluteToXPositionInRow(3) );
		assertEquals(15, ConvertLedType.absoluteToXPositionInRow(4095) );
		assertEquals(0,  ConvertLedType.absoluteToXPositionInRow(0) );
		assertEquals(14, ConvertLedType.absoluteToXPositionInRow(30) );
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void testAbsoluteToXPositionInRowException()
	{
		CubeAttributes.setxNumberOfLedsPerRow(16);
		CubeAttributes.setyNumberOfRowsPerPanel(16);
		CubeAttributes.setzNumberOfPanelsPerCube(16);
//		CubeAttributes.setNumberOfLedsPerCube(4096);
		
		ConvertLedType.absoluteToXPositionInRow(-1);	
	}

	@Test
	public void testAbsoluteToYPositionInPanel()
	{
		CubeAttributes.setxNumberOfLedsPerRow(16);
		CubeAttributes.setyNumberOfRowsPerPanel(16);
		CubeAttributes.setzNumberOfPanelsPerCube(16);
//		CubeAttributes.setNumberOfLedsPerCube(4096);
		
		assertEquals(0, ConvertLedType.absoluteToYPositionInPanel(3) );
		assertEquals(15, ConvertLedType.absoluteToYPositionInPanel(4095) );
		assertEquals(0, ConvertLedType.absoluteToYPositionInPanel(0) );
		assertEquals(1, ConvertLedType.absoluteToYPositionInPanel(30) );
		assertEquals(15, ConvertLedType.absoluteToYPositionInPanel(255) );
		assertEquals(0, ConvertLedType.absoluteToYPositionInPanel(256) );
		assertEquals(0, ConvertLedType.absoluteToYPositionInPanel(257) );
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void testAbsoluteToYPositionInPanelException()
	{
		CubeAttributes.setxNumberOfLedsPerRow(16);
		CubeAttributes.setyNumberOfRowsPerPanel(16);
		CubeAttributes.setzNumberOfPanelsPerCube(16);
//		CubeAttributes.setNumberOfLedsPerCube(4096);
		
		ConvertLedType.absoluteToYPositionInPanel(-1);	
		ConvertLedType.absoluteToYPositionInPanel(4097);
	}
	
	@Test
	public void testAbsoluteToZPositionInCube()
	{
		CubeAttributes.setxNumberOfLedsPerRow(16);
		CubeAttributes.setyNumberOfRowsPerPanel(16);
		CubeAttributes.setzNumberOfPanelsPerCube(16);
//		CubeAttributes.setNumberOfLedsPerCube(4096);
		
		assertEquals(0, ConvertLedType.absoluteToZPositionInCube(200) );
		assertEquals(1, ConvertLedType.absoluteToZPositionInCube(256) );
		assertEquals(15, ConvertLedType.absoluteToZPositionInCube(4095) );
		
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void testAbsoluteToZPositionInCubeException()
	{
		CubeAttributes.setxNumberOfLedsPerRow(16);
		CubeAttributes.setyNumberOfRowsPerPanel(16);
		CubeAttributes.setzNumberOfPanelsPerCube(16);
//		CubeAttributes.setNumberOfLedsPerCube(4096);
		
		ConvertLedType.absoluteToZPositionInCube(-1);	
//		ConvertLedType.absoluteToZPositionInCube(4097); //No Logic for this test
		
	}
	
	@Test
	public void testRelativeToAbsolute()
	{
		CubeAttributes.setxNumberOfLedsPerRow(16);
		CubeAttributes.setyNumberOfRowsPerPanel(16);
		CubeAttributes.setzNumberOfPanelsPerCube(16);
//		CubeAttributes.setNumberOfLedsPerCube(4096);
		
		assertEquals(0,ConvertLedType.relativeToAbsolute(0,0,0));
		assertEquals(4095,ConvertLedType.relativeToAbsolute(15,15,15));
		assertEquals(272,ConvertLedType.relativeToAbsolute(0,1,1));
		assertEquals(256,ConvertLedType.relativeToAbsolute(0,0,1));
		assertEquals(1,ConvertLedType.relativeToAbsolute(1,0,0));
		assertEquals(257,ConvertLedType.relativeToAbsolute(1,0,1));
		
		/*
		 * Now try this with a 4x4x4 cube
		 */
		CubeAttributes.setxNumberOfLedsPerRow(4);
		CubeAttributes.setyNumberOfRowsPerPanel(4);
		CubeAttributes.setzNumberOfPanelsPerCube(4);
//		CubeAttributes.setNumberOfLedsPerCube(64);
		
		assertEquals(0,ConvertLedType.relativeToAbsolute(0,0,0));
		assertEquals(63,ConvertLedType.relativeToAbsolute(3,3,3));
		assertEquals(20,ConvertLedType.relativeToAbsolute(0,1,1));
		//Reset for next test
			CubeAttributes.setxNumberOfLedsPerRow(16);
			CubeAttributes.setyNumberOfRowsPerPanel(16);
			CubeAttributes.setzNumberOfPanelsPerCube(16);
//			CubeAttributes.setNumberOfLedsPerCube(4096);
		
		/*
		 * Now try this with a 5x2x1 cube
		 */
		CubeAttributes.setxNumberOfLedsPerRow(5);
		CubeAttributes.setyNumberOfRowsPerPanel(2);
		CubeAttributes.setzNumberOfPanelsPerCube(1);
//		CubeAttributes.setNumberOfLedsPerCube(10);
		
		assertEquals(9,ConvertLedType.relativeToAbsolute(4,1,0));
		assertEquals(0,ConvertLedType.relativeToAbsolute(0,0,0));
		assertEquals(7,ConvertLedType.relativeToAbsolute(2,1,0));
		//Reset for next test
				CubeAttributes.setxNumberOfLedsPerRow(16);
				CubeAttributes.setyNumberOfRowsPerPanel(16);
				CubeAttributes.setzNumberOfPanelsPerCube(16);
//				CubeAttributes.setNumberOfLedsPerCube(4096);
	}
	
	//@Test(expected=IllegalArgumentException.class)
	public void testRelativeToAbsoluteException()
	{
		CubeAttributes.setxNumberOfLedsPerRow(16);
		CubeAttributes.setyNumberOfRowsPerPanel(16);
		CubeAttributes.setzNumberOfPanelsPerCube(16);
//		CubeAttributes.setNumberOfLedsPerCube(4096);
		
		assertEquals(0,ConvertLedType.relativeToAbsolute(-1,0,0));

	}
	
	
	@Test
	public void testIntToHex()
	{
		//Note that this returns hex in lower case
		System.out.println(ConvertLedType.intToHex(-65536));
		assertEquals("2a", ConvertLedType.intToHex(42));	
		assertEquals("0", ConvertLedType.intToHex(0));
	}
	@Test
	public void testhexToInt()
	{
		System.out.println(ConvertLedType.hexToInt("0000AA"));

		assertEquals(42, ConvertLedType.hexToInt("2A"));
		assertEquals(42, ConvertLedType.hexToInt("2a"));
		assertEquals(16777215, ConvertLedType.hexToInt("FFFFFF"));
	}
	
	
	

	



}
