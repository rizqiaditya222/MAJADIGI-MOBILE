import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import 'package:majadigi/core/network/dio_client.dart';

import 'package:majadigi/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:majadigi/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:majadigi/features/auth/domain/usecases/login_usecase.dart';
import 'package:majadigi/features/auth/presentation/bloc/login_bloc.dart';
import 'package:majadigi/features/auth/domain/repositories/auth_repository.dart';

final s1 = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  s1.registerLazySingleton(() => prefs);

  // Networking - use DioClient to get preconfigured Dio
  s1.registerLazySingleton<Dio>(() => DioClient.createDio());

  // Data sources
  s1.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl(s1<Dio>()));

  // Repositories
  s1.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDatasource: s1<AuthRemoteDatasource>()));

  // Usecases
  s1.registerLazySingleton(() => LoginUsecase(s1<AuthRepository>()));

  // Blocs
  s1.registerFactory(() => LoginBloc(loginUsecase: s1<LoginUsecase>()));
}
