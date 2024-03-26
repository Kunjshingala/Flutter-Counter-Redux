import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'counter_screen.dart';
import 'counter_state.dart';

void main() {
  // Create your store as a final variable in the main function or inside a
  // State object. This works better with Hot Reload than creating it directly
  // in the `build` function.
  final store = Store<int>(counterReducer, initialState: 0);

  runApp(
    FlutterReduxApp(title: 'Flutter Redux Demo', store: store),
  );
}

class FlutterReduxApp extends StatelessWidget {
  final Store<int> store;
  final String title;

  const FlutterReduxApp({super.key, required this.store, required this.title});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
      // Widgets will find and use this value as the `Store`.
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: const CounterScreen(),
      ),
    );
  }
}
