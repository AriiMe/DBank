import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
//create class for the canister
actor DBank {
  //holds current value of money
  //stable makes it persistent
  stable var currentValue: Float = 300;
  //replace current value
  //currentValue := 300;
  Debug.print(debug_show(currentValue));

  //current time
  stable var startTime = Time.now();
  //startTime := Time.now();

  Debug.print(debug_show(startTime));

  //let are constants
  let id = 1234155616634;

  //for debugging
  //Debug.print(debug_show(id));

  //creating a new function
  // public so it can be called from outside
  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

//function to decrease the total value
  public func withdrawl(amount: Float) {

    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Amount exceeded");
    }
    
  };

  //Query is faster
  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));

    startTime := currentTime;
  };


  //dtopUp();
}