import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        onChanged: () {},
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                return (value?.isNotEmpty ?? false) ? null : "Bu alan boş geçilemez!";
              },
            ),
            TextFormField(
              validator: (value) {
                return (value?.isNotEmpty ?? false) ? null : "Bu alan boş geçilemez!";
              },
            ),
            TextFormField(
              validator: (value) {
                return (value?.isNotEmpty ?? false) ? null : "Bu alan boş geçilemez!";
              },
            ),
            DropdownButtonFormField(items: const [
              DropdownMenuItem(value: 1, child: Text("1")),
              DropdownMenuItem(value: 2, child: Text("2")),
              DropdownMenuItem(value: 3, child: Text("3")),
            ], onChanged: (value) {}),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    if (kDebugMode) {
                      print('okey');
                    }
                  }
                },
                child: const Text("Kaydet"))
          ],
        ),
      ),
    );
  }
}
