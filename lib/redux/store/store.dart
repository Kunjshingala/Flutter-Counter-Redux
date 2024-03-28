import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';

import 'app_state.dart';
import 'app_state_reducer.dart';

late Store<AppState> store;

Future<Store<AppState>> createStore() async {
  dynamic initialState;

  log('--------------------JsonSerializer(AppState.fromJson)-------------------->${AppState.fromJson.toString()}');

  final persistor = Persistor<AppState>(
    storage: FileStorage(await _localFile),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
    debug: kReleaseMode,
  );

  try {
    initialState = await persistor.load();
  } catch (e) {
    log('--------------------catch (e)-------------------->$e');
    initialState = null;
  }

  log('--------------------initialState-------------------->$initialState');

  return Store(
    appReducer,
    initialState: initialState ?? AppState.initial(),
    middleware: [persistor.createMiddleware()],
  );
}

Future<void> initStore() async {
  store = await createStore();
}

Store<AppState> getStore() {
  return store;
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/state.json');
}
