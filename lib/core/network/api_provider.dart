import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sgu_portable/core/error/exceptions.dart';
import 'package:sgu_portable/core/network/client_request.dart';

class ApiProvider {
  final Dio dio;

  ApiProvider(this.dio);

  Future<Response> request(ClientRequest clientRequest) {
    try {
      dio.options = BaseOptions(
        baseUrl: "https://thongtindaotao.sgu.edu.vn/api",
      );
      dio.interceptors.addAll([
        PrettyDioLogger(requestBody: true, requestHeader: true),
        // NetworkInterceptor(),
      ]);
      return dio.request(clientRequest.url,
          data: clientRequest.body,
          options: clientRequest.options,
          queryParameters: clientRequest.queryParameters);
    } on DioException catch (e) {
      Logger().e(e);
      throw ServerException(e.response!.statusCode!);
    } on Exception catch (e) {
      Logger().e(e);
      throw ServerException(999);
    } catch (e) {
      Logger().e("Error: $e");
      throw ServerException(999);
    }
  }
}
