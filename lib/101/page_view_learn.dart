import 'package:flutter/material.dart';
import 'package:test_application/101/icon_learn.dart';
import 'package:test_application/101/image_learn.dart';
import 'package:test_application/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7); //Bu code sana diğer sayfanın önizlemesini gösteriyor

  int _currentPageIndex = 0;

  void _updatePageIndex(int index) {
    // bi tane function ve geriye değer döndürmeyen companent ve index alıyor
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(_currentPageIndex.toString()),
          ),
          const Spacer(),
          FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(
                    duration: _DurationUtility._durationLow,
                    curve: Curves.slowMiddle); //proviusPage sayfaları geri götürür back gibi
              },
              child: const Icon(Icons.chevron_left)),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: _DurationUtility._durationLow,
                  curve: Curves.slowMiddle); //duration süre demek, curve ise sayfanın değişim şekli
            },
            child: const Icon(Icons.chevron_right),
          )
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        padEnds: false, //baştan başlatır kenarında boşluk olmaz
        
        onPageChanged: _updatePageIndex,
        children: [
          const ImageLearnView(),
          IconLearnView(),
          const StackLearn(),
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = Duration(seconds: 1);
}
