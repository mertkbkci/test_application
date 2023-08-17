import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold samples",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: const Text("merhaba",
      style: TextStyle(color: Colors.black, fontSize: 20)),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
          context: context, 
          builder: (context) => Container( 
            height: 200
            ),
            );
      }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const Drawer(),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'profile'),
      ]
      ),
    );
  }
}
