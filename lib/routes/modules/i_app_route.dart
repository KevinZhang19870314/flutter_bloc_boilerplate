import 'package:flutter/material.dart';

abstract class IAppRoute {
  List<String> names;

  Route routes(RouteSettings settings);
}
