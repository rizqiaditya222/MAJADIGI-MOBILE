import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:majadigi/core/network/dio_client.dart';
import 'package:majadigi/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:majadigi/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:majadigi/features/auth/domain/usecases/login_usecase.dart';
import 'package:majadigi/features/auth/presentation/bloc/login_bloc.dart';
import 'package:majadigi/features/auth/domain/repositories/auth_repository.dart';
import 'package:majadigi/features/commodity/data/datasources/commodity_remote_datasource.dart';
import 'package:majadigi/features/commodity/presentation/bloc/commodity_bloc.dart';
import 'package:majadigi/features/daha_husada/data/datasources/daha_husada_remote_datasource.dart';
import 'package:majadigi/features/daha_husada/presentation/bloc/kamar_bloc.dart';
import 'package:majadigi/features/daha_husada/presentation/bloc/operasi_bloc.dart';
import 'package:majadigi/features/daha_husada/presentation/bloc/antrian_bloc.dart';
import 'package:majadigi/features/bapenda/data/datasources/info_pajak_remote_datasource.dart';
import 'package:majadigi/features/bapenda/presentation/bloc/info_pajak_bloc.dart';
import 'package:majadigi/features/bapenda/data/datasources/njkb_remote_datasource.dart';
import 'package:majadigi/features/bapenda/presentation/bloc/njkb_bloc.dart';


final s1 = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  s1.registerLazySingleton(() => prefs);

  // Networking - use DioClient to get preconfigured Dio
  s1.registerLazySingleton<Dio>(() => DioClient.createDio());

  // Data sources
  s1.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl(s1<Dio>()));
  s1.registerLazySingleton<CommodityRemoteDatasource>(() => CommodityRemoteDatasourceImpl(dio: s1()),);
  s1.registerLazySingleton<DahaHusadaRemoteDatasource>(() => DahaHusadaRemoteDatasourceImpl(dio: s1()),);
  s1.registerLazySingleton<InfoPajakRemoteDatasource>(() => InfoPajakRemoteDatasourceImpl(dio: s1()));
  s1.registerLazySingleton<NjkbRemoteDatasource>(() => NjkbRemoteDatasourceImpl(dio: s1()));

  // Repositories
  s1.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDatasource: s1<AuthRemoteDatasource>()));

  // Usecases
  s1.registerLazySingleton(() => LoginUsecase(s1<AuthRepository>()));

  // Blocs
  s1.registerFactory(() => LoginBloc(loginUsecase: s1<LoginUsecase>()));
  s1.registerFactory(() => CommodityBloc(remoteDatasource: s1()),);
  s1.registerFactory(() => KamarBloc(remoteDatasource: s1()));
  s1.registerFactory(() => OperasiBloc(remoteDatasource: s1()));
  s1.registerFactory(() => AntrianBloc(remoteDatasource: s1()));
  s1.registerFactory(() => InfoPajakBloc(remoteDatasource: s1()));
  s1.registerFactory(() => NjkbBloc(remoteDatasource: s1()));
}
