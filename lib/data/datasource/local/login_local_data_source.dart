import 'package:get_storage/get_storage.dart';

abstract class LoginLocalDataSource {
  Future<void> saveToken(String token);
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  LoginLocalDataSourceImpl();

  @override
  Future<void> saveToken(String token) async {
    return GetStorage().write('token', token);
  }
}
