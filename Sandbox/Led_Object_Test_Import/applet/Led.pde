/*
Remember Think-Design-Test -Create
 Never write a single line of code until you have 
 designed it in the UML and written your unit tests
 
 This is the thinking stage, creating a sandbox
 */

class Led {
  int ledLocationX;
  int ledLocationY;
  int ledWidth;
  int ledHeight;
  color ledColor;


  // Default Constructor
  Led()
  {
    ledLocationX = width/2;
    ledLocationY = height/2;
    ledWidth = 50;
    ledHeight = 50;
    ledColor = color(255, 0, 0);
  }// end default constuctor


  //Constructor
  Led(int ledLocationX, int ledLocationY, int ledWidth, int ledHeight)
  {
    this.ledLocationX = ledLocationX;
    this.ledLocationY = ledLocationY;
    this.ledWidth = ledWidth;
    this.ledHeight = ledHeight;
    this.ledColor = color(255, 255, 255); // If no color passed in, assume it is white
  }// end Led constructor  



  // Full Constructor
  Led(int ledLocationX, int ledLocationY, int ledWidth, int ledHeight, color ledColor)
  {
    this.ledLocationX = ledLocationX;
    this.ledLocationY = ledLocationY;
    this.ledWidth = ledWidth;
    this.ledHeight = ledHeight;
    this.ledColor = ledColor;
  }// end Led constructor  




/*=======================================================================================
------------------------------- Getters and Setters -------------------------------------
=========================================================================================*/






  void setColor(int red, int green, int blue) // Modify color using RGB color scale 255
  {
    this.ledColor = color(red, green, blue);
  }// end setColor()



  void setCustomColor(color aColor) // Modify the color using a english word,( green , blue, red)
  {
     this.ledColor = aColor; //example aColor = color(255,0,255);
     
  }// end setCustomColor()



  void setLedLocationX(int ledLocationX)
  {
    this.ledLocationX = ledLocationX;
  }
  
  void setLedLocationY(int ledLocationY)
  {
    this.ledLocationY = ledLocationY;
  }
  
  void setLedWidth(int ledWidth)
  {
   this.ledWidth = ledWidth;
  }

  void setLedHeight(int ledHeight)
  {
    this.ledHeight = ledHeight; 
  }


  void display() // Actually send the object to the screen, implemented as method of object to allow for refreshing
  {
    fill(this.ledColor);
    ellipseMode(CENTER);//specify that ellipse is created from center
    ellipse(this.ledLocationX, this.ledLocationY, this.ledHeight, this.ledWidth);
  }// end display()
  
  
  
}//end Class Led

