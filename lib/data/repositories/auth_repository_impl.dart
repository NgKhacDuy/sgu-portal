import 'package:dartz/dartz.dart';
import 'package:sgu_portable/core/error/exceptions.dart';
import 'package:sgu_portable/core/error/failures.dart';
import 'package:sgu_portable/data/datasource/remote/login_remote_data_source.dart';
import 'package:sgu_portable/domain/entities/LoginEntity.dart';
import 'package:sgu_portable/domain/repositories/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  AuthRepositoryImpl(this.loginRemoteDataSource);

  @override
  Future<Either<Failure, LoginEntity>> login(
      String username, String password) async {
    try {
      final response = await loginRemoteDataSource.login(username, password);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure());
    }
  }
}
