import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sgu_portable/core/error/exceptions.dart';
import 'package:sgu_portable/core/network/network_compute.dart';
import 'package:sgu_portable/domain/entities/LoginEntity.dart';
import 'package:sgu_portable/injection_container.dart';

abstract class LoginRemoteDataSource {
  Future<LoginEntity> login(String username, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;

  LoginRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginEntity> login(String username, String password) =>
      requestLogin(username, password);

  Future<LoginEntity> requestLogin(String username, String password) async {
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var formData = {
        'username': username,
        'password': password,
        'grant_type': 'password',
      };
      final response = await compute(sl<NetworkCompute>().fetchCompute, {
        'url': '/auth/login',
        'data': formData,
        'option': Options(
            method: 'POST',
            headers: headers,
            contentType: Headers.formUrlEncodedContentType),
      });
      if (response.statusCode == 200) {
        return LoginEntity.fromJson(response.data);
      } else {
        throw ServerException(response.statusCode!);
      }
    } catch (e) {
      rethrow;
    }
  }
}
