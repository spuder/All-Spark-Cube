/**

This sandbox script is based on the sample

LoadFile 1 and  http://processing.org/reference/selectInput_.html

It prompts the user to what file to open and then addes
that file and interprets it

The file consits of 2 numbers seperated with a tab and delimited with a new
line as a set of X and Y cordinates
 */



String[] lines;
int index = 0;

void setup() {
  size(200, 200);
  background(0);
  stroke(255);
  frameRate(12);
  //lines = loadStrings("positions.txt");
  String loadPath = selectInput();// prompts user for input
  if (loadPath == null)
    {
       println("no file seclect");
    }
    else
    lines = loadStrings(loadPath);
}

void draw() {
  if (index < lines.length) {
    String[] pieces = split(lines[index], '\t');
    if (pieces.length == 2) {
      int x = int(pieces[0]) * 2;
      int y = int(pieces[1]) * 2;
      point(x, y);
    }
    // Go to the next line for the next run through draw()
    index = index + 1;
  }
}
