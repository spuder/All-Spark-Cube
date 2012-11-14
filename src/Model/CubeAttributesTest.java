package model;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;

/*
 *For some strange reason, I need to import the class 
 */
import controller.ConvertLedType;

public class CubeAttributesTest {


	
	@Test
	public void testGetNumberOfLedsPerCube()
	{
		CubeAttributes.setxNumberOfLedsPerRow(16);
		CubeAttributes.setyNumberOfRowsPerPanel(16);
		CubeAttributes.setzNumberOfPanelsPerCube(16);
//		CubeAttributes.setNumberOfLedsPerCube(4096);
		assertEquals(4096, CubeAttributes.getNumberOfLedsPerCube());
		
		CubeAttributes.setxNumberOfLedsPerRow(4);
		CubeAttributes.setyNumberOfRowsPerPanel(4);
		CubeAttributes.setzNumberOfPanelsPerCube(4);
		assertEquals(64, CubeAttributes.getNumberOfLedsPerCube());
		
		CubeAttributes.setxNumberOfLedsPerRow(5);
		CubeAttributes.setyNumberOfRowsPerPanel(2);
		CubeAttributes.setzNumberOfPanelsPerCube(0);
		assertEquals(10, CubeAttributes.getNumberOfLedsPerCube());



	}
}
