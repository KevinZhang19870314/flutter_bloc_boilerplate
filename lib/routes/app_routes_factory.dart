import 'package:flutter/material.dart';

import 'modules/i_app_route.dart';

class AppRoutesFactory {
  Map<String, IAppRoute> routesMap;

  Route routes(RouteSettings settings) {
    return routesMap[settings.name].routes(settings);
  }

  void registerRoutes(String routeName, IAppRoute route) {
    if (!routesMap.containsKey(routeName)) {
      routesMap[routeName] = route;
    }
  }
}
