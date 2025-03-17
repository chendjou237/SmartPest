import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/localization/localizer_manager.dart';
import 'package:pest_gpt/src/pages/splash/splash.dart';
import 'package:toastification/toastification.dart';

import './resource/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        home: Splash(),
        translations: LocalizationManager(),
        fallbackLocale: const Locale('en', 'US'),
        locale: Get.deviceLocale,
        // darkTheme: darkTheme(),
        theme: lightTheme(),
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('zh', 'CN'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        themeMode: ThemeMode.light,
        routingCallback: (routing) {
          if (kDebugMode) {
            print("pushing ${routing?.current} router");
          }
        },
      ),
    );
  }
}
