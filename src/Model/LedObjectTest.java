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
		
	   
	}

	@After
	public void tearDown() throws Exception {
	}



	
	@Test
	public void LedObjectConstructor1()
	{
		System.out.println("This code should be unreachable");
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		int numberInCube = aLed1.getLedNumberInCube();
		assertEquals(4095, numberInCube);
		
		aLed1 = null;
		try
		{
			aLed1 = new LedObject(-1, "0xFFFFFF");
		}
		catch (IllegalArgumentException e )
		{
			System.out.println(e);
			//assertEquals(e, "ledNumberInCube = -1 must be greater than 0");
			assertEquals("java.lang.IllegalArgumentException: ledNumberInCube = -1 must be greater than 0", e);
		}
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		/*
		aLed1 = null;
		aLed1 = new LedObject(5000, "0xFFFFFF");
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "FFFFFF");
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "hi");
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		
		aLed1 = null;
		aLed1 = new LedObject(-1, "true");
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		
		aLed1 = null;
		aLed1 = new LedObject(-1, "hi");
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		
		aLed1 = null;
		aLed1 = new LedObject(-1, "0xGGGGGG");
		//assertEquals(xxx "ledNumberInCube = " + -1 + " must be greater than 0");
		*/
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
		aLed1 = new LedObject(4095, "0xFFFFFF");
		assertEquals(4095, aLed1.getLedNumberInCube() );
		
		

	}
	
	@Test
	public void getLedX()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFAAFF");
		assertEquals(15, aLed1.getLedX() );
		
		aLed1 = null;
		aLed1 = new LedObject(16, "0xFFAAFF");
		assertEquals(0, aLed1.getLedX() );	
	}
	
	@Test
	public void getLedY()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFAAFF");
		assertEquals(15, aLed1.getLedX() );
		
		aLed1 = null;
		aLed1 = new LedObject(272, "0xFFAAFF");
		assertEquals(1, aLed1.getLedX() );	
		
		aLed1 = null;
		aLed1 = new LedObject(16, "0xFFAAFF");
		assertEquals(1, aLed1.getLedX() );	
		
		aLed1 = null;
		aLed1 = new LedObject(32, "0xFFAAFF");
		assertEquals(2, aLed1.getLedX() );
		
	}
	
	@Test
	public void getLedZ()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFAAFF");
		assertEquals(15, aLed1.getLedX() );
		
		aLed1 = null;
		aLed1 = new LedObject(272, "0xFFAAFF");
		assertEquals(1, aLed1.getLedX() );
		
		aLed1 = null;
		aLed1 = new LedObject(530, "0xFFAAFF");
		assertEquals(2, aLed1.getLedX() );
	}
	
	@Test
	public void setLedColor()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		aLed1.setLedColor("0xFFAAFF");
		assertEquals("0xFFAAFF", aLed1.getLedColorHex() );
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		aLed1.setLedColor("0xFFAAFFA");
		//IllegalArgument
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		aLed1.setLedColor("hello");
		//IllegalArgument
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		aLed1.setLedColor("0xGGGGGG");
		//IllegalArgument
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		aLed1.setLedColor("FFAAFF");
		assertEquals("0xFFAAFF", aLed1.getLedColorHex() );
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		aLed1.setLedColor("FFAAFFA");
		//IllegalArgument
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		aLed1.setLedColor("ABADBEEF");
		assertEquals("0xADBEEF", aLed1.getLedColorHex() );

	}
	
	@Test
	public void getLedColorHex()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF");
		assertEquals("0xFFFFFF", aLed1.getLedColorHex() );

		aLed1 = null;
		aLed1 = new LedObject(4095, "FFFFFF");
		assertEquals("0xFFFFFF", aLed1.getLedColorHex() );
	}
	
	@Test
	public void setLedBrightness()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF", 42);
		aLed1.setLedBrightness(100);
		assertEquals(100, aLed1.getLedBrightness() );

		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF", 42);
		aLed1.setLedBrightness(0);
		assertEquals(0, aLed1.getLedBrightness() );
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF", 42);
		aLed1.setLedBrightness(101);
		//IllegalArgument
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF", 42);
		aLed1.setLedBrightness(66000);
		//IllegalArgument
		

	}
	
	@Test
	public void getLedBrightness()
	{
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF", 100);
		assertEquals(100, aLed1.getLedBrightness() );
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF", 0);
		assertEquals(0, aLed1.getLedBrightness() );
		
		aLed1 = null;
		aLed1 = new LedObject(4095, "0xFFFFFF", 42);
		assertEquals(42, aLed1.getLedBrightness() );
	}
	
	@Test
	public void sameColor()
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
	

}
