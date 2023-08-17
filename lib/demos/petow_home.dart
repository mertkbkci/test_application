import 'package:flutter/material.dart';
import 'package:test_application/demos/petow_send_messages.dart';

class PetowHomePage extends StatefulWidget {
  const PetowHomePage({super.key});

  @override
  State<PetowHomePage> createState() => _PetowHomePageState();
}

class _PetowHomePageState extends State<PetowHomePage> {
  int favorite = 0;
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/png/ic_petow.png',
          fit: BoxFit.contain,
          height: kToolbarHeight,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.camera_alt_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SendMessagesScreen(),
                ),
              );
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
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
                              },
                              );
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          autofocus: false,
                          maxLength: 500,
                          decoration: _PetowCommentInputDecorator().inputCommentDecoration,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          autofocus: false,
                          maxLength: 500,
                          decoration: _PetowCommentInputDecorator().inputCommentDecoration,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          autofocus: false,
                          maxLength: 500,
                          decoration: _PetowCommentInputDecorator().inputCommentDecoration,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          autofocus: false,
                          maxLength: 500,
                          decoration: _PetowCommentInputDecorator().inputCommentDecoration,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectColor {
  static const textColor = Colors.deepPurple;
}

class _PetowCommentInputDecorator {
  final inputCommentDecoration =
      const InputDecoration(prefix: Icon(Icons.abc), border: OutlineInputBorder(), labelText: 'Yorum yaz');
}
