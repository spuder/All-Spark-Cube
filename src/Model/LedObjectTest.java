package model;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class LedObjectTest {
	
	LedObject aLed1;
	LedObject aLed2;


	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		
		model.CubeAttributes.setxNumberOfLedsPerRow(16);
		model.CubeAttributes.setyNumberOfRowsPerPanel(16);
		model.CubeAttributes.setzNumberOfPanelsPerCube(16);
	}

	@After
	public void tearDown() throws Exception {
	}



	
	@Test
	public void testLedObjectConstructor1()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		assertEquals(4095, aLed1.getLedNumberInCube());
		
		aLed1 = null;
		
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		/*
		 * 	aLed1 = new LedObject(4095, "FFFFFF");
		aLed1 = new LedObject(-1, "true");
		aLed1 = null;
		
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		
		aLed1 = null;
		
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "hi");
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		
		aLed1 = null;
		
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		
		aLed1 = null;
		aLed1 = new LedObject(-1, "hi");
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		
		aLed1 = null;
		aLed1 = new LedObject(-1, "0xGGGGGG");
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		*/
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void testLedObjectConstructor1Exception1()
	{
		aLed1 = null;
		aLed1 = new LedObject(-1, "0xFFFFFF");
		
//		aLed1 = null;
//		int var1 = (Integer) null;
//		int var2 = (Integer) null;
//		aLed1 = new LedObject(var1,var2);
//		
	
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void testLedObjectConstructor1Exception2()
	{	
		aLed1 = null;
		aLed1 = new LedObject(5000, "0xFFFFFF");
	}
	@Test(expected=IllegalArgumentException.class)
	public void testLedObjectConstructor1Exception3()
	{
		aLed1 = null;
		aLed1 = new LedObject(-1,-1,-1, 255);			
	}
	
	@Test
	public void LedObjectConstructor2()
	{
		
	}
	
	@Test
	public void LedObjectConstructor3()
	{
		
	}
	
	@Test
	public void LedObjectConstructor4()
	{
		
	}
	
	@Test
	public void getLedNumberInCube()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, 255);
		assertEquals(4095, aLed1.getLedNumberInCube() );
		
		

	}
	
	@Test
	public void getLedX()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, 255);
		assertEquals(15, aLed1.getLedX() );
		
		aLed1 = null;
		aLed1 = new LedObject(16, 255);
		assertEquals(0, aLed1.getLedX() );	
	}
	
	@Test
	public void getLedY()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFAAFF");
		assertEquals(15, aLed1.getLedX() );
		
		aLed1 = null;
		aLed1 = new LedObject(273, "0xFFAAFF");
		assertEquals(1, aLed1.getLedX() );	
		
		aLed1 = null;
		aLed1 = new LedObject(16, "0xFFAAFF");
		assertEquals(0, aLed1.getLedX() );	
		
		aLed1 = null;
		aLed1 = new LedObject(32, "0xFFAAFF");
		assertEquals(0, aLed1.getLedX() );
		
	}
	
	@Test
	public void getLedZ()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFAAFF");
		assertEquals(15, aLed1.getLedX() );
		
		aLed1 = null;
		aLed1 = new LedObject(273, "0xFFAAFF");
		assertEquals(1, aLed1.getLedX() );
		
		aLed1 = null;
		aLed1 = new LedObject(530, "0xFFAAFF");
		assertEquals(2, aLed1.getLedX() );
	}
	
	@Test
	public void setLedColorInt()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, -16711936);
		assertEquals("00ff00", aLed1.getLedColorHex());
		
		aLed1 = null;
		aLed1 = new LedObject(4095, -65536);
		assertEquals("ff0000", aLed1.getLedColorHex());

		aLed1 = null;
		aLed1 = new LedObject(4095, -6908266);
		assertEquals("969696", aLed1.getLedColorHex());

		aLed1 = null;
		aLed1 = new LedObject(4095, 0);
		assertEquals("0", aLed1.getLedColorHex());

		aLed1 = null;
		aLed1 = new LedObject(4095, 1);
		assertEquals("1", aLed1.getLedColorHex());

		aLed1 = null;
		aLed1 = new LedObject(4095, 10);
		assertEquals("a", aLed1.getLedColorHex());

		aLed1 = null;
		aLed1 = new LedObject(4095, 17);
		assertEquals("11", aLed1.getLedColorHex());

	}
	
	@Test
	public void setLedColorHex()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		aLed1.setLedColor("0xFFAAFF");
		assertEquals("ffaaff", aLed1.getLedColorHex() );
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
//		aLed1.setLedColor("0xFFAAFFA");
		//IllegalArgument
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
//		aLed1.setLedColor("hello");
		//IllegalArgument
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
//		aLed1.setLedColor("0xGGGGGG");
		//IllegalArgument
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		aLed1.setLedColor("FFAAFF");
		assertEquals("ffaaff", aLed1.getLedColorHex() );
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
//		aLed1.setLedColor("FFAAFFA");
		//IllegalArgument
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		aLed1.setLedColor("ABADBEEF");
		assertEquals("adbeef", aLed1.getLedColorHex() );

	}
	
	
	
//	@Test
	public void setLedColorString()
	{
		
	}
//	@Test
	public void getLedColorHex()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		assertEquals("0xFFFFFF", aLed1.getLedColorHex() );

		aLed1 = null;
		aLed1 = new LedObject(4095, "FFFFFF");
		assertEquals("0xFFFFFF", aLed1.getLedColorHex() );
	}
	
//	@Test
	public void setLedBrightness()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, 255, 42);
		aLed1.setLedBrightness(100);
		assertEquals(100, aLed1.getLedBrightness() );

		aLed1 = null;
		aLed1 = new LedObject(4095, 255, 42);
		aLed1.setLedBrightness(0);
		assertEquals(0, aLed1.getLedBrightness() );
		
		aLed1 = null;
		aLed1 = new LedObject(4095, 255, 42);
		aLed1.setLedBrightness(101);
		//IllegalArgument
		
		aLed1 = null;
		aLed1 = new LedObject(4095, 255, 42);
		aLed1.setLedBrightness(66000);
		//IllegalArgument
		

	}
	
//	@Test
	public void getLedBrightness()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, 255, 100);
		assertEquals(100, aLed1.getLedBrightness() );
		
		aLed1 = null;
		aLed1 = new LedObject(4095, 255, 0);
		assertEquals(0, aLed1.getLedBrightness() );
		
		aLed1 = null;
		aLed1 = new LedObject(4095, 255, 42);
		assertEquals(42, aLed1.getLedBrightness() );
	}
	
//	@Test
	public void testSameColor()
	{
		aLed1 = null;
		aLed2 = null;
		aLed1 = new LedObject(4095, "0xFFAAFF");
		aLed2 = new LedObject(4095, "0xFFAAFF");
		assertEquals(true, aLed1.sameColor(aLed2) );
		
		aLed1 = null;
		aLed2 = null;
		aLed1 = new LedObject(4095, "0xFFAAFF");
		aLed2 = new LedObject(4095, "FFAAFF");
		assertEquals(true, aLed1.sameColor(aLed2) );
		
		aLed1 = null;
		aLed2 = null;
		aLed1 = new LedObject(4095, "0xFFAAFF");
		aLed2 = new LedObject(4095, "0xFFAADD");
		assertEquals(false, aLed1.sameColor(aLed2) );
		
	}
	
//	@Test
	public void testToString()
	{
		aLed1 = null;
		aLed2 = null;
		aLed1 = new LedObject(4095, "FFAAFF");
		assertEquals("LED Number:4095, Color: FFAAFF, Brightness: 100%", aLed1.toString());
	}
	

}
