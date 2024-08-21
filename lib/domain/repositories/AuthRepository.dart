import 'package:dartz/dartz.dart';
import 'package:sgu_portable/core/error/failures.dart';
import 'package:sgu_portable/domain/entities/LoginEntity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(String username, String password);
}
