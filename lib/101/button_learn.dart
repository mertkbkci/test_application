import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //genel sayfa yapısı başlangıcı
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'örnek',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //button örnekleri
          TextButton(
            onPressed: () {}, //theme belirleme
            style: ButtonStyle(//button style bu şekil kullanımı butona bastığında özellikler alır ~=
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.amber;
              }

              return Colors.green;
            })),
            child: Text('save',
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          const ElevatedButton(onPressed: null, child: Text('ekle')),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.accessible_forward)),
          FloatingActionButton(
            onPressed: () {//onpressed kullanımı
            //servise istek at
            //sayfanın rengini düzenle vs vs yapılacak işlemler

            },
            backgroundColor: Colors.amber,
            child: const Icon(Icons.add, size: 50),
          ),
          BackButton(onPressed: () {}),
          OutlinedButton(
            style: OutlinedButton.styleFrom( //bu daha sık kullanılan bi özelleştirme
              backgroundColor: Colors.red,
              padding: const EdgeInsets.all(10),
              shape: const CircleBorder()
            ),
            onPressed: () {}, child: const Text('data')
            ),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.access_alarm), label:const Text('mert') //hem iconu hem texti yat yana buton içinde kullanabilirsin
            ),
          InkWell(
              onTap: () {}, child: const Text('custom')
              ),//widgeta button atama
             

              Container(
              height: 200,
              color: Colors.white,
              ),
             const SizedBox(height: 10),
             ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {}, child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20,right: 40,left: 40),//yazı ile box kenarlarını özelleştirme "EdgeInsts.only"
                child: Text('Place Bid'
                           , style: Theme.of(context).textTheme.headlineMedium),
              )
             
              )
        ],
      ),
    );
  }
}

//Borders:
// CircleBorder() -> yuvarlak, RoundedRectangleBorder() -> kenarları oval