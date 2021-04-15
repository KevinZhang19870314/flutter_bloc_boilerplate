import 'dart:async';

import 'package:flutter_bloc_boilerplate/models/models.dart';
import 'package:flutter_bloc_boilerplate/models/response/users_response.dart';

import 'api.dart';

class ApiRepository {
  ApiRepository({this.apiProvider});

  final ApiProvider apiProvider;

  Future<LoginResponse> login(LoginRequest data) async {
    final res = await apiProvider.login('/api/login', data);
    if (res.statusCode == 200) {
      return LoginResponse.fromJson(res.data);
    }

    return Future.error(res.statusCode);
  }

  Future<RegisterResponse> register(RegisterRequest data) async {
    final res = await apiProvider.register('/api/register', data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.data);
    }

    return Future.error(res.statusCode);
  }

  Future<UsersResponse> getUsers() async {
    final res = await apiProvider.getUsers('/api/users?page=1&per_page=12');
    if (res.statusCode == 200) {
      return UsersResponse.fromJson(res.data);
    }

    return Future.error(res.statusCode);
  }
}
