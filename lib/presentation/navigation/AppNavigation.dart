import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sgu_portable/presentation/screen/HomeScreen.dart';

class AppNavigation {
  AppNavigation._();
  static String initR = "/home";
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: "/home",
      builder: (__, _) => HomeScreen(),
    )
  ], initialLocation: initR, navigatorKey: _rootNavigatorKey);
}
