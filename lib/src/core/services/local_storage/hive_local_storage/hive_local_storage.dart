import 'package:hive_flutter/hive_flutter.dart';

import '../local_storage.dart';
import 'hive_boxes_names.dart';

class HiveLocalStorage implements LocalStorage {
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    // Hive.registerAdapter(UserAdapter());
    await openBoxes();
  }

  Future<void> openBoxes() async {
    await Hive.openBox(HiveBoxesNames.user.name);
  }

  @override
  Future<void> saveData<T>(StorageKey key, T value) async {
    await Hive.box(key.name).put(key.name, value);
  }

  @override
  T? getData<T>(HiveBoxesNames boxName, StorageKey key) {
    return Hive.box(boxName.name).get(key.name);
  }

  // @override
  // void saveUser(UserDataModel user) {
  //   saveData<UserDataModel>(StorageKey.user, user);
  // }

  // @override
  // UserDataModel? getUser() {
  //   return getData<UserDataModel>(HiveBoxesNames.user, StorageKey.user);
  // }

  @override
  void clearUser() {
    Hive.box(HiveBoxesNames.user.name).clear();
  }
}
