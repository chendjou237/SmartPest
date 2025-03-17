import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/utils/cache_manager/cache_manager.dart';

class ThemeController extends GetxController with CacheManager {
  final RxBool isDark = false.obs;

  void changeTheme() {
    Get.changeThemeMode(isDark.value ? ThemeMode.light : ThemeMode.dark);
    isDark.value = !isDark.value;
  }
}
