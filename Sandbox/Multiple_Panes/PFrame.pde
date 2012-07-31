public class PFrame extends Frame {
    public PFrame() {
        setBounds(100,100,400,300);
        anApplet = new secondApplet();
        add(anApplet);
        anApplet.init();
        show();
    }

}

public class secondApplet extends PApplet {
    public void setup() {
        size(400, 300);
        

        noLoop();
    }

    public void draw() {
    }
}


