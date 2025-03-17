import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_text_field.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/registration/controller/registration_controller.dart';
import 'package:pest_gpt/src/pages/registration/widget/sign_in_button.dart';
import 'package:pest_gpt/src/pages/registration/widget/terms_and_condition.dart';

class SingUpForm extends GetView<RegistrationController> {
  const SingUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return CommonLoader(
          loadingText: StringConstant.registeringUser.tr,
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonTextField(
            hintText: StringConstant.fullName.tr,
            prefixIcon: const Icon(Icons.person_4_outlined),
            textController:
                controller.textEditingController[FormFieldType.fullName],
          ),
          const SizedBox(height: 16),
          CommonTextField(
            hintText: StringConstant.userName.tr,
            prefixIcon: const Icon(Icons.person),
            textController:
                controller.textEditingController[FormFieldType.userName],
          ),
          const SizedBox(height: 16),
          CommonTextField(
            prefixIcon: const Icon(Icons.email),
            hintText: StringConstant.email.tr,
            textController:
                controller.textEditingController[FormFieldType.email],
          ),
          const SizedBox(height: 16),
          CommonTextField(
            prefixIcon: const Icon(Icons.phone),
            hintText: StringConstant.mobileNumber.tr,
            textController:
                controller.textEditingController[FormFieldType.mobileNumber],
          ),
          const SizedBox(height: 16),
          CommonTextField(
            prefixIcon: const Icon(Icons.lock),
            hintText: StringConstant.password.tr,
            obscureText: true,
            textController:
                controller.textEditingController[FormFieldType.password],
          ),
          const SizedBox(height: 16),
          CommonTextField(
            prefixIcon: const Icon(Icons.lock),
            hintText: StringConstant.congfirmPassword.tr,
            obscureText: true,
            textController:
                controller.textEditingController[FormFieldType.confirmPassword],
          ),
          const SizedBox(height: 16),
          const TermsAndCondition(),
          const SizedBox(height: 24),
          CommonPrimaryButton(
            onPressed: () {
              controller.registerUser();
            },
            title: StringConstant.signUp.tr,
          ),
          const SizedBox(height: 16),
          const SignInButton(),
        ],
      );
    });
  }
}
