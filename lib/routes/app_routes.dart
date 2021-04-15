import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/routes/app_routes_factory.dart';
import 'package:flutter_bloc_boilerplate/routes/route_path.dart';
import 'package:flutter_bloc_boilerplate/routes/routes.dart';

class AppRoutes {
  AppRoutesFactory _appRoutesFactory;
  static final AppRoutes _singleton = new AppRoutes._internal();

  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._internal() {
    _appRoutesFactory = new AppRoutesFactory();
    _appRoutesFactory.registerRoutes(AuthRoutes.name, new AuthRoutes());
  }

  Route routes(RouteSettings settings) {
    if (settings.name == RoutePath.root) {
      return null;
    }

    return _appRoutesFactory.routes(settings);
    // switch (settings.name) {
    //   case RoutePath.root:
    //     return null;
    //   case RoutePath.auth:
    //   case RoutePath.login:
    //   case RoutePath.register:
    //     return AuthRoutes.routes(settings);
    //   default:
    //     return null;
    // }
  }
}
