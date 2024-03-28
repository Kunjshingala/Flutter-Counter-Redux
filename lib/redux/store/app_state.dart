import 'dart:developer';

import 'package:flutter/material.dart';

import 'counter_state.dart';

@immutable
class AppState {
  final CounterState counterState;

  const AppState({required this.counterState});

  factory AppState.initial() {
    log('--------------------AppState.initial constructor-------------------->called');
    return AppState(
      counterState: CounterState.initial(),
    );
  }

  static AppState? fromJson(dynamic json) {
    log('--------------------AppState? fromJson-------------------->called');

    return json != null
        ? AppState(
            counterState: CounterState.fromJson(json['counterState'])!,
          )
        : null;
  }

  dynamic toJson() {
    log('--------------------AppState? toJson-------------------->called');

    return <String, dynamic>{
      'counterState': counterState.toJson(),
    };
  }

  AppState copyWith({required CounterState counterState}) {
    log('--------------------AppState copyWith-------------------->called');
    return AppState(counterState: counterState);
  }
}
