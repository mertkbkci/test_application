

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_application/303/reqrest_resource/model/resource_model.dart';
import 'package:test_application/product/global/resource_context.dart';

abstract class IReqresService {
  IReqresService(this.dio);
  final Dio dio;

  Future<ResourceModel?> fetchResourceItem();

  void saveModel(ResourceContext resourceContext) {}
}

enum _ReqResServicePaths {
  resource,
}

class ReqresServise extends IReqresService {
  ReqresServise(Dio dio) : super(dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get('/${_ReqResServicePaths.resource.name}');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;

      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
