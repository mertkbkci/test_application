import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});
  final IconSizes iconSize = IconSizes();
  final IconColors iconColor = IconColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello')),
      body: Column(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message_outlined,
                color: iconColor
                    .red, //aynı şekilde aşağıda renk classı oluşturup atadık
                size: iconSize
                    .iconSmall, // aşağıda clası oluşturup direk buraya atadık bu işlem birden fazla icon kullanımında her birine tek tek tanımlamaz yerine kod karmaşıklığını azaltır
              ),
              ),
          const SizedBox(height: 10),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message_outlined,
                color: Theme.of(context)
                    .iconTheme
                    .color, //theme kullanmak temanın light yada dark olması durumunda uyum sağlayıp değişir ama sabit bir renk belirlersek hep aynı kalır
                size: iconSize
                    .iconSmall, // aşağıda clası oluşturup direk buraya atadık bu işlem birden fazla icon kullanımında her birine tek tek tanımlamaz yerine kod karmaşıklığını azaltır
              ))
        ],
      ),
    );
  }
}

class IconSizes {
  //gidip Iconun yanına yazmaktansa böyle classlar açıp işini kolaylaştırmalısın kod karmaşık olmamalı
  final double iconSmall = 30;
}

class IconColors {
  //gidip Iconun yanına yazmaktansa böyle classlar açıp işini kolaylaştırmalısın kod karmaşık olmamalı
  final Color red = Colors.red;
}
