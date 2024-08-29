import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sgu_portable/core/error/exceptions.dart';
import 'package:sgu_portable/core/network/client_request.dart';
import 'package:sgu_portable/core/network/network_compute.dart';
import 'package:sgu_portable/core/params/login_param.dart';
import 'package:sgu_portable/domain/entities/login_entity.dart';
import 'package:sgu_portable/injection_container.dart';

abstract class LoginRemoteDataSource {
  Future<LoginEntity> login(LoginParam param);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;

  LoginRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginEntity> login(LoginParam param) =>
      requestLogin(param);

  Future<LoginEntity> requestLogin(LoginParam param) async {
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var formData = {
        'username': param.username,
        'password': param.password,
        'grant_type': 'password',
      };
      final response = await compute(
          sl<NetworkCompute>().fetchCompute,
          ClientRequest(
            url: '/auth/login',
            body: formData,
            method: 'post',
            options: Options(
                headers: headers,
                contentType: Headers.formUrlEncodedContentType),
          ));
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
