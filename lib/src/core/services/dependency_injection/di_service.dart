import 'package:get_it/get_it.dart';

import '../local_storage/hive_local_storage/hive_local_storage.dart';
import '../local_storage/local_storage.dart';
import '../network/network_service.dart';

final di = GetIt.instance;

class DiService {
  static init() async {
    di.registerLazySingleton(() => NetworkService());
    //di.registerLazySingleton<LocalStorage>(() => HiveLocalStorage());

    /// Register the Register the abstract interface LoginRemoteDataSource with the implementation
    /// between <> you can pass the type of the implementation (the abstract class)
    // di.registerLazySingleton<LoginRemoteDataSource>(
    //     () => LoginRemoteDataSourceImpl(networkService: di()));
    // di.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(
    //     dataSource: di<LoginRemoteDataSource>(), localStorage: di()));

    // di.registerLazySingleton<AppRouter>(() => AppRouter(loginRepo: di()));
  }
}
