import 'package:flutter/material.dart';
import 'package:test_application/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(//border verir sarmalar
              child: ListTile(
                title:  const RandomImage(),
                //dense: true, sıkıştırır
                onTap: () {}, //tıklama şansını verir
                subtitle: const Text('How do you use your card'),
                leading: const Icon(Icons.money), //soluna bir şey koymak için
                trailing:const Icon(Icons.chevron_right), //sağına bir şey koymak için
              ),
            ),
          ),
        ],
      ),
    );
  }
}
