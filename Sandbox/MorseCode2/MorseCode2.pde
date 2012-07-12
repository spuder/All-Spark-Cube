/*
Example code from file load 2. Uses objects instead of list of items
*/


Record[] records;
String[] lines;
int recordCount;
//PFont body;
int num = 9; // Display this many entries on each screen.
int startingEntry = 0;  // Display from this entry number

void setup() 
{
      size(200, 200);
      fill(255);
      noLoop();
      
      //body = loadFont("TheSans-Plain-12.vlw");
      //textFont(body);
      

      String loadPath = selectInput();
      if (loadPath == null)
        {
          println("no file selected");
        }
      else 
          lines = loadStrings(loadPath);


      records = new Record[lines.length];
      for (int i = 0; i < lines.length; i++) 
      {
          String[] pieces = split(lines[i], TAB); // Load data into array
          if (pieces.length == 9) 
            {
              records[recordCount] = new Record(pieces);
              recordCount++;
            }
      }

      if (recordCount != records.length) 
        {
          records = (Record[]) subset(records, 0, recordCount);
        }
}// end setup()

void draw() 
{
    background(0);
    for (int i = 0; i < num; i++) 
    {
        int thisEntry = startingEntry + i;
        if (thisEntry < recordCount) 
        {
            text(thisEntry + " > " + records[thisEntry].name, 20, 20 + i*20);
        }
    }
}

void mousePressed() 
{
    startingEntry += num; 
    if (startingEntry > records.length) 
    {
        startingEntry = 0;  // go back to the beginning
    } 
    redraw();
}




