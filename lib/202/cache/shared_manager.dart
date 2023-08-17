import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_application/202/cache/shared_not_initilize.dart';

enum SharedKeys {
  counter, users
}

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkInitilize() {
    if (preferences == null) {
      throw SharedNotInitializeException();
    }
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkInitilize;
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkInitilize;
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStrings(SharedKeys key) {
    _checkInitilize;
    return preferences?.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    _checkInitilize;
    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkInitilize;
    return (await preferences?.remove(key.name)) ?? false;
  }
}
