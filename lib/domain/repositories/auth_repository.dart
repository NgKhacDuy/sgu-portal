import 'package:sgu_portable/core/params/login_param.dart';
import 'package:sgu_portable/domain/entities/login_entity.dart';

abstract class AuthRepository {
  Future<LoginEntity> login(LoginParam param);
}
