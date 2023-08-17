import 'package:flutter/material.dart';

import 'package:test_application/202/cache/shared_manager.dart';
import 'package:test_application/202/cache/user_model.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;

  late final List<User> userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    await getDefaultValues();
    changeLoading();
  }

  Future<void> getDefaultValues() async {
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    //final int? counter = prefs.getInt('counter');
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            _loading(context),
          ],
          centerTitle: true,
          title: Text(
            _currentValue.toString(),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _saveValueButton(),
            _removeValueButton(),
          ],
        ),
        body: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                _onChangeValue(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  SingleChildRenderObjectWidget _loading(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(color: Theme.of(context).colorScheme.background),
          )
        : const SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
      child: const Icon(Icons.save_alt_outlined),
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _manager.removeItem(SharedKeys.counter);
        changeLoading();
      },
      child: const Icon(Icons.remove_circle_outline_outlined),
    );
  }
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User('mk', '10', 'mk10.com'),
      User('mk2', '102', 'mk10.com'),
      User('mk3', '103', 'mk10.com'),
    ];
  }
}



//generic class
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
