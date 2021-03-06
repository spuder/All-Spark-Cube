class House{
  //house properties
  int x;
  int y;
  int w;
  int h;

  //component reference variables
  Door door;
  Window window;
  Roof roof;

  //optional autosize variable
  boolean AutoSizeComponents = false;

  //door placement
  int doorLoc = 0;
  //constants
  final static int MIDDLE_DOOR = 0;
  final static int LEFT_DOOR = 1;
  final static int RIGHT_DOOR = 2;

  //constructor
  House(int w, int h, Door door, Window window, Roof roof, int doorLoc) {
    this.w = w;
    this.h = h;
    this.door = door;
    this.window = window;
    this.roof = roof;
    this.doorLoc = doorLoc;
  }

  void drawHouse(int x, int y, boolean AutoSizeComponents) {
    this.x = x;
    this.y =y;
    this.AutoSizeComponents = AutoSizeComponents;

    //automatically sizes doors and windows
    if(AutoSizeComponents){
      //autosize door
      door.h = h/4;
      door.w = door.h/2;

      //autosize windows
      window.h = h/3;
      window.w = window.h/2;

    }
    // draw bldg block
    rect(x, y, w, h);

    // draw door
    switch(doorLoc){
    case 0:
      door.drawDoor(x+w/2-door.w/2, y+h-door.h);
      break;
    case 1:
      door.drawDoor(x+w/8, y+h-door.h);
      break;
    case 2:
      door.drawDoor(x+w-w/8-door.w,  y+h-door.h);
      break;
    }

    // draw windows
    int windowMargin = (w-window.w*2)/3;
    window.drawWindow(x+windowMargin, y+h/6);
    window.drawWindow(x+windowMargin*2+window.w, y+h/6);

    // draw roof
    roof.drawRoof(x, y, w, h);
  }

  // catch drawHouse method without boolean argument
  void drawHouse(int x, int y){
    // recall with required 3rd argument
    drawHouse(x, y, false);
  }
}