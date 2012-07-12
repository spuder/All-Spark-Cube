import processing.opengl.*;

/*
This code is the same as Change_led_colors except it attempts to use an itterator through  hash map instead of creating a separate arrayList

http://stackoverflow.com/questions/1066589/java-iterate-through-hashmap
 */

Led anLedObject;
Led aTemporaryDrawLed;

List listOfLeds = new ArrayList();
//Map<String, Led> hashMapOfLeds = new HashMap<String, Led>(); 
//String[] listOfHashMapKeys = {"led000", "led001", "led010"};
//ArrayList listOfHashMapKeys = new ArrayList(); // expiramenting with loop to do this // no longer needed

// Create a hashmap where String is the type of key, and Led is what will be stored


color red   =   color(255, 0, 0);
color green =   color(0, 255, 0);
color blue  =   color(0, 0, 255);
color white =   color(255, 255, 255); // White means all 3 colors are on equally
color black =   color(0, 0, 0);       // Black is snyonomous with off
color purple =  color(10, 10, 0);
color customColor;

GuiButton buttonRed;
GuiButton buttonGreen;
GuiButton buttonBlue;

RectButton rectButtonRed;

boolean locked = false; // this is for the button objects, to tell if they are pressed. 


String loadedFile[]; // Going to be our array of all characters in a line of a text file

//   setup()================================================================================>
void setup()
{
    size (300, 300, OPENGL); // Create canvas , must be first in setup function
    colorMode(RGB, 255, 255, 255); //Explicitly specify color type and scale, could also add alpha/transparency if desired
    frameRate(60); // 60 is default, 30 is good, set to 10 if slow
    
  
    //Open dialog prompt
   // new Thread(new Runnable() {public void run() {openFile(selectInput());}}).start();
  
    //Draw Buttons
    //float buttonXAxis, float buttonYAxis, float buttonWidth, float buttonHeight, color buttonColor
    buttonRed = new GuiButton(30.0, height - 15, 80.0, 30.0, color(red));
    //int ix, int iy, int isize, color icolor, color ihighlight
    rectButtonRed = new RectButton(10,10,30,color(red),color(blue));
  

  testCreateObject();
     drawOnce();
     
}//end setup()============================================================================>

/*
void openFile(String locationOfFile)
{
  if (locationOfFile == null)
  {
    println("no file selected");
  }
  else
  {                                            
    println("Opening file "+ locationOfFile);
    loadedFile = loadStrings(locationOfFile);  
    println("Calling parseFile method"); 
    parseFile(loadedFile);
  }
}// end openFile()
*/

void testCreateObject()
{
  for ( int x =0; x <=15; x++)
  {
      for (int y = 0; y <=15; y++)
      {
          listOfLeds.add(new Led(20,20,20,20));

          
      }
  }
println (listOfLeds.get(0).getLedHeight());
//  for (int i = 0; i < listOfLeds.size(); i++)
//  {
    //Led tempObject = listOfLeds.get(i);
   // println("led is  " + listOfLeds.get(i).getLedHeight());
//  }

}

/*
void parseFile(String[] loadedFile)
{
  Led led = new Led();
  println("parseFile method called");
  println("loadedFile.length " + loadedFile.length);
  for (int i = 0; i < loadedFile.length; i++)
  {
    String[] pieces = split(loadedFile[i], TAB);      
    println("created string[] pieces ");
    if ( pieces.length == 4) // if you get to the end of a line while parsing...
    {
      println("pieces[i] is: " + pieces[i]);
      anLedObject = new Led();

      //int ledLocationX, int ledLocationY, int ledWidth, int ledHeight, color ledColor
      anLedObject.setLedLocationX(20);
      anLedObject.setLedLocationY(int(random(0, 300)));
      anLedObject.setLedWidth(int(random(10, 100)));
      anLedObject.setLedHeight(int(random(10, 100)));
      color aTemporaryColor = color(int(pieces[0]), int(pieces[1]), int(pieces[2]));

      String keyString = pieces[0]; // add the name of the led to keystring ie.. led000  

      println("Created hashmap key pieces[i]- :" + keyString);
      hashMapOfLeds.put(keyString, anLedObject);  

      //listOfHashMapKeys.add(pieces[0]); // add the name of the led to index of all leds    



      // Now you have to store the elements with a string key:
      //books.put("Harry Potter III", new Book("JK Rownling", 456, "Harry Potter"));

      // Now you can access the elements by using a String index
      //Book book = books.get("Harry Potter III");
      
    }//end if
  }//end for loop
}//end parseFile
*/


void draw()
{

  // Color of background 95 = dark grey
  if (aTemporaryDrawLed != null)
  {

    aTemporaryDrawLed.display(); //Objects from hashmap are resurected as new temporary object and drawn
  }
            
}//end draw()=========================================>



void drawOnce()
{
 background(95); // This line prevents duplicate display of items
  
  buttonRed.display();
  rectButtonRed.display();
}



void mousePressed()
{
  drawOnce(); 
    //aTemporaryDrawLed.display(); 
    

    //for (Map.Entry entry: map.entrySet())    
    //doSomething(entry.getValue());
  //http://javaantipatterns.wordpress.com/2007/11/22/accessing-the-map-values-using-keyset-iterator/

/* // This is best practice because it is faster, but only works in 1.5 of java
    for (Map.Entry anEntry: hashMapOfLeds.entrySet())
    {
      print(anEntry.getValue());
    }

*/

    /*
    for (String key : hashMapOfLeds.keySet()) 
    {
      System.out.println("Key = " + key + "");
    }*/

/*
    for (int i = 0; i < hashMapOfLeds.size(); i++)
        {
              //String[] listOfHashMapKeys = {"led000","led001","led010"}; // Located earlier in code
        
        //Instead of listOfHashMap, actually use iterator

              aTemporaryDrawLed = hashMapOfLeds.get(listOfHashMapKeys.get(i));
              println(listOfHashMapKeys.get(i) + " "+ aTemporaryDrawLed.getLedLocaitonY() +" ");  
              aTemporaryDrawLed.setLedLocationX(int(random(0, 300)));
              aTemporaryDrawLed.setLedLocationY(int(random(0, 300)));
              aTemporaryDrawLed.display(); 
                 
        }
        

        */
}//end mousePressed()=========================================>


 