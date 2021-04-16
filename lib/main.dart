import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/app.dart';
import 'package:flutter_bloc_boilerplate/shared/shared.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(App());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    ..backgroundColor = ColorConstants.lightGray
    ..indicatorColor = ColorConstants.darkOrange
    ..textColor = ColorConstants.darkOrange
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
