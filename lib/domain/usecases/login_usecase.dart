import 'package:sgu_portable/core/params/login_param.dart';
import 'package:sgu_portable/core/usecase/usecase.dart';
import 'package:sgu_portable/domain/entities/login_entity.dart';
import 'package:sgu_portable/domain/repositories/auth_repository.dart';

class LoginUsecase implements UseCase<LoginEntity, LoginParam> {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<LoginEntity> call({LoginParam? params}) async {
    return await repository.login(params!);
  }
}
