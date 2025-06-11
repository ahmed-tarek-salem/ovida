import 'package:get_it/get_it.dart';
import 'package:ovida/src/core/services/local_storage/hive_local_storage/hive_local_storage.dart';
import 'package:ovida/src/core/services/local_storage/local_storage.dart';
import 'package:ovida/src/features/auth/data/datasources/auth_remote_datasource/auth_remote_datasource.dart';
import 'package:ovida/src/features/auth/data/repositories/auth_repository.dart';
import 'package:ovida/src/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:ovida/src/features/home/data/datasources/home_remote_datasource.dart';
import 'package:ovida/src/features/home/data/repositories/home_repository.dart';
import 'package:ovida/src/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:ovida/src/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:ovida/src/features/profile/data/repositories/profile_repository.dart';
import 'package:ovida/src/features/profile/presentation/viewmodel/profile_viewmodel.dart';
import 'package:ovida/src/features/user_info/data/datasources/user_info_remote_datasource.dart';
import 'package:ovida/src/features/user_info/data/repositories/user_info_repo.dart';
import 'package:ovida/src/features/user_info/presentation/viewmodel/user_info_viewmodel.dart';

import '../network/network_service.dart';

final di = GetIt.instance;

class DiService {
  static init() async {
    di.registerLazySingleton(() => NetworkService());
    di.registerLazySingleton<LocalStorage>(() => HiveLocalStorage());

    /// Register the Register the abstract interface LoginRemoteDataSource with the implementation
    /// between <> you can pass the type of the implementation (the abstract class)
    di.registerLazySingleton<AuthRemoteDatasource>(
        () => AuthRemoteDatasourceImpl(networkService: di()));

    di.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(datasource: di<AuthRemoteDatasource>()));

    di.registerLazySingleton(() => AuthViewmodel(
          repo: di<AuthRepository>(),
        ));

    di.registerLazySingleton<UserInfoRemoteDatasource>(
        () => UserInfoRemoteDatasourceImpl(networkService: di()));

    di.registerLazySingleton<UserInfoRepository>(() =>
        UserInfoRepositoryImpl(datasource: di<UserInfoRemoteDatasource>()));

    di.registerLazySingleton(
        () => UserInfoViewmodel(repo: di<UserInfoRepository>()));

    di.registerLazySingleton<HomeRemoteDatasource>(
        () => HomeRemoteDatasourceImpl(networkService: di()));
    di.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(datasource: di<HomeRemoteDatasource>()));
    di.registerLazySingleton(() => HomeViewmodel(repo: di<HomeRepository>()));

    di.registerLazySingleton<ProfileRemoteDatasource>(
        () => ProfileRemoteDatasourceImpl(networkService: di()));
    di.registerLazySingleton<ProfileRepository>(() =>
        ProfileRepositoryImpl(remoteDatasource: di<ProfileRemoteDatasource>()));
    di.registerLazySingleton(() => ProfileViewmodel(
          repository: di<ProfileRepository>(),
        ));
  }
}
