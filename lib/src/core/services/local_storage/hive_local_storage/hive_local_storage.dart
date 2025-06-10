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
    await Hive.openBox(HiveBoxesNames.token.name);
  }

  @override
  Future<void> saveData<T>(StorageKey key, T value) async {
    await Hive.box(key.name).put(key.name, value);
  }

  @override
  T? getData<T>(HiveBoxesNames boxName, StorageKey key) {
    return Hive.box(boxName.name).get(key.name);
  }

  @override
  void saveToken(String token) {
    saveData<String>(StorageKey.token, token);
  }

  @override
  String? getToken() {
    return getData<String>(HiveBoxesNames.token, StorageKey.token);
  }

  @override
  void clearToken() {
    Hive.box(HiveBoxesNames.token.name).clear();
  }
}
