package sandbox;



/**
 * This class is to test the feasability of having a static javabean
 * The reason for this, is to see if a static bean would be the best place
 * to store the x, y, z data. 
 * 
 * Result: Yes, you can, you need to refer to it with the full path and it isn't much
 * different than making a global variable, but you can do it. 
 * @author spencerowen
 *
 */
public class StaticJavaBeans {

	
	/**
	 * @param args
	 */
	public static ABean myBean = new ABean(15,15,15);;
	
	
	public static void main(String[] args) {

		
		StaticJavaBean1 aStaticBean1 = new StaticJavaBean1();


	}

}
