import 'package:flutter/material.dart';

import '../demos/password_test_field.dart';

class ThemeLearnView extends StatefulWidget {
  const ThemeLearnView({super.key});

  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
           const PasswordTestField(),
          CheckboxListTile(
            value: true,
            onChanged: (val) {},
            title: const Text('select'),
          ),
        ],
      ),
    );
  }
}

enum WidgetSizes { normalCardHeight, circleProfileWitdth }
