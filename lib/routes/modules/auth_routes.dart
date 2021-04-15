import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/routes/routes.dart';

class AuthRoutes {
  static Route routes(RouteSettings settings) {
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
