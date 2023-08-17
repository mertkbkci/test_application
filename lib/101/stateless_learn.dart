import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});
final text2 = 'mert1'; // geldik buraya taşıdık text2 yi b urdan atadık böyle yapılması daha işlevsel buna dikkat et
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
         TitleTextWidget(text: text2),//kullanım şekli
          _emptyBox(),
          const TitleTextWidget(text: 'mert2'),//veya böyle
          _emptyBox(),
          const TitleTextWidget(text: 'mert3'),
         _emptyBox(),
          const TitleTextWidget(text: 'mert4'),
          _emptyBox(),
          const TitleTextWidget(text: 'mert5'),
          _emptyBox(),
          const SizedBox(height: 20,),
          _emptyBox(),
          const _CustomContainer(),
          _emptyBox(),
        ], // text sınıfının kullanımı ve burdati texte eklenmesi bu şekilde
      ),
    );
  }

  SizedBox _emptyBox() => const SizedBox(height: 50,);
}



class _CustomContainer extends StatelessWidget {//sayfaya özgü olmasını istiyorsak alttan tire koyulacak
  const _CustomContainer({ Key? key,}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container( 
      height: 200,
      width: 200,
      padding:const EdgeInsets.only(
        top: 100,
        bottom: 100, 
        right: 25, 
        left: 25) ,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(20),
        color: Colors.red 
        ),
    );
  }
}


class TitleTextWidget extends StatelessWidget { //text styleını burda ayarlayıp üst tarafta entegre ettik 
  const TitleTextWidget({Key? key, required this.text }) : super(key: key);//kullanım şekli requared dışardan parametre almak

  final String text;//tanımlama şekli
 
  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
