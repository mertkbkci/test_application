import 'package:flutter/material.dart';


class PetowSearchPage extends StatelessWidget {
  const PetowSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: SearchBar(
              
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.search),

              ),
              hintText: 'Arama',
            ),
          ),
        ),
      ),
    );
  }
}
