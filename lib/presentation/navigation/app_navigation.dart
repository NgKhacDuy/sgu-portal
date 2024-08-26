import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sgu_portable/injection_container.dart';
import 'package:sgu_portable/presentation/screen/home_screen.dart';
import 'package:sgu_portable/presentation/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppNavigation {
  AppNavigation._();
  static String initR = sl<SharedPreferences>().getString("token") == null ||
          sl<SharedPreferences>().getString("token") == ""
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
