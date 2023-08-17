import 'package:flutter/material.dart';

import 'color_demos_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({super.key});

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleState();
}

class _ColorLifeCycleState extends State<ColorLifeCycleView> {
 
  Color? _backgroundColor; //adam backgroundColurı vermeyebilir bu ihtimale karşılık noneable dediğimiz '?' işaretini kullanır

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _changeBackground,
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body:  Column(
        children: [
          const Spacer(),
          Expanded(
            child: ColorDemos(
              //sayfanın yarısını Colordemos sayfasına ayırıyor
              initialColor: _backgroundColor, //tekrar ColorsDemosa yazdığımız kodlar sayesinde buraya default olarak siyahla başlayacak
            ),
          ),
        ],
      ),
    );
  }

  void _changeBackground() {
            setState(() {
              _backgroundColor = Colors.pink;
            });
          }
}
