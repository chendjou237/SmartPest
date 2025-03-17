import 'package:get/get.dart';
import 'package:pest_gpt/src/models/user/user_login_response.dart';
import 'package:pest_gpt/src/utils/cache_manager/cache_manager.dart';

class AuthenticationController extends GetxController with CacheManager {
  final isLogged = false.obs;

  Future<void> logOut() async {
    isLogged.value = false;
    await remove(CacheManagerKey.TOKEN);
  }

  void login(UserLoginResponse response) async {
    isLogged.value = true;
    await saveString(CacheManagerKey.TOKEN, response.accessToken ?? '');
  }

  void checkLoginStatus() {
    final token = getString(CacheManagerKey.TOKEN);
    if (token != null) {
      isLogged.value = true;
    }
  }

  String? getAccessToken() {
    return getString(CacheManagerKey.TOKEN);
  }
}
