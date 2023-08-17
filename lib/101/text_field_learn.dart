import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_application/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();

  final FocusNode focusNodeTextFieldOne = FocusNode();
  final FocusNode focusNodeTextFieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            maxLength: 25, //kaç karakter yazabileceğini yazdığın komut
            buildCounter: (context, {int? currentLength, bool? isFocused, int? maxLength}) {
              //buildCounter ile kendi customımızı yapabiliyoruz
              return _animatedContainer(currentLength);
            },
            keyboardType: TextInputType.emailAddress, //yazım formatını belirler
            autofillHints: const [AutofillHints.email], //klavyenin tamamlaması için
            focusNode: focusNodeTextFieldOne,
            inputFormatters: [
              //keyboard engelleme
              TextProjectInputFormatter()._formatter
            ],

            textInputAction: TextInputAction.next, //nexte bastığında aşağı geçer
            //prefixIcon başına icon koyar, OutlineInputBorder kutu içine alır,labelText verirsen kutunun üstünde yer alır,backgraundColor için fillColor kullanılır ve ardından filled: true demeniz lazım
            decoration:_InputDecaroter().emailInput//bu decorationların hepsini main.dartta ortaklaştırıp ınputTextFieldTheme da etkinleştirebilirsin
          ),
          TextFormField(
            focusNode: focusNodeTextFieldTwo,
            minLines: 2,
             maxLines: 4
          )
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
        key: key,
        height: 10,
        duration: const Duration(seconds: 1),
        width: 10.0 * (currentLength ?? 0),//burda diyoruz ki currentlengt null ise defaul 0 al demek
        color: Colors.red 
        );
  }
}

class TextProjectInputFormatter {
  //keyboard engelleme
  final _formatter = TextInputFormatter.withFunction(
    (oldValue, newValue) {
      if (newValue.text == 'a') {
        return oldValue;
      } else {
        return oldValue;
      }
    },
  );
}

class _InputDecaroter {
  final emailInput = const InputDecoration(
    prefixIcon: Icon(Icons.mail),
    border: OutlineInputBorder(),
    labelText: LanguageItems.mailTitle,
  );
}
