import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDataSource {
  Future<bool> saveToken(String token);
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> saveToken(String token) async {
    return sharedPreferences.setString('token', token);
  }
}
