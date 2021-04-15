import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'loading_apis.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    print("REQUEST[${options?.method}] => PATH: ${options?.path}");
    var prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    if (accessToken != null) {
      options.headers.putIfAbsent('Authorization', () => 'Bearer $accessToken');
    }

    if (isInLoadingApis(options?.uri?.path)) {
      EasyLoading.show(status: 'loading...');
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    print(
        "RESPONSE[${response?.statusCode}] => PATH: ${response?.realUri?.path}");
    _refreshAccessToken(response);

    if (isInLoadingApis(response?.realUri?.path)) {
      EasyLoading.dismiss();
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        "ERROR[${err?.response?.statusCode}] => PATH: ${err?.requestOptions?.path}");

    if (isInLoadingApis(err?.requestOptions?.path) || err?.response == null) {
      EasyLoading.dismiss();
    }

    if (err?.response?.statusCode == 401) {
      // TODO: go to auth page
      EasyLoading.dismiss();
    }
  }

  _refreshAccessToken(Response response) async {
    var prefs = await SharedPreferences.getInstance();
    var accessToken = response.headers.map['access_token'] != null
        ? response.headers.map['access_token'][0]
        : null;
    if (accessToken != null) {
      prefs.setString('access_token', accessToken);
    }
  }
}
