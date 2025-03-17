import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/language_switcher_widget.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/models/user/user_info_response.dart';
import 'package:pest_gpt/src/pages/login/login.dart';
import 'package:pest_gpt/src/utils/authentication/authentication_controller.dart'; // Assuming you're using GetX for navigation or state management

class UserProfileBottomSheet extends StatelessWidget {
  final UserInfoResponse userInfo;

  const UserProfileBottomSheet({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 40.0,
          backgroundImage: NetworkImage(userInfo.avatar ?? ''),
          backgroundColor: Colors.grey.shade200,
        ),
        const SizedBox(height: 16.0),

        Text(
          userInfo.fullName ?? 'No Name',
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),

        Text(
          userInfo.email ?? 'No Email',
          style: const TextStyle(fontSize: 16.0, color: Colors.grey),
        ),

        const SizedBox(height: 8.0),
        const LanguageSwitcher(),

        const SizedBox(height: 24.0),

        // Logout Button
        CommonPrimaryButton(
          onPressed: () {
            Get.find<AuthenticationController>().logOut();
            Get.back(); // Close the bottom sheet
            Get.offAll(() => const Login());
          },
          title: StringConstant.logout.tr,
        ),
      ],
    );
  }
}
