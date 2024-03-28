import 'package:redux/redux.dart';
import 'package:redux_counter/redux/modals/counter_modal.dart';
import 'package:redux_counter/redux/states/app_state.dart';
import 'package:redux_counter/redux/states/counter_state.dart';

import '../actions/actions.dart';

enum CounterActions { Increment, Decrement, Reset, Clear }

AppState appReducer(AppState state, dynamic action) {
  return AppState(counterState: counterReducer(state.counterState, action));
}

final counterReducer = combineReducers<CounterState>([
  TypedReducer<CounterState, IncrementAction>(_incrementAction),
  TypedReducer<CounterState, DecrementAction>(_decrementAction),
  TypedReducer<CounterState, ResetAction>(_resetAction),
  TypedReducer<CounterState, ClearAction>(_clearAction),
]);

CounterState _incrementAction(CounterState state, IncrementAction action) {
  return state.copyWith(
    CounterModal(
      count: state.counterModal.count + 1,
      actions: state.counterModal.actions + 1,
      lastAction: CounterActions.Increment.name,
    ),
  );
}

CounterState _decrementAction(CounterState state, DecrementAction action) {
  return state.copyWith(
    CounterModal(
      count: state.counterModal.count - 1,
      actions: state.counterModal.actions + 1,
      lastAction: CounterActions.Decrement.name,
    ),
  );
}

CounterState _resetAction(CounterState state, ResetAction action) {
  return state.copyWith(
    CounterModal(
      count: 0,
      actions: state.counterModal.actions + 1,
      lastAction: CounterActions.Reset.name,
    ),
  );
}

CounterState _clearAction(CounterState state, ClearAction action) {
  return state.copyWith(
    CounterModal(
      count: 0,
      actions: 0,
      lastAction: CounterActions.Clear.name,
    ),
  );
}
