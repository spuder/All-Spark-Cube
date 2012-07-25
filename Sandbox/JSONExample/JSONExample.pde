

/*
 * JSON 4 Processing
 * Basic example 7: Creating a JSON Array of JSON Objects and saving it to a file.
 *
 * Good for saving multiple complex values, such as database tables.
 *
 * Author: Andreas Göransson, output additions: Tim Pulver
 */

import org.json.*;
import java.io.File;

void setup(){
  
  // Object creation like in example 3
  // =================================================
  
  // 1. Initialize the Array
  JSONArray myJsonUsers = new JSONArray();
  
  // 2. Create the first object & add to array
  JSONObject firstUser = new JSONObject();
  firstUser.put( "name", "Andreas" );
  firstUser.put( "age", 32 );
  myJsonUsers.put( firstUser );
  
  // 3. Create the second object
  JSONObject secondUser = new JSONObject();
  secondUser.put( "name", "Maria" );
  secondUser.put( "age", 28 );
  myJsonUsers.put( secondUser );
  
  // Writing the JSON Array / Object to a file
  // ================================================= 
 
  // will store the JSON Array in the file json_output.txt within the data directory
  File file = new File(dataPath("") + File.separator + "json_output.txt");
  // Create the data directory if it does not exist
  file.getParentFile().mkdirs();  
  try{
    // If the file already exists, it will be overwritten
    FileWriter fstream = new FileWriter(file, false);
    // Use this instead if you want to append the data to the file
    //FileWriter fstream = new FileWriter(file, true);    
    BufferedWriter out = new BufferedWriter(fstream);
    // do the actual writing
    myJsonUsers.write(out);
    // Close the stream
    out.close();
  }catch (Exception e){
    System.err.println("Error writing the JSON file: " + e.getMessage());
  } 
}

void draw(){
}
