import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/blocs/auth/auth.dart';
import 'package:flutter_bloc_boilerplate/routes/routes.dart';
import 'package:flutter_bloc_boilerplate/theme/theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // AuthBloc act as a global bloc use
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'flutter flutter_bloc boilerplate',
        theme: ThemeConfig.lightTheme,
        onGenerateRoute: _appRouter.routes,
        builder: EasyLoading.init(),
      ),
    );
  }
}
