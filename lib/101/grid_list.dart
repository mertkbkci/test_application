import 'package:flutter/material.dart';

class MyGridList extends StatelessWidget {
  const MyGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid List Example'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Number of columns in the grid
        children: List.generate(10, (index) {
          return Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.blueGrey,
            child: Center(
              child: Text(
                'Item $index',
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          );
        }
        ),
      ),
    );
  }
}


