import 'package:redux_counter/redux/modals/counter_modal.dart';

import '../reducers/app_state_reducer.dart';

class CounterState {
  final CounterModal counterModal;

  CounterState({required this.counterModal});

  factory CounterState.initial() {
    return CounterState(
      counterModal: CounterModal(
        count: 0,
        actions: 0,
        lastAction: CounterActions.Reset.name,
      ),
    );
  }

  static CounterState? fromJson(dynamic json) {
    return json != null
        ? CounterState(
            counterModal: CounterModal.fromJson(json['counterModal'])!,
          )
        : null;
  }

  dynamic toJson() {
    return {
      'counterModal': counterModal.toJson(),
    };
  }

  CounterState copyWith(CounterModal counterModal) {
    return CounterState(counterModal: counterModal);
  }
}
