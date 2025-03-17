import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveString(CacheManagerKey key, String? token) async {
    final box = GetStorage();
    await box.write(key.toString(), token);
    return true;
  }

  String? getString(CacheManagerKey key) {
    final box = GetStorage();
    return box.read(key.toString());
  }

  Future<void> remove(CacheManagerKey key) async {
    final box = GetStorage();
    await box.remove(key.toString());
  }
}

enum CacheManagerKey { TOKEN, IS_FIRST_TIME }
