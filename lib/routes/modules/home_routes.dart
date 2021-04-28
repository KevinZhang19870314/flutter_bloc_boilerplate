import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/blocs/home/home.dart';
import 'package:flutter_bloc_boilerplate/modules/modules.dart';
import 'package:flutter_bloc_boilerplate/routes/routes.dart';

import 'i_app_route.dart';

class HomeRoutes implements IAppRoute {
  static final String key = RoutePath.home;
  final HomeBloc _homeBloc = new HomeBloc();

  @override
  List<String> names = [RoutePath.home];

  @override
  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: _homeBloc,
            child: HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AuthScreen(),
        );
    }
  }
}
