import 'package:flutter/material.dart';

part 'part_app_bar.dart';

class PartofLearn extends StatefulWidget {
  const PartofLearn({super.key});

  @override
  State<PartofLearn> createState() => _PartofLearnState();
}

class _PartofLearnState extends State<PartofLearn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: _PartOfAppBar(), body: Text('data'));
  }
}
