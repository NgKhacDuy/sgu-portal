import 'package:dio/dio.dart';

class NetworkCompute {
  final Dio dio;
  NetworkCompute(this.dio);
  Future fetchCompute(Map<String, dynamic> input) async {
    return await dio.request(input["url"],
        data: input["data"],
        options: input["option"],
        queryParameters: input["queryParameters"]);
  }
}
