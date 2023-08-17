//import 'dart:math';

import 'package:flutter/material.dart';

import 'package:test_application/demos/petow_description.dart';
import 'package:test_application/demos/petow_home.dart';
import 'package:test_application/demos/petow_profile.dart';
//import 'package:test_application/demos/petow_requared.dart';
import 'package:test_application/demos/petow_search.dart';
import 'package:test_application/demos/petow_share_page.dart';
//import 'package:test_application/demos/petow_sign_in_page.dart';

class PetowPageView extends StatefulWidget {
  const PetowPageView({super.key});

  @override
  State<PetowPageView> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PetowPageView> {
  int currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  

  changePage(int index) {
    currentIndex = index;
    _pageController.jumpToPage(
      currentIndex,
      // duration: const Duration(milliseconds: 400),
      // curve: Curves.bounceInOut,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      resizeToAvoidBottomInset: false, //floatingactionbarı bottoma sabitler
      body:  PageView(

        controller: _pageController,
        padEnds: false,
        children: const [
          PetowHomePage(),
          PetowSearchPage(),
          PetowDescriptionPage(),
          PetowProfilePage(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
       
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PetowSharePage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     bottomNavigationBar: BottomAppBar(
      
           shadowColor: Colors.white,
           color:  Colors.purple,
           clipBehavior: Clip.hardEdge,
           surfaceTintColor: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
         
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
          
              IconButton(
               
               
                icon: const Icon(Icons.home),
                color: currentIndex == 0 ? Colors.white : Colors.white54,
                iconSize: 30,
                onPressed: () {
                  changePage(0);
                },
              ),
              IconButton(
               
                icon: const Icon(Icons.search),
                color: currentIndex == 1 ? Colors.white : Colors.white54,
                iconSize: 30,
                onPressed: () {
                  changePage(1);
                },
              ),
              const SizedBox(),
              IconButton(
                icon: const Icon(Icons.favorite_outlined),
                color: currentIndex == 2 ? Colors.white : Colors.white54,
                iconSize: 30,
                onPressed: () {
                  changePage(2);
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                color: currentIndex == 3 ? Colors.white : Colors.white54,
                iconSize: 30,
                onPressed: () {
                  changePage(3);
                },
                
              ),
           
            ],
          ),
        ),
        
      ),
     
      // bottomNavigationBar: BottomNavigationBar(
       
      //     currentIndex: currentIndex,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     onTap: changePage,
      //     backgroundColor: ProjectColor.textColor,
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.white54,
      //     type: BottomNavigationBarType.fixed,
      //     items: const [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
      //       BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
      //       BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'search'),
      //       BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'profile'),
      //     ]
      //     ),
      //  bottomNavigationBar: BottomNavigationBar(
      //  currentIndex: currentIndex,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   onTap: changePage,
      //  backgroundColor: ProjectColor.textColor,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white54,
      //   type: BottomNavigationBarType.fixed,
      //  items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add_box_outlined),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_circle_rounded),
      //       label: '',
      //     ),
      //   ],
      // ),
    );
  }
}
