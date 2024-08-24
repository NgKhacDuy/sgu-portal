import 'package:dio/dio.dart';
import 'package:sgu_portable/core/network/client_request.dart';

class NetworkCompute {
  final Dio dio;
  NetworkCompute(this.dio);
  Future fetchCompute(ClientRequest clientRequest) async {
    return await dio.request(clientRequest.url,
        data: clientRequest.body,
        options: clientRequest.options,
        queryParameters: clientRequest.queryParameters);
  }
}
