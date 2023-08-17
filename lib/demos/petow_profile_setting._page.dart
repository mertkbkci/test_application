import 'package:flutter/material.dart';
//import 'package:test_application/demos/petow_requared.dart';
import 'package:test_application/demos/petow_sign_in_page.dart';

class PetowProfileSettingPage extends StatefulWidget {
  const PetowProfileSettingPage({super.key});

  @override
  State<PetowProfileSettingPage> createState() => _PetowProfileSettingPageState();
}

class _PetowProfileSettingPageState extends State<PetowProfileSettingPage> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profili Düzenle'),
        leading: TextButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: const Text('İptal'),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Bitti',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 20),
              child: CircleAvatar(
                maxRadius: 75,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.account_circle_outlined,
                    size: 125,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Profil fotoğrafı ekle',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextField(maxLength: 25, decoration: _PetowInputDecorator().petowNickNameInput),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextField(maxLength: 50, decoration: _PetowInputDecorator().petowFullNameInput),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextField(maxLength: 2000, decoration: _PetowInputDecorator().petowUrlInput),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextField(maxLength: 200, decoration: _PetowInputDecorator().petowBioInput),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextField(maxLength: 200, decoration: _PetowInputDecorator().petowPasswordInput),
                    ),
                  ],
                ),
              ),
            ),
            RadioListTile.adaptive(
              value: 'Erkek',
              title: const Text("Erkek"),
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            RadioListTile.adaptive(
              value: 'Kadın',
              title: const Text("Kadın"),
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            RadioListTile.adaptive(
              value: 'Diğer',
              title: const Text("Diğer"),
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            RadioListTile.adaptive(
              value: 'Belirtmek istemiyorum',
              title: const Text("Belirtmek istemiyorum"),
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(
                  () {
                    _selectedGender = value;
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextButton(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                child: const Text(
                  'Çıkış yap',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PetowInputDecorator {
  final petowNickNameInput = const InputDecoration(
    filled: false,
    prefixIcon: Icon(Icons.abc),
    border: OutlineInputBorder(),
    labelText: 'Kullanıcı adı',
  );

  final petowFullNameInput =
      const InputDecoration(prefix: Icon(Icons.abc), border: OutlineInputBorder(), labelText: 'Adı Soyadı');

  final petowUrlInput = const InputDecoration(
      prefix: Icon(Icons.webhook_outlined), border: OutlineInputBorder(), labelText: AutofillHints.url);
  final petowBioInput =
      const InputDecoration(prefix: Icon(Icons.description), border: OutlineInputBorder(), labelText: 'Biografi');
  final petowPasswordInput = const InputDecoration(
      prefix: Icon(Icons.password_outlined), border: OutlineInputBorder(), labelText: 'Şifreni Değiştir');
}

Future<void> _showLogoutDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.purple[100],
        title: const Text('Çıkış Yap'),
        content: const Text('Çıkmak istediğinize emin misiniz?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Hayır'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Evet'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PetowSignInPage(),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}
