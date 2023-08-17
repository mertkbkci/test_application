// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomWidgetLearn extends StatelessWidget with _ColorsUtility {
  CustomWidgetLearn({super.key});
  final String title = 'Food';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle.dark),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width, //uzatır
                child: CustomFoodButton(
                  title: title, onPressed: () {},
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          CustomFoodButton(title: title,onPressed: () {},)
        ],
      ),
    );
  }
}

mixin _ColorsUtility {
  final Color whiteColor = Colors.white;
  final Color redColor = Colors.red;
}

mixin _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(10.0);
  final EdgeInsets normal2xxPadding = const EdgeInsets.all(20.0);
}

class CustomFoodButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomFoodButton({
    Key? key,
    required this.title, required this.onPressed,
  }) : super(key: key);

  final String title;

  final void Function() onPressed; //callback
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: redColor, 
            shape: const StadiumBorder()),
        onPressed: onPressed,
        child: Padding(
          padding: normalPadding,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: whiteColor, 
                fontWeight: FontWeight.bold),
          ),
        ),
        );
  }
}
