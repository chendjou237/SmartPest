import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/login/login.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${StringConstant.alreadyHaveAnAccount.tr} : ',
          style: const TextStyle(fontSize: 16),
        ),
        TextButton(
          onPressed: () {
            Get.to(const Login());
          },
          child: Text(
            StringConstant.signIn.tr,
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
