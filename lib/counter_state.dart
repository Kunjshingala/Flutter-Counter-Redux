// One simple action: Increment
enum CounterActions { Increment }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
int counterReducer(int state, dynamic action) {
  if (action == CounterActions.Increment) {
    return state = state + 1;
  }
  return state;
}
