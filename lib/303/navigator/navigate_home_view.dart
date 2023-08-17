import 'package:flutter/material.dart';
import 'package:test_application/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.of(context).pushNamed(NavigateRoutes.homeDetail.withParaf, arguments: 'mert');
        },
        child: const Icon(Icons.arrow_right_alt_outlined),
      ),
      appBar: AppBar(
        title: const Text('Navigate Home View'),
      ),
    );
  }
}
