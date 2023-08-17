import 'package:flutter/material.dart';

class NavigateHomeDetailView extends StatefulWidget {
  const NavigateHomeDetailView({Key? key, this.id}) : super(key: key);

  final String? id;
  @override
  State<NavigateHomeDetailView> createState() => _NavigateHomeDetailViewState();
}

class _NavigateHomeDetailViewState extends State<NavigateHomeDetailView> {
  String? _id;

  @override
  initState() {
    super.initState();
    Future.microtask(() {
      final _modelId = ModalRoute.of(context)?.settings.arguments as String?;
      setState(() {
        _id = widget.id ?? _modelId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_id ?? ''),
      ),
    );
  }
}
