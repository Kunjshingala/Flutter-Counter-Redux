import 'package:redux_counter/counter_modal.dart';

/// One simple action: Increment
enum CounterActions { Increment, Decrement, Reset }

/// The reducer, which takes the previous count and increments it in response
/// to an Increment action.
CounterModal counterReducer(CounterModal state, dynamic action) {
  if (action == CounterActions.Reset) {
    int count = 0;
    int actions = state.actions + 1;
    CounterActions lastAction = CounterActions.Reset;

    return CounterModal(count: count, actions: actions, lastAction: lastAction);
  } else if (action == CounterActions.Increment) {
    int count = state.count + 1;
    int actions = state.actions + 1;
    CounterActions lastAction = CounterActions.Increment;

    return CounterModal(count: count, actions: actions, lastAction: lastAction);
  } else if (action == CounterActions.Decrement) {
    int count = state.count - 1;
    int actions = state.actions + 1;
    CounterActions lastAction = CounterActions.Decrement;

    return CounterModal(count: count, actions: actions, lastAction: lastAction);
  } else {
    return state;
  }
}
