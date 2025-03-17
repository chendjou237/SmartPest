import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:pest_gpt/src/common_widget/common_outlined_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/login/widget/sign_up_button.dart';

class AlternativeOptions extends StatelessWidget {
  const AlternativeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(thickness: 1)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(StringConstant.orUse.tr),
            ),
            const Expanded(child: Divider(thickness: 1)),
          ],
        ),
        const SizedBox(height: 10),
        CommonOutlinedPrimaryButton(
          onPressed: () {},
          prefixIcon: const Icon(Icons.fingerprint),
          child: Text(StringConstant.signInWithFingerprint.tr),
        ),
        const SignUpButton()
      ],
    );
  }
}
