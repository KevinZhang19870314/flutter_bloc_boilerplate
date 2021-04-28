import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/modules/auth/auth.dart';
import 'package:flutter_bloc_boilerplate/modules/auth/register_screen.dart';
import 'package:flutter_bloc_boilerplate/routes/routes.dart';

import 'i_app_route.dart';

class AuthRoutes implements IAppRoute {
  static final String key = RoutePath.auth;

  @override
  List<String> names = [RoutePath.auth, RoutePath.login, RoutePath.register];

  @override
  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.auth:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AuthScreen(),
        );
      case RoutePath.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LoginScreen(),
        );
      case RoutePath.register:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => RegisterScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AuthScreen(),
        );
    }
  }
}
