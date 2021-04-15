import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/routes/routes.dart';

class AppRoutes {
  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.root:
        return null;
      case RoutePath.auth:
      case RoutePath.login:
      case RoutePath.register:
        return AuthRoutes.routes(settings);
      default:
        return null;
    }
  }
}
