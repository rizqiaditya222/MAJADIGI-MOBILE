import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://159.223.67.39:5001',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();

          final token = prefs.getString('token');

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] =
            'Bearer $token';
          }

          print('''
================ REQUEST ================
${options.method}
${options.uri}
Headers : ${options.headers}
Body    : ${options.data}
========================================
''');

          handler.next(options);
        },

        onResponse: (response, handler) {
          print('''
================ RESPONSE ================
${response.statusCode}
${response.requestOptions.uri}
${response.data}
==========================================
''');

          handler.next(response);
        },

        onError: (error, handler) {
          print('''
================ ERROR ==================
${error.response?.statusCode}
${error.response?.data}
=========================================
''');

          handler.next(error);
        },
      ),
    );
  }
}