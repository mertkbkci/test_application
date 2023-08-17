import 'package:flutter/material.dart';

class WidgetSizeEnumLearnView extends StatefulWidget {
  const WidgetSizeEnumLearnView({super.key});

  @override
  State<WidgetSizeEnumLearnView> createState() => _WidgetSizeEnumLearnViewState();
}

class _WidgetSizeEnumLearnViewState extends State<WidgetSizeEnumLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          height: WidgetSizes.normalCardHeight.value,
          color: Colors.red,
        ),
      ),
    );
  }
}

enum WidgetSizes { normalCardHeight, circleProfileWitdth }

extension WidgetSizesExtension on WidgetSizes {
  double get value {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 100;
      case WidgetSizes.circleProfileWitdth:
        return 50;
    }
  }
}
