import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Handle forgot password
        },
        child: Text(StringConstant.forgotPassword.tr),
      ),
    );
  }
}
