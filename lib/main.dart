import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'counter_modal.dart';
import 'counter_screen.dart';
import 'counter_state.dart';

void main() {
  /// Create your store as a final variable in the main function or inside a
  /// State object. This works better with Hot Reload than creating it directly
  /// in the `build` function.

  final initialState = CounterModal(
    count: 0,
    actions: 0,
    lastAction: null,
  );

  final store = Store<CounterModal>(counterReducer, initialState: initialState);

  runApp(
    FlutterReduxApp(store: store),
  );
}

class FlutterReduxApp extends StatelessWidget {
  final Store<CounterModal> store;

  const FlutterReduxApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterModal>(
      /// Pass the store to the StoreProvider. Any ancestor `StoreConnector`
      /// Widgets will find and use this value as the `Store`.
      store: store,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterScreen(),
      ),
    );
  }
}
