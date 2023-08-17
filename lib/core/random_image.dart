import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  const RandomImage({super.key,  this.height = 100});
  final imageUrl =
      'https://randomwordgenerator.com/img/picture-generator/5ee2d1404d52b10ff3d8992cc12c30771037dbf85254784a70287fd2924f_640.jpg';
  final double height;
  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl, height: height, fit: BoxFit.cover);
  }
}
