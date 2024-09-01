import 'dart:io';

import 'package:sgu_portable/presentation/navigation/app_navigation.dart';

class ServerException implements Exception {
  int? statusCode;
  ServerException(this.statusCode);

  void detect() {
    switch (statusCode) {
      case HttpStatus.unauthorized:
        AppNavigation.router.go("/login");
        break;
      default:
        return;
    }
  }
}

class CacheException implements Exception {}
