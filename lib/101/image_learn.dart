import 'package:flutter/material.dart';

class ImageLearnView extends StatelessWidget {
  const ImageLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('yine yeniden')),
      body: Column(children: [
        //Image.asset("assets/apple_books.png") ımage sağ tıklayıp vidget ile sarmalayıp size boksa çeviriyoruz
        SizedBox(
            height: 400,
            width: 300,
            child: PngImage(name: ImageItems().appleBookMart)),
        const SizedBox(height: 10),
        SizedBox(
            height: 300,
            width: 300,
            child: PngImage(name: ImageItems().appleBookWithoutPath))
      ]),
    );
  }
}

class ImageItems {
  final String appleWithBook = "assets/apple_books.png";
  final String appleBook = "assets/png/ic_apple_with_school.png";
  final String appleBookWithoutPath ="ic_apple_with_school.png"; // en etkili kullanım
  final String appleBookMart = "ic_apple_mart.png";
  final String appleAndBook = 'ic_apple.png';
}

class PngImage extends StatelessWidget {
  //en etkili kullanım
  const PngImage({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/png/$name',
        fit: BoxFit.cover); // 'assets/png/$name' bunun üzerine tıklayıp extract method yaparsanız ve alttan tire ile isim belirleiyp açarsanız daha temiz kullanım
  }
}


//Image.network derseniz eğer direkt https formatını yapıştırıp kullanabilirsiniz
//peşine de "errorBuilder: (context, error,stackTrace) => PngImage(name: name),veya, text ilede verebiliriz yani bu resim çalışmadığında bu gösterilsin gibi"