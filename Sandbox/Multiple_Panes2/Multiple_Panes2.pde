
//PFrame aPFrameObject1;
//PFrame aPFrameObject2;


void setup() {

//aPFrameObject1 = new PFrame();	

}// end setup()

void draw() {

	//aPFrameObject1();
	
}// end draw()




// http://processing.googlecode.com/svn/trunk/processing/build/javadoc/core/processing/core/PApplet.html


 public class ExampleFrame extends Frame {

     public ExampleFrame() {
         super("Embedded PApplet");

         setLayout(new BorderLayout());
         PApplet embed = new Embedded();
         add(embed, BorderLayout.CENTER);

         // important to call this whenever embedding a PApplet.
         // It ensures that the animation thread is started and
         // that other internal variables are properly set.
         embed.init();
     }
 }



  public class Embedded extends PApplet {

     public void setup() {
         // original setup code here ...
         size(400, 400);

         // prevent thread from starving everything else
         noLoop();
     }

     public void draw() {
         // drawing code goes here
     }

     public void mousePressed() {
         // do something based on mouse movement

         // update the screen (run draw once)
         redraw();
     }
 }
 