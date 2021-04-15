import 'package:flutter/material.dart';

import 'modules/i_app_route.dart';

class AppRoutesFactory {
  Map<String, IAppRoute> routesMap = new Map<String, IAppRoute>();

  Route routes(RouteSettings settings) {
    return routesMap[settings.name].routes(settings);
  }

  void registerRoutes(String key, IAppRoute route) {
    if (!routesMap.containsKey(key)) {
      route.names.forEach((name) {
        routesMap[name] = route;
      });
    }
  }
}
