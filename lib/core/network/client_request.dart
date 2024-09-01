import 'package:dio/dio.dart';

class ClientRequest {
  final String url;
  final Map<String, dynamic>? body;
  final String method;
  final Options? options;
  final Map<String, dynamic>? queryParameters;

  ClientRequest({
    required this.url,
    this.body,
    required this.method,
    this.options,
    this.queryParameters,
  });
}
