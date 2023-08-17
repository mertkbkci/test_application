import 'package:flutter/material.dart';


class PetowDescriptionPage extends StatefulWidget {
  const PetowDescriptionPage({super.key});

  @override
  State<PetowDescriptionPage> createState() => _PetowDescriptionPageState();
}

class _PetowDescriptionPageState extends State<PetowDescriptionPage> {
 final int itemCount = 20;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bildirimler'),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ListView.builder(
             shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: itemCount,
                         itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Bildirim $index'),
                          );
                        },
           ),
        ),
      )

    );
  }
}
