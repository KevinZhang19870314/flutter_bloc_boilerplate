import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/modules/auth/auth.dart';
import 'package:flutter_bloc_boilerplate/modules/me/cards/cards_screen.dart';
import 'package:flutter_bloc_boilerplate/routes/routes.dart';

import 'i_app_route.dart';

class MeRoutes implements IAppRoute {
  static final String key = 'me_routes_key';

  @override
  List<String> names = [RoutePath.cards];

  @override
  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.cards:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CardsScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AuthScreen(),
        );
    }
  }
}
