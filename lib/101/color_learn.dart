import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
   ColorLearn({super.key});
  final ColorItems colorPorchase = ColorItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('hello')),
      body: Column(
        children: [
          Container(height: 700,width: 500,
            color: colorPorchase.porchase,
            child: const Text('mert', textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
          ),
        ],
      ),
    );
  }
}

class ColorItems {
  final Color porchase = const Color(0xffEDBF61);
}
