import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/common_widget/language_switcher_widget.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/login/login.dart';
import 'package:pest_gpt/src/pages/registration/registration.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              right: 0,
              child: LanguageSwitcher(
                isButtonType: false,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  IMAGEPATH.welcomelanding_1,
                  width: 300,
                ),
                Text(
                  StringConstant.welcomeToPestShield.tr,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  StringConstant.introToPestShield.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonPrimaryButton(
                      width: 170,
                      onPressed: () {
                        Get.to(const Login());
                      },
                      title: StringConstant.signIn.tr,
                    ),
                    CommonPrimaryButton(
                      color: Colors.white,
                      textColor: neuDefault1,
                      width: 170,
                      onPressed: () {
                        Get.to(Registration());
                      },
                      title: StringConstant.register.tr,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
