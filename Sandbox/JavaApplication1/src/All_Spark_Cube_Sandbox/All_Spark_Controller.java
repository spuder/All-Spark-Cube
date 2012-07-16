


package All_Spark_Cube_Sandbox;

import java.awt.*;

import processing.core.PApplet;

//import processing.core.*; // not sure I need this


// One tutorial says this extends JFrame, other says Panel
//public class All_Spark_Controller extends Panel{
public class All_Spark_Controller extends Frame {
  
    
    //default constructor
    public All_Spark_Controller() {
        this.setSize(1200,800);
        this.setLayout( new GridLayout());
        
        //Create constaints for Frame
       // GridBagLayout aGridbagConstriaintForFrame = new GridBagLayout();

        
        //Create Panel
        Panel aPanel = new Panel();
        Panel aPanel2 = new Panel();
            //Set Panel attributes
            //aPanel.setBounds(20,20,300,300); //should set how big the panel is inside the frame
            aPanel.setBackground(Color.blue);
            aPanel.setLayout(new GridLayout(0,1)); // set the panel to use gridlayout, that way we can center the applet inside the panel
            aPanel.setSize(200,200); // override the default size and applet size
            
            //aPanel2.setBounds(20,20,350,350);
            aPanel2.setBackground(Color.yellow);
            aPanel2.setLayout(new GridLayout(0,1));
                
            
        
        //Create a FireCube object
          processing.core.PApplet aFireCube = new PApplet(); //no need to be specific, but doesnt hurt
         // processing.core.PApplet anAnimationWindow = new AnimationWindow();
          processing.core.PApplet aProcessing_Button = new Processing_Button();
        
          //Add FireCube object to Panel
          aPanel.add(aFireCube);
         // aPanel.add(anAnimationWindow);
          aPanel2.add(aProcessing_Button);
          this.add(aPanel);// add the panel to this frame
          this.add(aPanel2);
        
        //Start FireCube
          aFireCube.init();
          //anAnimationWindow.init();
          aProcessing_Button.init(); // The most essential part
        
        //Button aButton = new Button();
        
        //aButton.setVisible(true);
        
        //aPanel.setVisible(true);
          this.setVisible(true); // Set this panel. (this panel is the instance created by the executable)
        
    }
    
    
 
    
} // end class All_Spark_Controller
