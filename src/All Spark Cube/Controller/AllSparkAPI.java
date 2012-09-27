package Controller;


/**
 * Write a description of interface AllSparkAPI here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public interface AllSparkAPI
{
    /**
     * An example of a method header - replace this comment with your own
     * 
     * @param  y    a sample parameter for a method
     * @return        the result produced by sampleMethod 
     */
    //int sampleMethod(int y);
    
    void writeToSerial( Model.CubeSnapshot currentlyDisplayedSnapshot, Model.CubeSnapshot snapshotToDisplay );
    int getSerialBaudRate();
    int getXNumberOfLedsPerRow();
    int getYNumberOfLedsPerPanel();
    int getZNumberOfPanelsPerCube();
    int getTotalNumberOfLeds();
    
}
