import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sgu_portable/core/network/client_request.dart';
import 'package:sgu_portable/core/network/interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  ApiProvider(this.dio, this.sharedPreferences);

  Future<Response> request(ClientRequest clientRequest) {
    dio.options = BaseOptions(
      baseUrl: "https://thongtindaotao.sgu.edu.vn/api",
    );
    dio.interceptors.addAll([
      PrettyDioLogger(),
      NetworkInterceptor(sharedPreferences),
    ]);
    return dio.request(clientRequest.url,
        data: clientRequest.body,
        options: Options(method: clientRequest.method),
        queryParameters: clientRequest.queryParameters);
  }
}
