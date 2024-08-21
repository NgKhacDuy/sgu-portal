import 'package:dio/dio.dart';
import 'package:sgu_portable/core/error/exceptions.dart';
import 'package:sgu_portable/domain/entities/LoginEntity.dart';

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
    var formData = FormData.fromMap({
      'username': username,
      'password': password,
      'grant_type': 'password',
    });
    final response = await dio.post("thongtindaotao.sgu.edu.vn/api/auth/login",
        data: formData);
    if (response.statusCode == 200) {
      return LoginEntity.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
