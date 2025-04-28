import 'hive_local_storage/hive_boxes_names.dart';

abstract class LocalStorage {
  Future<void> init();
  void saveData<T>(StorageKey key, T value);
  T? getData<T>(HiveBoxesNames boxName, StorageKey key);
  // void saveUser(UserDataModel user);
  // UserDataModel? getUser();
  void clearUser();
}

enum StorageKey { user }
