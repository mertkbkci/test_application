import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: Text('a' * 500),
          ),
          const SizedBox.shrink(), //boş alan için
          SizedBox.square(
            dimension: 60, //kare bi alan oluşsun istiyorsanız
            child: Text('b' * 50),
          ),
          Container(
            width: 100,
            height: 100,
            constraints: const BoxConstraints( maxWidth: 200, minWidth: 150, maxHeight: 100),// önemli kısım
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
            child: const Text('mert'),
          )
        ],
      ),
    );
  }
}
// iki farklı kullanım
class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
   
               borderRadius: BorderRadius.circular(10),
               gradient:const LinearGradient(colors: [Colors.red, Colors.black]),
               boxShadow: const [BoxShadow(color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)],
               border: Border.all(width: 10, color: Colors.white12));
}
//iki farklı kullanım
class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
            boxShadow: const [BoxShadow(color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)],
            border: Border.all(width: 10, color: Colors.white12));
}
