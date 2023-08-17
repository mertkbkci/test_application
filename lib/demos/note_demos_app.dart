import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_application/101/image_learn.dart';

class NoteDemosApp extends StatelessWidget {
  const NoteDemosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const Text(
          'Private Screnn',
          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.arrow_back),
        actions: const [Icon(Icons.access_alarm,),Padding(padding: EdgeInsets.only(right: 10))],
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(children: [
          SizedBox(
            height: 300,
            child: PngImage(name: ImageItems().appleAndBook),
          ),
          const Text('Create Your First Note',
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700)),
          const Text('Add a note about anything your thoughtson climate change, or your history essay and share it witht the world',style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
         
         const SizedBox(height: 50),
         ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {}, child: Padding(
                padding:const EdgeInsets.only(top: 20, bottom: 20,right: 10,left: 10),//yazı ile box kenarlarını özelleştirme "EdgeInsts.only"
                child: Text('Create A Note',maxLines: 1,textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
              )
       ),
       TextButton(onPressed: () {}, child: const Text('Import Notes',style: TextStyle(fontSize: 20),))
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
       BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'profile')]),
      
    );
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
}

class TestStyle {
 static const TextStyle textStyle =  TextStyle(
    decoration:TextDecoration.none,
    fontStyle: FontStyle.normal,
     color: Colors.black87,
      wordSpacing: 4,
      letterSpacing: 1,
      fontSize: 18,
      fontWeight: FontWeight.w600
    
  ) ;
}
