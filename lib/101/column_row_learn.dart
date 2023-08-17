import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        //alt alta getirmek için column kullanılır
        children: [
          Expanded(
              flex:4, //flex 10 üzerinden ekranda kaplayacağı alanı temsil eder. %40
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.blue)),
                  Expanded(child: Container(color: Colors.red)),
                  Expanded(child: Container(color: Colors.green)),
                  Expanded(child: Container(color: Colors.black)),
                ],
              )
            ),
          const Spacer(flex: 2),
          const Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, //aralarında eşit boşluklar olması için yan yana
                crossAxisAlignment:CrossAxisAlignment.start, //yukarı yada aşağı gitmesi için
                ///mainAxisSize: MainAxisSize.min, //bu da alabileceği en düşük alanı kaplıyor
                children: [
                  Text('a1'), 
                  Text('a2'), 
                  Text('a3')],
              )
            ),
          const SizedBox(
            height: ProjectContainerSizes.carHeight,
            child: Column(
              children: [
                Expanded(flex: 2, child: Text('data')),
                Expanded(flex: 2, child: Text('data')),
                Expanded(flex: 2, child: Text('data')),
                Spacer(),
                Expanded(flex: 2, child: Text('data')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectContainerSizes {
  static const double carHeight = 200;
}
