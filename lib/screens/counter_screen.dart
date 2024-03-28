import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_counter/redux/states/app_state.dart';
import 'package:redux_counter/screens/test_screen.dart';

import '../redux/actions/actions.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        centerTitle: true,
        actions: [
          StoreConnector<AppState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(ClearAction());
            },
            builder: (BuildContext context, callback) {
              return IconButton(
                onPressed: callback,
                icon: const Icon(Icons.lock_reset),
              );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TestScreen()));
            },
            icon: const Icon(Icons.navigate_next),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Connect the Store to a Text Widget that renders the current
            /// count.
            ///
            /// We'll wrap the Text Widget in a `StoreConnector` Widget. The
            /// `StoreConnector` will find the `Store` from the nearest
            /// `StoreProvider` ancestor, convert it into a String of the
            /// latest count, and pass that String  to the `builder` function
            /// as the `count`.
            ///
            /// Every time the button is tapped, an action is dispatched and
            /// run through the reducer. After the reducer updates the state,
            /// the Widget will be automatically rebuilt with the latest
            /// count. No need to manually manage subscriptions or Streams!
            StoreConnector<AppState, String>(
              converter: (store) => store.state.counterState.counterModal.count.toString(),
              builder: (context, count) {
                return Text(
                  'Count : $count',
                  style: Theme.of(context).textTheme.titleSmall,
                );
              },
            ),
            const SizedBox(height: 20),
            StoreConnector<AppState, String>(
              converter: (store) => store.state.counterState.counterModal.actions.toString(),
              builder: (context, actions) {
                return Text(
                  'Action no: $actions',
                  style: Theme.of(context).textTheme.titleSmall,
                );
              },
            ),
            const SizedBox(height: 20),
            StoreConnector<AppState, String>(
              converter: (store) {
                return store.state.counterState.counterModal.lastAction!;
              },
              builder: (BuildContext context, lastAction) {
                return Text(
                  'Last Action was: $lastAction',
                  style: Theme.of(context).textTheme.titleSmall,
                );
              },
            ),
            const SizedBox(height: 20),

            /// Connect the Store to a ElevatedButton. In this case, we'll
            /// use the Store to build a callback that will dispatch an Action.
            /// Then, we'll pass this callback to the button's `onPressed` handler.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    /// Return a `VoidCallback`, which is a fancy name for a function
                    /// with no parameters and no return value.
                    /// It only dispatches an Increment action.

                    return () => store.dispatch(IncrementAction());
                  },
                  builder: (context, callback) {
                    return ElevatedButton(
                      /// Attach the `callback` to the `onPressed` attribute
                      onPressed: callback,
                      child: const Icon(Icons.add),
                    );
                  },
                ),
                const SizedBox(width: 20),
                StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    /// Return a `VoidCallback`, which is a fancy name for a function
                    /// with no parameters and no return value.
                    /// It only dispatches an Decrement action.

                    return () => store.dispatch(DecrementAction());
                  },
                  builder: (context, callback) {
                    return ElevatedButton(
                      /// Attach the `callback` to the `onPressed` attribute
                      onPressed: callback,
                      child: const Icon(Icons.remove),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            StoreConnector<AppState, VoidCallback>(
              converter: (store) {
                /// Return a `VoidCallback`, which is a fancy name for a function
                /// with no parameters and no return value.
                /// It only dispatches an Reset action.

                return () => store.dispatch(ResetAction());
              },
              builder: (context, callback) {
                return ElevatedButton(
                  /// Attach the `callback` to the `onPressed` attribute
                  onPressed: callback,
                  child: const Icon(Icons.refresh),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
