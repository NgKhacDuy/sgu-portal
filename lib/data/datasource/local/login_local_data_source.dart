import 'package:get_storage/get_storage.dart';

abstract class LoginLocalDataSource {
  Future<void> saveToken(String token);
  Future<void> saveExpireTime(String expireTime);
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  LoginLocalDataSourceImpl();

  @override
  Future<void> saveToken(String token) async {
    return await GetStorage().write('token', token);
  }

  @override
  Future<void> saveExpireTime(String expireTime) {
    return GetStorage().write('expireTime', expireTime);
  }
}
