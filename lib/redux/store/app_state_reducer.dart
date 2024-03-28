import 'dart:developer';

import 'package:redux/redux.dart';
import 'package:redux_counter/redux/modals/counter_modal.dart';
import 'package:redux_counter/redux/store/app_state.dart';
import 'package:redux_counter/redux/store/counter_state.dart';

import '../actions/actions.dart';

enum CounterActions { Increment, Decrement, Reset }

AppState appReducer(AppState state, dynamic action) {
  log('--------------------AppState appReducer-------------------->called');
  return AppState(counterState: counterReducer(state.counterState, action));
}

final counterReducer = combineReducers<CounterState>([
  TypedReducer<CounterState, IncrementAction>(_incrementAction),
  TypedReducer<CounterState, DecrementAction>(_decrementAction),
  TypedReducer<CounterState, ResetAction>(_resetAction),
]);

CounterState _incrementAction(CounterState state, IncrementAction action) {
  log('--------------------_incrementAction method-------------------->called');
  return state.copyWith(
    CounterModal(
      count: state.counterModal.count + 1,
      actions: state.counterModal.actions + 1,
      lastAction: CounterActions.Increment,
    ),
  );
}

CounterState _decrementAction(CounterState state, DecrementAction action) {
  log('--------------------_decrementAction method-------------------->called');
  return state.copyWith(
    CounterModal(
      count: state.counterModal.count - 1,
      actions: state.counterModal.actions + 1,
      lastAction: CounterActions.Decrement,
    ),
  );
}

CounterState _resetAction(CounterState state, ResetAction action) {
  log('--------------------_resetAction method-------------------->called');
  return state.copyWith(
    CounterModal(
      count: 0,
      actions: state.counterModal.actions + 1,
      lastAction: CounterActions.Reset,
    ),
  );
}
