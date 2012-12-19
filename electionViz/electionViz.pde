/**
 * Visualizing election results on a map
 */
 

PFont font; // will hold our anti-aliased font
ElectionData data;// loads and holds the data in the election results CSV
String[] statePostalCodes; // holds a list of state postal codes
int currentStateIndex = 0; // what index in the statePostalCodes array are we current showing
StateData sData;
StateLocation lData;
PImage map;

/**
 * This is called once at the start to initialize things
 **/
void setup() {
  //load US map
  map = loadImage("usamap.gif");
  // create the main window
  size(map.width,map.height);
  // load the font
  font = createFont("Helvetica",36,true);
  // load in the election results data
  //data = new ElectionData(loadStrings("data/2012_US_election_state.csv"));
  //statePostalCodes = data.getAllStatePostalCodes();
}

/**
 * This is called repeatedly
 */
void draw() {
  //Set up frame and display image
  frame.setLocation((displayWidth-map.width)/2,(displayHeight-map.height)/2);
  frame.setTitle("2012 Election Vote Disparities");
  image(map,0,0);
  
  //Display static text
  textFont(font,24);
  textAlign(CENTER);
  text("OBAMA",map.height/8,map.width/2-50);
  text("ROMNEY",map.height/8,map.width/2+50);
  
  //Get mouse position
  
  //If hovering over a state...
  
  //Fill that state with a color corresponding to the size of the disparity
    
  //Display numbers
}
