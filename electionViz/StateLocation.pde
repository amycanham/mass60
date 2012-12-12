import java.util.*;

/**
 * Encapsulates data about location of each state in the map image
 */
public class StateLocation {
  
  public String postalCode;
  public int x;
  public int y;

  // don't call this - use the factory method below
  public StateLocation() {
  }
  
  // Factory method used to create State objects
  public static StateLocation FromCsvLine(String oneCsvLine){
    // Columns: STATE,X,Y
    String[] columns = oneCsvLine.split(",");
    StateLoc stateLoc = new StateLocation();
    stateLoc.postalCode = columns[0];
    stateLoc.x = Integer.parseInt(columns[1]);
    stateLoc.y = Integer.parseInt(columns[2]);
    return stateLoc;
  }  
}
