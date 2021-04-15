import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/routes/routes.dart';

import 'i_app_route.dart';

class AuthRoutes implements IAppRoute {
  static final String name = RoutePath.auth;

  @override
  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.auth:
        return null;
      case RoutePath.login:
        return null;
      case RoutePath.register:
        return null;
        break;
      default:
        return null;
    }
  }
}
