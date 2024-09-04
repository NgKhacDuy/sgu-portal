import 'package:sgu_portable/presentation/screen/login_screen.dart';
import 'package:sgu_portable/presentation/screen/home_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static const String loginRoute = "/login";
  static const String homeRoute = "/home";

  static final DateFormat format =
      DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'");
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static String get initialRoute => _isTokenValid() ? homeRoute : loginRoute;

  static bool _isTokenValid() {
    final storage = GetStorage();
    final token = storage.read("token");
    final expireTime = storage.read("expireTime");

    if (token == null || token.isEmpty) {
      return false;
    }

    if (expireTime != null) {
      final expirationDate = format.parseUtc(expireTime);
      if (DateTime.now().isAfter(expirationDate)) {
        return false;
      }
    }

    return true;
  }

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: loginRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: homeRoute,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    initialLocation: initialRoute,
    navigatorKey: _rootNavigatorKey,
  );
}
