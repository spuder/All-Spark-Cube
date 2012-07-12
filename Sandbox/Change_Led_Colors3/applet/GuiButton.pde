/*
Remember Think-Design-Test-Create
 Never write a single line of code until you have 
 designed it in the UML and written your unit tests
 
 This is the thinking stage, creating a sandbox
 
 */

class GuiButton {

  color buttonColor;
  float buttonXAxis;
  float buttonYAxis; // the vertical position on screen, float because it can be a fraction of the screen
  float buttonWidth;
  float buttonHeight;



  //Default Constructor
  GuiButton() {
  }

  GuiButton(float buttonXAxis, float buttonYAxis, float buttonWidth, float buttonHeight, color buttonColor)
  {
    println(buttonColor); // why is the color not becoming part of the object?
    this.buttonXAxis = buttonXAxis;
    this.buttonYAxis = buttonYAxis;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    this.buttonColor = buttonColor;
  }

  void display() // Actually send the object to the screen, implemented as method of object to allow for refreshing
  {
    fill(this.buttonColor);
    rectMode(CENTER);//specify that ellipse is created from center
    rect(this.buttonXAxis, this.buttonYAxis, this.buttonWidth, this.buttonHeight);
  }// end display()
}//end class GuiButton

