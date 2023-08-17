import 'package:flutter/material.dart';
import 'package:test_application/demos/petow_profile_setting._page.dart';

class PetowProfilePage extends StatefulWidget {
  const PetowProfilePage({super.key});

  @override
  State<PetowProfilePage> createState() => _PetowProfilePageState();
}

class _PetowProfilePageState extends State<PetowProfilePage> {
  int ilanlar = 0;
 
  int currentIndex = 0;

  final PageController _petowPageController = PageController();

  changePage(int index) {
    currentIndex = index;
    _petowPageController.jumpToPage(
      currentIndex,
      // duration: const Duration(milliseconds: 400),
      // curve: Curves.bounceInOut,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 20, 
      fontStyle: FontStyle.normal, 
      fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: const Text('kullanici_adi'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                ilanlar += 1;
              }
              );
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: SafeArea(
        //safe area yukarıdaki şarj yerinden kurtarır seni
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 1,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            maxRadius: 75,
                            child: Icon(Icons.account_circle, size: 150),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, top: 25),
                            child: Text(
                              'Full name',
                              style: textStyle,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Text('Bio')
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [Text("$ilanlar"), const Text('ilanlar')],
                                    ),
                                  ),
                                  const Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [Text('0'), Text('takipci')],
                                    ),
                                  ),
                                  const Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [Text('0'), Text('takip')],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SizedBox(
                                height: 50,
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const PetowProfileSettingPage(),
                                        ));
                                  },
                                  child: const Text('Profili düzenle'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 50,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    image: const DecorationImage(
                      image: AssetImage("assets/png/ic_apple.png"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
