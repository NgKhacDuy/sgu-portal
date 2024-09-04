import 'package:dio/dio.dart';
import 'package:sgu_portable/core/network/api_provider.dart';
import 'package:sgu_portable/core/network/client_request.dart';

class NetworkCompute {
  final Dio dio;

  NetworkCompute(this.dio);
  Future fetchCompute(ClientRequest clientRequest) async {
    try {
      return await ApiProvider(dio).request(clientRequest);
    } catch (e) {
      rethrow;
    }
  }
}
