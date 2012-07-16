/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package All_Spark_Cube_Sandbox;

import java.awt.*;
import java.awt.Frame;
import processing.core.*;
//import processing.opengl.*
//import javax.media.opengl.GL;

public class All_Spark_Executable {
    

    /* This is called by the main method. I'ts purpose is to actually create the
    * Panels and add objects to those panels
    *
    */
    private static void releaseThePanelsDangit(){ 
        
        
        //Create frame object
        //An Applet attaches to a Panel and a Panel attaches to a frame
      //  Frame aFrame = new Frame();
      //      aFrame.setSize(600,600);
            
        
     //   Panel anAllSparkController = new All_Spark_Controller();
      //  anAllSparkController.setVisible(true);
        
      
        
        
       
        
     //   aFrame.add(anAllSparkController, BorderLayout.CENTER);
        
        
       
      //  aFrame.setVisible(true);
        
        
       
        
 

  
  
    }//end releaseThePanelsDangit()
    
    
    
    
    

  public static void main(String[] args) {
      
      
 
   
      // threadsafe way to create a Swing GUI
    javax.swing.SwingUtilities.invokeLater(new Runnable() {
        public void run() {

           // releaseThePanelsDangit();
            new All_Spark_Controller().setVisible(true);


        }
    }
    );
    
  }//end main 
  
  
  
  
  
  
} // end class All_Spark_Executable