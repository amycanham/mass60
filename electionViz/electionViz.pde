/**
 * Visualizing election results on a map
 */
 

PFont font; // will hold our anti-aliased font
ElectionData data;// loads and holds the data in the election results CSV
String[] statePostalCodes; // holds a list of state postal codes
int currentStateIndex = 0; // what index in the statePostalCodes array are we current showing
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
  data = new ElectionData(loadStrings("data/2012_US_election_state.csv"));
  statePostalCodes = data.getAllStatePostalCodes();
}

/**
 * This is called repeatedly
 */
void draw() {
  //Set up frame and display image
  frame.setLocation((displayWidth-map.width)/2,(displayHeight-map.height)/2);
  frame.setTitle("2012 Election Vote Disparities");
  image(map,0,0)
  
  //Display static text
  
  //Get mouse position
  
  //If hovering over a state...
  
    //Fill that state with a color corresponding to the size of the disparity
    
    //Display numbers
  
  // only update if it's has been MILLIS_PER_STATE since the last time we updated
  if (millis() - lastStateMillis >= MILLIS_PER_STATE) {
    // reset everything
    smooth();
    background(0);
    fill(255);
    // draw the state name
    textFont(font,36);
    textAlign(CENTER);
    String currentPostalCode = statePostalCodes[ currentStateIndex ];
    StateData state = data.getState(currentPostalCode);
    text(state.name,WINDOW_SIZE/2,WINDOW_SIZE/4);
    // draw the obama vote count and title
    fill(50,50,250);  // blue
    text("Obama",WINDOW_SIZE/4,WINDOW_SIZE/2);
    text(Math.round(state.pctForObama)+"%",WINDOW_SIZE/4,3*WINDOW_SIZE/4);
    // draw the romney vote count and title
    fill(201,50,50);  // red
    text("Romney",3*WINDOW_SIZE/4,WINDOW_SIZE/2);
    text(Math.round(state.pctForRomney)+"%",3*WINDOW_SIZE/4,3*WINDOW_SIZE/4);
    // update which state we're showing
    currentStateIndex = (currentStateIndex+1) % statePostalCodes.length;
    // update the last time we drew a state
    lastStateMillis = millis();
  }
}

