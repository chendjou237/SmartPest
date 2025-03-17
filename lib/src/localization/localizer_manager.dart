import 'package:get/get.dart';
import 'package:pest_gpt/src/localization/lang/en_US.dart';
import 'package:pest_gpt/src/localization/lang/zh_CN.dart';

class LocalizationManager extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_CN': zh_CN,
      };
}
