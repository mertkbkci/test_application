import 'package:flutter/material.dart';
import 'package:test_application/product/navigator/navigator_manager.dart';
import 'package:test_application/product/navigator/navigator_routes.dart';

import '../../product/mixin/navigator_mixin.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> with NavigatorMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
      
        onPressed: () async {
           router.pushToPage(NavigateRoutes.homeDetail, arguments: 'mert');
        //await  NavigatorManager.instance.pushToPage(NavigateRoutes.homeDetail, arguments: 'mert');
         // Navigator.of(context).pushNamed(NavigateRoutes.homeDetail.withParaf, arguments: 'mert');
        },
        child: const Icon(Icons.arrow_right_alt_outlined),
      ),
     
      appBar: AppBar(
        title: const Text('Navigate Home View'),
      ),
    );
  }
}
