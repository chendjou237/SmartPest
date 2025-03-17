import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/registration/registration.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${StringConstant.createAccount.tr} : ',
          style: const TextStyle(fontSize: 16),
        ),
        TextButton(
          onPressed: () {
            Get.to(Registration());
          },
          child: Text(
            StringConstant.register.tr,
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
