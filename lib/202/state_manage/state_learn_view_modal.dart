import 'package:flutter/cupertino.dart';
import 'package:test_application/202/state_manage/state_manage_learn_view.dart';

abstract class StateLearnViewModal extends State<StateManageLearnView> {
  @override
  void initState() {
    super.initState();
  }

  bool isVisible = false;
  bool isOpacity = false;

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
      isOpacity = !isOpacity;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
}
