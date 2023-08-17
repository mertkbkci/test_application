import 'package:flutter/material.dart';
import 'package:test_application/product/counter_hello_button.dart';
import 'package:test_application/product/language/language_items.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});
  //dışarıdan data aldığımız kısım
  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  //hayatı belirleyen kısım

  int _countValue = 0;

 

//   void incrementValue() {   ///bu yazdığımız kodları tek bir func ile birleştirdik
//   setState(() {
//   _countValue = _countValue + 1;
//   });
//   }

//    void deincrementValue() {
//    setState(() {
//    _countValue = _countValue - 1;
//    });
//    }

  void _updateCounter(bool isIncrement) {
    if (isIncrement) {
      _countValue = _countValue + 1;
    } else {
      _countValue = _countValue - 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(LanguageItems
                .welcomeTitle) //product dosyasına tüm stringleri yazacağımız bir file açıyoruz ve stringleri oradan çekiyoruz temiz code
            ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _incrementButton(),
            _deincrementButton(),
          ],
        ),
        body: Column(
          children: [
            Center(child: Text(_countValue.toString(), style: Theme.of(context).textTheme.headlineMedium)),
            const Placeholder(),
            const SizedBox(height: 20),
            const CounterHelloButton()
          ],
        ),
        );
  }

  FloatingActionButton _incrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(true);
      },
      child: const Icon(Icons.add),
    );
  }

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: () {
          _updateCounter(false);
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
