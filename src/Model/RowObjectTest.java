package model;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class RowObjectTest {

	RowObject aRowObject;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		CubeAttributes.setxNumberOfLedsPerRow(16);
		CubeAttributes.setyNumberOfRowsPerPanel(16);
		CubeAttributes.setzNumberOfPanelsPerCube(16);
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testGetLedObject() {
		aRowObject = new RowObject(0,0);
		assertEquals(0,aRowObject.getLedObject(0).getLedNumberInCube() );
		aRowObject = new RowObject(1,0);
		assertEquals(17,aRowObject.getLedObject(1).getLedNumberInCube() );
		aRowObject = new RowObject(15,15);
		assertEquals(4095,aRowObject.getLedObject(15).getLedNumberInCube() );

	}

}
