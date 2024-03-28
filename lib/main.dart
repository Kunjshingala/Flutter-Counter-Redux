import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_counter/redux/store/app_state.dart';
import 'package:redux_counter/screens/counter_screen.dart';

import 'redux/store/store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initStore();

  /// Create your store as a final variable in the main function or inside a
  /// State object. This works better with Hot Reload than creating it directly
  /// in the `build` function.
  final store = getStore();

  runApp(FlutterReduxApp(store: store));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<AppState> store;

  const FlutterReduxApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
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
