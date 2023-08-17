// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  CardLearn({super.key});
  //final ProjectMargins cardMargins = ProjectMargins();
  final ProjectColor cardColors = ProjectColor();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('yine ben'),
      ),
      body: Column(children: [
        Card(
          color: Theme.of(context).colorScheme.error,
          margin: ProjectMargins.cardMargin,
          shape: const StadiumBorder(),
          child: const SizedBox(
            height: 100,
            width: 200,
            child: Center(
                child: Text(
              'mert',
              style: TextStyle(color: Colors.black, fontSize: 20),
            )),
          ),
        ),
        Card(
          margin: ProjectMargins.cardMargin,
          color: cardColors.cardColor,
          child: const SizedBox(
            height: 100,
            width: 100,
          ),
        ),
        _CustomCard(child: const SizedBox(
            height: 100,
            width: 200,
            child: Center(
                child: Text(
              'mert',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ))
      ]),
    );
  }
}

class ProjectMargins {
 static const cardMargin =  EdgeInsets.all(10);
}

class ProjectColor {
  final Color cardColor = Colors.red;
}

//borders

//stadiumBorder
//CircleBorder
//RaundedRectagleBorder


class _CustomCard extends StatelessWidget {//buraya classı açıp cardı tanımladık sadece bu sayfaya özzel daha sonra yukarıda card yazmadan belirttik
 _CustomCard({ Key? key,required this.child,}) : super(key: key);
  final roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  final Widget child;
 
  @override
  Widget build(BuildContext context) {
   
   
   return Card(
          margin: ProjectMargins.cardMargin,
          shape: roundedRectangleBorder,
          child : child
          
          
   );
  }
}
