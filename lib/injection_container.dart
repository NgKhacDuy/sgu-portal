import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sgu_portable/core/network/network_compute.dart';
import 'package:sgu_portable/core/service/context_service.dart';
import 'package:sgu_portable/data/datasource/local/login_local_data_source.dart';
import 'package:sgu_portable/data/datasource/remote/login_remote_data_source.dart';
import 'package:sgu_portable/data/datasource/remote/time_table_remote_data_source.dart';
import 'package:sgu_portable/data/repositories/auth_repository_impl.dart';
import 'package:sgu_portable/data/repositories/time_table_repository_impl.dart';
import 'package:sgu_portable/domain/repositories/auth_repository.dart';
import 'package:sgu_portable/domain/repositories/time_table_repository.dart';
import 'package:sgu_portable/domain/usecases/login_usecase.dart';
import 'package:sgu_portable/domain/usecases/time_table/get_semester_usecase.dart';
import 'package:sgu_portable/presentation/bloc/global/main_bloc.dart';
import 'package:sgu_portable/presentation/bloc/home/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/bloc/login/login_bloc.dart';

final sl = GetIt.instance;
Future<void> initInjection() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  // bloc

  sl.registerFactory(() => MainBloc(sl()));
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => HomeBloc());

  // usecase
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => GetListSemesterUsecase(repository: sl()));

  // repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<TimeTableRepository>(
      () => TimeTableRepositoryImpl(timeTableDataSource: sl()));

  // datasource
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<TimeTableRemoteDataSource>(
      () => TimeTableRemoteDataSourceImpl());

  // external
  sl.registerLazySingleton(() => Dio(
        BaseOptions(
          baseUrl: "https://thongtindaotao.sgu.edu.vn/api",
        ),
      )..interceptors.add(PrettyDioLogger()));

  sl.registerLazySingleton(() => Logger());
  sl.registerLazySingleton(() => ContextService());
  sl.registerLazySingleton(() => NetworkCompute(sl()));
  sl.registerLazySingleton(() => sharedPreferences);
}
