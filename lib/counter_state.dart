/// One simple action: Increment
enum CounterActions { Increment, Decrement, Reset }

/// The reducer, which takes the previous count and increments it in response
/// to an Increment action.
int counterReducer(int state, dynamic action) {
  if (action == CounterActions.Reset) {
    return state = 0;
  } else if (action == CounterActions.Increment) {
    return state = state + 1;
  } else if (state <= 0) {
    return state;
  } else if (action == CounterActions.Decrement) {
    return state = state - 1;
  } else {
    return state;
  }
}
