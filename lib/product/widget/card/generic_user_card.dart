import 'package:flutter/material.dart';
import 'package:test_application/303/generic_learn.dart';

class GenericUserCard extends StatelessWidget {
  const GenericUserCard({super.key, required this.model});

  final GenericUser model;
  @override
  Widget build(BuildContext context) {
    return Text(model.name);
  }
}
