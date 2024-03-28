class CounterModal {
  final int count;
  final int actions;
  final String lastAction;

  CounterModal({required this.count, required this.actions, required this.lastAction});

  static CounterModal? fromJson(dynamic json) {
    return json != null
        ? CounterModal(
            count: json['count'],
            actions: json['actions'],
            lastAction: json['lastAction'],
          )
        : null;
  }

  dynamic toJson() {
    return <String, dynamic>{
      'count': count,
      'actions': actions,
      'lastAction': lastAction,
    };
  }
}
