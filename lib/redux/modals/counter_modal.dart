import 'dart:developer';

import '../store/app_state_reducer.dart';

class CounterModal {
  final int count;
  final int actions;
  final CounterActions lastAction;

  CounterModal({required this.count, required this.actions, required this.lastAction});

  static CounterModal? fromJson(dynamic json) {
    log('--------------------CounterModal? fromJson-------------------->called');
    return json != null
        ? CounterModal(
            count: json['count'],
            actions: json['actions'],
            lastAction: json['lastAction'],
          )
        : null;
  }

  dynamic toJson() {
    log('--------------------CounterModal toJson-------------------->called');
    return <String, dynamic>{
      'count': count,
      'actions': actions,
      'lastAction': lastAction,
    };
  }
}
