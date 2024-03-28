import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_counter/redux/states/app_state.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StoreConnector<AppState, String>(
              converter: (store) => store.state.counterState.counterModal.count.toString(),
              builder: (context, count) {
                return Text(count);
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
                return store.state.counterState.counterModal.lastAction;
              },
              builder: (BuildContext context, lastAction) {
                return Text(
                  'Last Action was: $lastAction',
                  style: Theme.of(context).textTheme.titleSmall,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
