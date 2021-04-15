import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/routes/routes.dart';
import 'package:flutter_bloc_boilerplate/theme/theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter flutter_bloc boilerplate',
      theme: ThemeConfig.lightTheme,
      onGenerateRoute: AppRoutes().routes,
      builder: EasyLoading.init(),
    );
  }
}
