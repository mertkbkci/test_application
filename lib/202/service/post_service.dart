import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'comment_model.dart';
import 'post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostService implements IPostService {
  final Dio _dio;
  PostService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response = await _dio.post(_PostServicePaths.posts.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioException catch (exception) {
      _ShowDebugMessage.showDebugMessage(exception, this);
    }
    return false;
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response = await _dio.post('${_PostServicePaths.posts.name}/id', data: postModel);

      return response.statusCode == HttpStatus.ok;
    } on DioException catch (exception) {
      _ShowDebugMessage.showDebugMessage(exception, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.post('${_PostServicePaths.posts.name}/id');

      return response.statusCode == HttpStatus.created;
    } on DioException catch (exception) {
      _ShowDebugMessage.showDebugMessage(exception, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _dio.get(_PostServicePaths.posts.name); //await bu kodu bekle bundan sonra aşağı devam etme

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (exception) {
      _ShowDebugMessage.showDebugMessage(exception, this);
    }

    return null;
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      final response = await _dio.get(
        _PostServicePaths.comments.name,
        queryParameters: {_PostQueryePaths.postId.name: postId},
      ); //await bu kodu bekle bundan sonra aşağı devam etme

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (exception) {
      _ShowDebugMessage.showDebugMessage(exception, this);
    }
    return null;
  }
}

enum _PostServicePaths { posts, comments }

enum _PostQueryePaths { postId }

class _ShowDebugMessage {
  static void showDebugMessage<T>(DioException error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-----');
    }
  }
}
