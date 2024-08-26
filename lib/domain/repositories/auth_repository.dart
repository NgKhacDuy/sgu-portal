import 'package:sgu_portable/domain/entities/login_entity.dart';

abstract class AuthRepository {
  Future<LoginEntity> login(String username, String password);
}
