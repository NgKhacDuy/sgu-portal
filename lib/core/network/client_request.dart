import 'package:dio/dio.dart';

class ClientRequest {
  final String url;
  final Map<String, dynamic> body;
  final String method;
  final Options? options;
  final Map<String, dynamic>? queryParameters;

  ClientRequest(
      {required this.url,
      required this.body,
      required this.method,
      required this.options,
      this.queryParameters});
}
