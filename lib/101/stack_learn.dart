import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(),
      body:  Stack(//üst üste binen yerlerde kesinlikle stack kullanılacak
      children: [ Container(
        color: Colors.blueGrey,
        height: 400
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350,right: 50,left: 50),
          child: Container(
            color: Colors.grey, 
            height: 100 
            ),
        ),
        Positioned(
         right: 10,
         left: 10,
         height: 70,
         top: 400,
          child: Container(
          color: Colors.green,
        ))
       ],
      ),
    );
  }
}