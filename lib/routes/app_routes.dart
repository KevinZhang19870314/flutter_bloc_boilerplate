import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/blocs/auth/auth.dart';
import 'package:flutter_bloc_boilerplate/modules/modules.dart';
import 'package:flutter_bloc_boilerplate/routes/app_routes_factory.dart';
import 'package:flutter_bloc_boilerplate/routes/route_path.dart';
import 'package:flutter_bloc_boilerplate/routes/routes.dart';

class AppRoutes {
  static final AppRoutes _singleton = new AppRoutes._internal();

  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._internal() {
    // AuthBloc act as a global bloc use
    _authBloc = new AuthBloc();

    _appRoutesFactory = new AppRoutesFactory();
    _appRoutesFactory.registerRoutes(AuthRoutes.key, new AuthRoutes());

    print('AppRoutes._internal()');
  }

  AppRoutesFactory _appRoutesFactory;
  AuthBloc _authBloc;

  Route routes(RouteSettings settings) {
    if (settings.name == RoutePath.root) {
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _authBloc,
          child: SplashScreen(),
        ),
      );
    }

    return _appRoutesFactory.routes(settings);
  }

  void dispose() {
    _authBloc.close();
  }
}
