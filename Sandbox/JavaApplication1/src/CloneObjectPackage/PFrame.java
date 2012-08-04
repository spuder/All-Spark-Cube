/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CloneObjectPackage;

import processing.core.PApplet;


public class PFrame extends java.awt.Frame 
{
    public PFrame() 
    {
        
       setBounds(300,screen.height/2, screen.width/2,screen.height/2);
       aSecondApplet = new secondApplet();
                        add(aSecondApplet);
                            aSecondApplet.init();
        show();
    }

}// end PFrame



