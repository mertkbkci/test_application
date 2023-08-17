import 'package:flutter/material.dart';
import 'package:test_application/101/icon_learn.dart';
import 'package:test_application/101/image_learn.dart';

import 'feed_view.dart';

class TabbarAdvanceLearn extends StatefulWidget {
  const TabbarAdvanceLearn({super.key});

  @override
  State<TabbarAdvanceLearn> createState() => _TabbarAdvanceLearnState();
}

class _TabbarAdvanceLearnState extends State<TabbarAdvanceLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          },
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchedValue,
          child: _myTabView(),
        ),
        body: _tabbarView(),
      ),
    );
  }

  TabBar _myTabView() {
    return TabBar(
        padding: EdgeInsets.zero,
        onTap: (int index) {},
        controller: _tabController,
        tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList());
  }

  TabBarView _tabbarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [const ImageLearnView(), IconLearnView(), IconLearnView(), const FeedView()],
    );
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}
