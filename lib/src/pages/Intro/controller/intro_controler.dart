import 'package:get/get.dart';
import 'package:pest_gpt/src/utils/cache_manager/cache_manager.dart';

class IntroController extends GetxController with CacheManager {
  final isFirstTime = true.obs;

  Future<void> markIntroAsSeen() async {
    await saveString(CacheManagerKey.IS_FIRST_TIME, 'false');
    isFirstTime.value = false;
  }

  void checkIfIntroIsSeen() {
    final isFirstTimeString = getString(CacheManagerKey.IS_FIRST_TIME);
    if (isFirstTimeString != null) {
      isFirstTime.value = false;
    }
  }

}
