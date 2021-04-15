import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/routes/routes.dart';

import 'i_app_route.dart';

class HomeRoutes implements IAppRoute {
  static final String key = RoutePath.home;

  @override
  List<String> names = [RoutePath.home];

  @override
  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return null;
        break;
      default:
        return null;
    }
  }
}
