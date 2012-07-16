/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Kite_Example;

import javax.swing.JFrame;

/**
 *
 * @author spencerowen
 */
public class Kite_Executable_program {
    



  // create external JFrame
  private static void createGUI() {
    // create new JFrame
    JFrame jf = new JFrame("Kite Swing Application");
 
    // this allows program to exit
    jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
 
    // You add things to the contentPane in a JFrame
    jf.getContentPane().add(new KiteController());
 
    // keep window from being resized
    jf.setResizable(false);
 
    // size frame
    jf.pack();
 
    // make frame visible
    jf.setVisible(true);
  }
 
  public static void main(String[] args) {
    // threadsafe way to create a Swing GUI
    javax.swing.SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        createGUI();
      }
    }
    );
  } // end main
  
  
} // end class 

