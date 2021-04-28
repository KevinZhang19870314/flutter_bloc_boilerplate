import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/modules/modules.dart';
import 'package:flutter_bloc_boilerplate/routes/app_routes_factory.dart';
import 'package:flutter_bloc_boilerplate/routes/modules/home_routes.dart';
import 'package:flutter_bloc_boilerplate/routes/route_path.dart';
import 'package:flutter_bloc_boilerplate/routes/routes.dart';

import 'modules/me_routes.dart';

class AppRoutes {
  static final AppRoutes _singleton = new AppRoutes._internal();

  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._internal() {
    _appRoutesFactory = new AppRoutesFactory();
    _appRoutesFactory.registerRoutes(AuthRoutes.key, new AuthRoutes());
    _appRoutesFactory.registerRoutes(HomeRoutes.key, new HomeRoutes());
    _appRoutesFactory.registerRoutes(MeRoutes.key, new MeRoutes());

    print('AppRoutes._internal()');
  }

  AppRoutesFactory _appRoutesFactory;

  Route routes(RouteSettings settings) {
    if (settings.name == RoutePath.root) {
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => SplashScreen(),
      );
    }

    return _appRoutesFactory.routes(settings);
  }
}
