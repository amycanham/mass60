import java.util.*;

/**
 * Encapsulates data about voting across the nation, on a per state basis
 */
public class ElectionData {

  // map from state 2-letter postal code to StateData object
  public HashMap<String,StateData> stateLookup;
  
  public ElectionData(String[] lines) {
    this.stateLookup = new HashMap<String,StateData>();
    this.parseFromCsvLines(lines);
  }

  private void parseFromCsvLines(String[] lines) {
    // skip first line, it has column headers
    for(int i=1; i<lines.length; i++) {
      // create the state record
      StateData state = StateData.FromCsvLine(lines[i]);
      this.stateLookup.put(state.postalCode, state);
    }
  }
  
  public String[] getAllStatePostalCodes(){
    return this.stateLookup.keySet().toArray(new String[0]);
  }
  
  public StateData[] getAllStates(){
    return this.stateLookup.values().toArray(new StateData[0]);
  }
  
  public StateData getState(String postalCode){
   return this.stateLookup.get(postalCode);
  }
  
  public int getStateCount(){
    return this.stateLookup.size();
  }

}
