//bir ekran olacak
//bu ekranda 3 button ve bunlara basınca renk değişimi olacak
//seçili olan button selected icon olsun

import 'package:flutter/material.dart';
import 'package:test_application/product/language/language_items.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key, required this.initialColor});

  final Color? initialColor; //bu satır color life cycle'dan sonra gelip yazılmıştır

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ??
        Colors
            .transparent; //bunu böyle dedikten sonra bir daha set state dememize gerek yok çünkü bu life cycle daha draw edilmeden önce çalışır
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);

  
    if (widget.initialColor != _backgroundColor && widget.initialColor != null) {
      //bu da color_life_cycle_view den sonra yazıldı yaşam döngüsü için
      changeBackgroundColor(widget.initialColor!);
    }
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTab, items: const [
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.red), label: LanguageItems.colorDemosLabelR),
        BottomNavigationBarItem(
            icon: _ColorContainer(
              color: Colors.yellow,
            ),
            label: LanguageItems.colorDemosLabelY),
        BottomNavigationBarItem(
            icon: _ColorContainer(
              color: Colors.purple,
            ),
            label: LanguageItems.colorDemosLabelP)
      ]),
    );
  }

  void _colorOnTab(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.purple.index) {
      changeBackgroundColor(Colors.purple);
    }
  }
}

enum _MyColors { red, yellow, purple } // value 0 olması 1 veya olmasını ayırt edemez enum da valueları belirler

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);
  
  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return Container(height: 10, width: 10, color: color);
  }
}
