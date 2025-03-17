import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/home/controller/home_controller.dart';
import 'package:pest_gpt/src/pages/home/widget/pest_task_list.dart';
import 'package:pest_gpt/src/pages/home/widget/user_info_bottomsheet.dart';
import 'package:pest_gpt/src/pages/pest_detection/pest_detection_page.dart';
import 'package:pest_gpt/src/pages/transcation_history.dart/transcation_history.dart';
import 'package:pest_gpt/src/resource/image_path.dart';
import 'package:pest_gpt/src/resource/wallet_connect/wallet_connect_controller.dart';
import 'package:pest_gpt/src/utils/bottom_sheet_util.dart';

class HomePage extends GetView<WalletConnectController> {
  HomePage({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: homeController.fetchUserInfo(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return CommonScaffold(
              body: CommonLoader(
                loadingText: StringConstant.loadingUserDetails.tr,
              ),
            );
          }
          return CommonScaffold(
            appBar: CommonAppBar(
              alignment: Alignment.centerLeft,
              textAlign: TextAlign.start,
              leading: GestureDetector(
                onTap: () {
                  showAppBottomSheet(UserProfileBottomSheet(
                    userInfo: homeController.userInfo.value!,
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Card(
                    shape: const CircleBorder(),
                    elevation: 4.0,
                    child: CircleAvatar(
                      radius: 20,
                      child: ClipOval(
                        child: Image.network(
                          homeController.userInfo.value?.avatar ?? '',
                          fit: BoxFit.cover,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              showBackButton: false,
              titleText:
                  '${StringConstant.welcome.tr}\n${homeController.userInfo.value?.fullName ?? ''}',
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: CommonPrimaryButton(
                    color: Colors.white,
                    height: 50,
                    width: 50,
                    titleWidget: Image.asset(
                      IMAGEPATH.transactionHistory,
                      fit: BoxFit.cover,
                    ),
                    onPressed: () {
                      Get.to(() => const TranscationHistory());
                    },
                  ),
                )
              ],
            ),
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Obx(() {
                      if (homeController.isLoading.value) {
                        return const CommonLoader();
                      }
                      return const PestTaskList();
                    }),
                  ),
                  CommonPrimaryButton(
                    height: 50,
                    width: double.infinity,
                    titleWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pest_control_outlined,
                            color: Theme.of(context).colorScheme.surface),
                        const SizedBox(width: 10),
                        Text(
                          StringConstant.detectPest.tr,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () => Get.to(const PestDetection()),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
