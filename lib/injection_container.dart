import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sgu_portable/data/datasource/remote/login_remote_data_source.dart';
import 'package:sgu_portable/data/repositories/auth_repository_impl.dart';
import 'package:sgu_portable/domain/repositories/AuthRepository.dart';
import 'package:sgu_portable/domain/usecases/login_usecase.dart';

import 'presentation/bloc/login/login_bloc.dart';

final sl = GetIt.instance;
Future<void> initInjection() async {
  // bloc

  sl.registerFactory(() => LoginBloc(sl()));

  // usecase
  sl.registerLazySingleton(() => LoginUsecase(sl()));

  // repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // datasource
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(sl()));

  // external
  sl.registerLazySingleton(() => Dio());
}
