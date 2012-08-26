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

