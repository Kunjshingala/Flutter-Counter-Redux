import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_counter/test_screen.dart';

import 'counter_modal.dart';
import 'counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        centerTitle: true,
        actions: [
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
            StoreConnector<CounterModal, String>(
              converter: (store) => store.state.count.toString(),
              builder: (context, count) {
                return Text(
                  'Count : $count',
                  style: Theme.of(context).textTheme.titleSmall,
                );
              },
            ),
            const SizedBox(height: 20),
            StoreConnector<CounterModal, String>(
              converter: (store) => store.state.actions.toString(),
              builder: (context, actions) {
                return Text(
                  'Action no: $actions',
                  style: Theme.of(context).textTheme.titleSmall,
                );
              },
            ),
            const SizedBox(height: 20),
            StoreConnector<CounterModal, String?>(
              converter: (store) {
                CounterActions? lastAction = store.state.lastAction;
                if (CounterActions.Reset == lastAction) {
                  return 'Reset';
                }
                if (CounterActions.Increment == lastAction) {
                  return 'Increment';
                }
                if (CounterActions.Decrement == lastAction) {
                  return 'Decrement';
                } else {
                  return null;
                }
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
                StoreConnector<CounterModal, VoidCallback>(
                  converter: (store) {
                    /// Return a `VoidCallback`, which is a fancy name for a function
                    /// with no parameters and no return value.
                    /// It only dispatches an Increment action.
                    return () => store.dispatch(CounterActions.Increment);
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
                StoreConnector<CounterModal, VoidCallback>(
                  converter: (store) {
                    /// Return a `VoidCallback`, which is a fancy name for a function
                    /// with no parameters and no return value.
                    /// It only dispatches an Increment action.
                    return () => store.dispatch(CounterActions.Decrement);
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
            StoreConnector<CounterModal, VoidCallback>(
              converter: (store) {
                /// Return a `VoidCallback`, which is a fancy name for a function
                /// with no parameters and no return value.
                /// It only dispatches an Increment action.
                return () => store.dispatch(CounterActions.Reset);
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
