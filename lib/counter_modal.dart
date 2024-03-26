import 'counter_state.dart';

class CounterModal {
  final int count;
  final int actions;
  final CounterActions? lastAction;

  CounterModal({
    required this.count,
    required this.actions,
    required this.lastAction,
  });
}
