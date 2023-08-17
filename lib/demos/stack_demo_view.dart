import 'package:flutter/material.dart';
import 'package:test_application/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});
  final _cardHeight = 70.0;
  final _cardWidth = 300.0;
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body:  Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                   Positioned.fill(
                      bottom: _cardHeight / 2, child: const RandomImage() //tüm ekranı kaplar
                      ),
                  Positioned(
                      height: _cardHeight,
                      width: _cardWidth,
                      bottom: 0,
                      child: _cardCustom())
                ],
              )),
          const Spacer(
            flex: 6,
          )
        ],
      ),
    );
  }

  Card _cardCustom() {
    return const Card(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(),
                    );
  }
}
