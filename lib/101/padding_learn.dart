import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  PaddingLearn({super.key});
  
  final ProjectPadding pagePadding = ProjectPadding();
  final ProjectPadding pagePaddingRight = ProjectPadding();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hello'),
      ),
      body: Padding(
        padding: pagePadding
            .pagePaddingVertical + pagePaddingRight.pagePaddingRightOnly, //columa aynı işlemi uygulayıp wrap wtih widget yaparak paddingle sarmaladık tüm içindekiler bu paddingden başlayacak
        child: Column(
            // eğer direkt ana widgeta verirseniz otamatik olarak içindekiler ordan başlayacak
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      color: Colors.white,
                      height:
                          100) // padding vermek için ctrl. ile with wrap widget deyip onu padding ile sarmalıyorsun
                  ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal:
                          20), // simetric ise böyle vertical üstten horizontal yandan
                  child: Container(color: Colors.amber, height: 100)),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      right: 20,
                      left:
                          20), //only ile tek tek top bottom left right ile verebilirsin ama tabi bunlar class içinde yapılıp atanmalı düzgün bir kod için
                  child: Container(color: Colors.red, height: 100)),
              const Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Text('mert', style: TextStyle(fontSize: 30)))
            ]),
      ),
    );
  }
}

class ProjectPadding {
  final pagePaddingVertical = const EdgeInsets.symmetric(vertical: 20);
 
  final pagePaddingRightOnly = const EdgeInsets.only(right: 30);
}
