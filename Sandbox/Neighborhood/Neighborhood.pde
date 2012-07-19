void setup(){
  size(200, 200);
  background(190);
  smooth();
  // Ground plane
  int groundHeight = 10;
  fill(0);
  rect(0, height-groundHeight, width, groundHeight);
  fill(255);
  
  // Center the houses
  translate(12, 0);

  // Houses
  Door door1 = new Door(20, 40);
  Window window1 = new Window(50, 62, false, Window.DOUBLE);
  Roof roof1 = new Roof(Roof.DOME);
  House house1 = new House(75, 75, door1, window1, roof1, House.MIDDLE_DOOR);
  house1.drawHouse(0, height-groundHeight-house1.h, true);

  Door door2 = new Door(20, 40);
  Window window2 = new Window(50, 62, true, Window.QUAD);
  Roof roof2 = new Roof(Roof.GAMBREL);
  House house2 = new House(100, 60, door2, window2, roof2, House.LEFT_DOOR);
  house2.drawHouse(house1.x + house1.w, height-groundHeight-house2.h, true);
}