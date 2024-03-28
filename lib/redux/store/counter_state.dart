import 'dart:developer';

import 'package:redux_counter/redux/modals/counter_modal.dart';

import 'app_state_reducer.dart';

class CounterState {
  final CounterModal counterModal;

  CounterState({required this.counterModal});

  factory CounterState.initial() {
    log('--------------------CounterState.initial constructor-------------------->called');
    return CounterState(
      counterModal: CounterModal(
        count: 0,
        actions: 0,
        lastAction: CounterActions.Reset,
      ),
    );
  }

  static CounterState? fromJson(dynamic json) {
    log('--------------------CounterState? fromJson-------------------->called');
    return json != null
        ? CounterState(
            counterModal: CounterModal.fromJson(json['counterModal'])!,
          )
        : null;
  }

  dynamic toJson() {
    log('--------------------CounterState toJson-------------------->called');
    return {
      'counterModal': counterModal.toJson(),
    };
  }

  CounterState copyWith(CounterModal counterModal) {
    log('--------------------CounterState copyWith-------------------->called');
    return CounterState(counterModal: counterModal);
  }
}
