import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/common_widget/common_text_field.dart';
import 'package:pest_gpt/src/common_widget/powered_by.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/models/user/user_login_request.dart';
import 'package:pest_gpt/src/pages/home/home.dart';
import 'package:pest_gpt/src/pages/login/widget/alternative_options.dart';
import 'package:pest_gpt/src/pages/login/widget/forgot_password.dart';
import 'package:pest_gpt/src/pages/login/widget/header.dart';
import 'package:pest_gpt/src/resource/api_service/user_service.dart';
import 'package:pest_gpt/src/utils/authentication/authentication_controller.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonScaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LoginWidget(),
          PoweredBy(),
        ],
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool isLoading = false;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    if (userNameController.text.isEmpty) {
      ToastManager.showError(StringConstant.userNameCannotBeEmpty.tr);
      return;
    }
    if (passwordController.text.isEmpty) {
      ToastManager.showError(StringConstant.passwordCannotBeEmpty.tr);
      return;
    }
    // if (!CommonUtil.isValiduserName(userNameController.text)) {
    //   ToastManager.howError(StringConstant.invaliduserName.tr);
    //   return;
    // }
    try {
      setState(() {
        isLoading = true;
      });
      final response = await UserService().login(UserLoginRequest(
        username: userNameController.text,
        password: passwordController.text,
      ));
      ToastManager.showSuccess(StringConstant.loginSuccess.tr);
      Get.find<AuthenticationController>().login(response);
      Get.to(HomePage());
    } catch (e) {
      ToastManager.showError(e.toString());
      setState(() {
        isLoading = false;
      });
    }
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox(height: Get.height - 130, child: const CommonLoader())
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginHeader(),
              const SizedBox(height: 20),
              CommonTextField(
                hintText: StringConstant.userName.tr,
                prefixIcon: const Icon(Icons.person_4_sharp),
                textController: userNameController,
              ),
              const SizedBox(height: 20),
              CommonTextField(
                hintText: StringConstant.password.tr,
                prefixIcon: const Icon(Icons.vpn_key),
                textController: passwordController,
              ),
              const ForgotPassword(),
              const SizedBox(height: 10),
              CommonPrimaryButton(
                onPressed: login,
                title: (StringConstant.signIn.tr),
              ),
              const SizedBox(height: 20),
              const AlternativeOptions(),
            ],
          );
  }
}
