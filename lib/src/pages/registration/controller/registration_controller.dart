import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/models/user/user_register_request.dart';
import 'package:pest_gpt/src/pages/login/login.dart';
import 'package:pest_gpt/src/resource/api_service/user_service.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';

enum FormFieldType {
  userName,
  fullName,
  email,
  mobileNumber,
  password,
  confirmPassword,
}

class RegistrationController extends GetxController {
  final RxBool isLoading = false.obs;

  Map<FormFieldType, TextEditingController> textEditingController = {
    FormFieldType.userName: TextEditingController(),
    FormFieldType.fullName: TextEditingController(),
    FormFieldType.email: TextEditingController(),
    FormFieldType.mobileNumber: TextEditingController(),
    FormFieldType.password: TextEditingController(),
    FormFieldType.confirmPassword: TextEditingController(),
  };

  void registerUser() {
    final userRegisterRequest = UserRegisterRequest(
      userName: textEditingController[FormFieldType.userName]!.text,
      fullName: textEditingController[FormFieldType.fullName]!.text,
      email: textEditingController[FormFieldType.email]!.text,
      mobileNumber: textEditingController[FormFieldType.mobileNumber]!.text,
      password: textEditingController[FormFieldType.password]!.text,
      confirmPassword:
          textEditingController[FormFieldType.confirmPassword]!.text,
    );
    isLoading.value = true;
    UserService().register(userRegisterRequest).then((value) {
      isLoading.value = false;
      Get.to(() => const Login());
    }).catchError((error) {
      print('error while logout' + error.toString());
      isLoading.value = false;
      ToastManager.showError(error.toString());
    });
  }
}
