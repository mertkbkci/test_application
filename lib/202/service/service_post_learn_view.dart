import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_application/202/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    super.initState();
    name = 'mert';
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();

    final response = await _dio.post('posts', data: postModel);

    if (response.statusCode == HttpStatus.created) {
      name = 'Başarılı';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink(),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: _bodyController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Body',
            ),
          ),
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
            inputFormatters: const [],
            decoration: const InputDecoration(
              labelText: 'UserId',
            ),
          ),
          TextButton(
            onPressed: _isLoading
                ? null
                : () {
                    if (_titleController.text.isNotEmpty &&
                        _bodyController.text.isNotEmpty &&
                        _userIdController.text.isNotEmpty) {
                      final model = PostModel(
                        title: _titleController.text,
                        body: _bodyController.text,
                        userId: int.tryParse(_userIdController.text),
                      );

                      _addItemToService(model);
                    }
                  },
            child: const Text('Send'),
          )
        ],
      ),
    );
  }
}

class _PostCard extends StatefulWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  State<_PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<_PostCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: ListTile(
        title: Text(widget._model?.title ?? ''),
        subtitle: Text(widget._model?.body ?? ''),
      ),
    );
  }
}
