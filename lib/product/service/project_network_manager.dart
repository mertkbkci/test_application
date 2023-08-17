import 'package:dio/dio.dart';

class ProjectNetworkManager {//dışardan birinin bundan bir tane daha üretememesi ve bu classın tek bir instance üzerinden yüzümesi için
  ProjectNetworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: 'pub.dev'));

    _dio.options = BaseOptions();
  }

  late final Dio _dio;

  static ProjectNetworkManager instance = ProjectNetworkManager._();

  Dio get service => _dio;

  void addBaseHeaderToToken(String token) {
    //token: userın giriş yapmasıyla gelen datası
    _dio.options = _dio.options.copyWith(
      headers: {"Authorization": token},
    );
  }
}

class DurationManager {
  DurationManager._();
  static DurationManager? _manager;

  static DurationManager get manager {
    if (_manager != null) return _manager!;
    _manager = DurationManager._();
    return _manager!;
  }
}
