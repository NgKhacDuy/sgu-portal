import 'package:dartz/dartz.dart';
import 'package:sgu_portable/core/error/exceptions.dart';
import 'package:sgu_portable/core/error/failures.dart';
import 'package:sgu_portable/data/datasource/local/login_local_data_source.dart';
import 'package:sgu_portable/data/datasource/remote/login_remote_data_source.dart';
import 'package:sgu_portable/domain/entities/login_entity.dart';
import 'package:sgu_portable/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  final LoginLocalDataSource loginLocalDataSource;

  AuthRepositoryImpl(this.loginRemoteDataSource, this.loginLocalDataSource);

  @override
  Future<Either<Failure, LoginEntity>> login(
      String username, String password) async {
    try {
      final response = await loginRemoteDataSource.login(username, password);
      await loginLocalDataSource.saveToken(response.accessToken!);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
