import 'package:flutter/material.dart';

import 'counter_state.dart';

@immutable
class AppState {
  final CounterState counterState;

  const AppState({required this.counterState});

  factory AppState.initial() {
    return AppState(
      counterState: CounterState.initial(),
    );
  }

  static AppState? fromJson(dynamic json) {
    return json != null
        ? AppState(
            counterState: CounterState.fromJson(json['counterState'])!,
          )
        : null;
  }

  dynamic toJson() {
    return <String, dynamic>{
      'counterState': counterState.toJson(),
    };
  }

  AppState copyWith({required CounterState counterState}) {
    return AppState(counterState: counterState);
  }
}
