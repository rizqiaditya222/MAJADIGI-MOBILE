import 'package:dio/dio.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio(BaseOptions(
      baseUrl: 'http://159.223.67.39:5001',
      connectTimeout: Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ));
    return dio;
  }
}