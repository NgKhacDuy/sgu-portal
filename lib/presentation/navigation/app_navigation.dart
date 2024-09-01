import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:sgu_portable/presentation/screen/home_screen.dart';
import 'package:sgu_portable/presentation/screen/login_screen.dart';

class AppNavigation {
  AppNavigation._();
  static String initR =
      GetStorage().read("token") == null || GetStorage().read("token") == ""
          ? "/login"
          : "/home";
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: "/login",
      builder: (__, _) => const LoginScreen(),
    ),
    GoRoute(
      path: "/home",
      builder: (__, _) => const HomeScreen(),
    )
  ], initialLocation: initR, navigatorKey: _rootNavigatorKey);
}
