

LedController aLedController;

color LedRed =  color(255, 0, 0);

//LedObject aLed;

void setup()
{
  size(600,600);
  //int ledCordinates, color ledColor, float ledBrightness, int ledSize
  //  aLed = new LedObject(000, LedRed, 255, 10);

  aLedController = new LedController(16);
}


void draw()
{

  //  aLed.displayOneLed();
}

void mousePressed()
{
  println("mouse pressed");
  aLedController.displayAllLeds();
}

