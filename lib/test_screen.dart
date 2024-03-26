import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';

import 'counter_modal.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test'), centerTitle: true),
      body: Center(
        child: StoreConnector<CounterModal, String>(
          converter: (store) => store.state.count.toString(),
          builder: (context, count) {
            return Text(count);
          },
        ),
      ),
    );
  }
}
