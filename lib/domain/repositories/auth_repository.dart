import 'package:dartz/dartz.dart';
import 'package:sgu_portable/core/error/failures.dart';
import 'package:sgu_portable/domain/entities/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(String username, String password);
}
