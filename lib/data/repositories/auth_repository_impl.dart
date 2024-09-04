import 'package:sgu_portable/core/params/login_param.dart';
import 'package:sgu_portable/data/datasource/local/login_local_data_source.dart';
import 'package:sgu_portable/data/datasource/remote/login_remote_data_source.dart';
import 'package:sgu_portable/domain/entities/login_entity.dart';
import 'package:sgu_portable/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  final LoginLocalDataSource loginLocalDataSource;

  AuthRepositoryImpl(this.loginRemoteDataSource, this.loginLocalDataSource);

  @override
  Future<LoginEntity> login(LoginParam param) async {
    try {
      final response = await loginRemoteDataSource.login(param);
      await loginLocalDataSource.saveToken(response.accessToken!);
      await loginLocalDataSource.saveExpireTime(response.expires!);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
