import 'package:dio/dio.dart';
import 'package:sgu_portable/presentation/navigation/app_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkInterceptor extends Interceptor {
  final SharedPreferences sharedPreferences;
  NetworkInterceptor(this.sharedPreferences);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final fref = sharedPreferences.getString("token");
    options.headers["Authorization"] = "Bearer $fref";
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 &&
        err.response?.data["message"] == "expired") {
      AppNavigation.router.go("/login");
    }
    handler.next(err);
  }
}
