import 'package:flutter/material.dart';

import 'package:test_application/202/package/loading_bar.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://google.com');

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
        onPressed: _launchUrl,
        child: const Icon(Icons.launch),
      ),
      body: Column(
        children: [
          Text('Package Learn View', style: Theme.of(context).textTheme.titleMedium),
          const LoadingBar(size: 100),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
