import 'package:dio/dio.dart';
import 'package:flutter_bloc_boilerplate/models/models.dart';

import 'interceptor/api_interceptor.dart';

class ApiProvider {
  static final ApiProvider _singleton = new ApiProvider._internal();
  static final dio = Dio();

  factory ApiProvider() {
    return _singleton;
  }

  ApiProvider._internal() {
    dio
      ..options.receiveTimeout = 15000
      ..options.responseType = ResponseType.json
      ..interceptors.add(ApiInterceptors())
      ..interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ));
  }

  Future<Response> login(String path, LoginRequest data) {
    return dio.post(path, data: data);
  }

  Future<Response> register(String path, RegisterRequest data) {
    return dio.post(path, data: data);
  }

  Future<Response> getUsers(String path) {
    return dio.get(path);
  }
}
