import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocalStorageService {
  final GetStorage storage = GetStorage();
  Future<bool> initStorage() async => await GetStorage.init();

  Future<void> write(String key, dynamic value) => storage.write(key, value);

  T? read<T>(String key) => storage.read<T>(key);

  // add for listen
  Future<dynamic> listen(String key) async {
    storage.listenKey(key, (value) {
      if (kDebugMode) {
        print("Listening Value changed: $value");
      }
    });
    return storage.read(key);
  }

  Future<void> delete(String key) => storage.remove(key);

  Future<void> clear() => storage.erase();
}
