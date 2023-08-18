import 'package:flutter/material.dart';
import 'package:test_application/product/navigator/navigator_manager.dart';

mixin NavigatorMixin <T extends StatefulWidget> on State<T> {

NavigatorManager get router => NavigatorManager.instance;
}