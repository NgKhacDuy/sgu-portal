import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sgu_portable/core/error/failures.dart';
import 'package:sgu_portable/core/usecase/usecase.dart';
import 'package:sgu_portable/domain/entities/LoginEntity.dart';
import 'package:sgu_portable/domain/repositories/AuthRepository.dart';

class LoginUsecase implements UseCase<LoginEntity, Params> {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, LoginEntity>> call(Params params) async {
    return await repository.login(params.username, params.password);
  }
}

class Params extends Equatable {
  final String username;
  final String password;

  const Params({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
