import 'package:flutter/material.dart';

class Deneme extends StatelessWidget {
  const Deneme({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(


 floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
          context: context, 
          builder: (context) => Container( 
            height: 200
            ),
        );
      },



     ),
      );
  }
}