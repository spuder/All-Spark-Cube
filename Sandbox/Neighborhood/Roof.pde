class Roof{
  //roof properties
  int x;
  int y;
  int w;
  int h;

  // roof style
  int style = 0;
  //constants  
  final static int CATHEDRAL = 0;
  final static int GAMBREL = 1;
  final static int DOME = 2;

  // default constructor
  Roof(){
  }
   
   // constructor 2
   Roof(int style){
    this.style = style;
  }

  // draw the roof
  void drawRoof(int x, int y, int w, int h) {
    switch(style){
    case 0:
      beginShape();
      vertex(x, y);
      vertex(x+w/2, y-h/3);
      vertex(x+w, y);
      endShape(CLOSE);
      break;
    case 1:
     beginShape();
      vertex(x, y);
      vertex(x+w/7, y-h/4);
      vertex(x+w/2, y-h/2);
      vertex(x+(w-w/7), y-h/4);
      vertex(x+w, y);
      endShape(CLOSE);
      break;
    case 2:
      ellipseMode(CORNER);
      arc(x, y-h/2, w, h, PI, TWO_PI);
      line(x, y, x+w, y);
      break;
    }

  }

  // set roof style
  void setStyle(int style){
    this.style = style;
  }
}