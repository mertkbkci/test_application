import 'package:flutter/material.dart';

class PetowSharePage extends StatefulWidget {
  const PetowSharePage({super.key});

  @override
  State<PetowSharePage> createState() => _PetowSharePageState();
}

class _PetowSharePageState extends State<PetowSharePage> {
  int favorite = 0;
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İlan Yükle'),
        leading: TextButton(
          
          onPressed: () {
            Navigator.pop(
                context,
               
                );
          },
          child: const Text(
            
            'İptal',),
        ),
        actions: [TextButton(onPressed: (){}, child: const Text('Bitti'))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.account_circle),
                      Text(
                        'kullanici_adi',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Image.asset('assets/png/ic_apple.png', fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$favorite'),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorited = !isFavorited;
                            if (isFavorited) {
                              favorite += 1;
                            } else {
                              favorite -= 1;
                            }
                          });
                        },
                        icon: Icon(isFavorited ? Icons.favorite : Icons.favorite_border,
                            color: isFavorited ? Colors.red : null),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.comment),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      maxLength: 500,
                      decoration: InputDecoration(
                          prefix: Icon(Icons.abc),
                          border: OutlineInputBorder(),
                          labelText: 'Sahiplendireceğin hayvan hakkında şeyler yaz'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
