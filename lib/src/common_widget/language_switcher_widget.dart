import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';

class LanguageSwitcher extends StatelessWidget {
  final bool isButtonType;

  const LanguageSwitcher({
    super.key,
    this.isButtonType = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LanguageButton(
          languageCode: 'en',
          countryCode: 'US',
          languageName: isButtonType ? 'English' : 'ENG',
          isButtonType: isButtonType,
        ),
        if (isButtonType) const SizedBox(width: 20),
        LanguageButton(
          languageCode: 'zh',
          countryCode: 'CN',
          languageName: '中文',
          isButtonType: isButtonType,
        ),
      ],
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String languageCode;
  final String countryCode;
  final String languageName;
  final bool isButtonType;

  const LanguageButton({
    super.key,
    required this.languageCode,
    required this.countryCode,
    required this.languageName,
    required this.isButtonType,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = Get.locale?.languageCode == languageCode &&
        Get.locale?.countryCode == countryCode;
    var color = isSelected ? Colors.teal : Colors.grey;
    return !isButtonType
        ? TextButton(
            style: isSelected
                ? TextButton.styleFrom(
                    side: BorderSide(
                      color: color,
                      width: 2,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.zero, // Makes the button square
                    ),
                  )
                : null,
            onPressed: () {
              var locale = Locale(languageCode, countryCode);
              Get.updateLocale(locale);
            },
            child: Text(
              languageName,
              style: TextStyle(
                color: color,
                fontSize: 16,
              ),
            ),
          )
        : CommonPrimaryButton(
            width: 150,
            color: isSelected ? Colors.blue : Colors.grey,
            onPressed: () {
              var locale = Locale(languageCode, countryCode);
              Get.updateLocale(locale);
            },
            title: languageName,
          );
  }
}
