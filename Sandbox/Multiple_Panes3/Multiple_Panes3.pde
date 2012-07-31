
//Saves us from having to create several classes by importing
//this custom library

****Update this is causing issues with opengl ***
** Do not use until further tested. 

import com.shigeodayo.pframe.*;
import processing.opengl.*;


PreferencePanel preferencePanelApplet;
PFrame         preferencePanelFrame;
CircleObject   aCircle;

  void setup()
  {
    size(200,200, OPENGL);
    preferencePanelApplet = new PreferencePanel();
      preferencePanelFrame  = new PFrame( preferencePanelApplet, 210, 0);
      preferencePanelFrame.setTitle("Prefrence Pane");
      
      aCircle = new CircleObject();
    
  }//end setup
  
  void draw()
  {
    
  }



