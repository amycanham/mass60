import java.util.*;

/**
 * Encapsulates data about voting in a state, on a per state basis
 */
public class StateData {
  
  public String postalCode;
  public String name;
  public int votesForObama;
  public double pctForObama;
  public int votesForRomney;
  public double pctForRomney;

  // don't call this - use the factory method below
  public StateData() {
  }
  
  // Factory method used to create State objects
  public static StateData FromCsvLine(String oneCsvLine){
    // Columns: State Postal,state Name,FIPS,Obama vote,%,Romney vote,%
    String[] columns = oneCsvLine.split(",");
    StateData state = new StateData();
    state.postalCode = columns[0];
    state.name = columns[1];
    state.votesForObama = Integer.parseInt(columns[3]);
    try {
      state.pctForObama = Double.parseDouble(columns[4]);
    } catch (NumberFormatException nfe) {
      // handle case of zero votes cuasing divide by zero error
      state.pctForObama = 0;
    }
    state.votesForRomney = Integer.parseInt(columns[5]);
    state.pctForRomney = Double.parseDouble(columns[6]);
    return state;
  }  
}
