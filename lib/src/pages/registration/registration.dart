import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/common_widget/powered_by.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/registration/controller/registration_controller.dart';
import 'package:pest_gpt/src/pages/registration/widget/sing_up_form.dart';

class Registration extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());
  Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(titleText: StringConstant.createAccount.tr),
      resizeToAvoidBottomInset: false,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Expanded(child: SingUpForm()), PoweredBy()],
        ),
      ),
    );
  }
}
