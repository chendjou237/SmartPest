import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_app_bar.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/pest_detect_details/pest_detect_details.dart';
import 'package:pest_gpt/src/pages/pest_detection/controller/camera_controller.dart';
import 'package:pest_gpt/src/pages/pest_detection/controller/detect_pest_controller.dart';
import 'package:pest_gpt/src/pages/pest_detection/widget/detecting_animation.dart';

class DetectPest extends StatelessWidget {
  final String path;
  final DetectPestController controller = Get.put(DetectPestController());

  DetectPest({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isPestDetected = controller.processedImage.value != null;
      return Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Opacity(
                    opacity: controller.isLoading.value ? 0.5 : 1,
                    child: isPestDetected
                        ? Hero(
                            tag: controller.processedImage.value!.toString(),
                            child: Image.memory(
                              controller.processedImage.value!,
                              width: double.infinity,
                            ),
                          )
                        : Image.file(
                            File(path),
                            width: double.infinity,
                          ),
                  ),
                ),
                controller.isLoading.value
                    ? const Center(
                        child: DetectingAnimation(),
                      )
                    : Container(),
                CommonAppBar(
                  onBackPressed: () {
                    Get.find<PestCameraController>().captureFile.value = null;
                    controller.processedImage.value = null;
                  },
                  backgroundColor: Colors.transparent,
                  titleText: StringConstant.detectPest.tr,
                  actions: const [
                    SizedBox(
                      width: 30,
                    )
                  ],
                )
              ],
            ),
          ),
          CommonPrimaryButton(
            color: isPestDetected ? Colors.green : null,
            onPressed: () => {
              if (isPestDetected)
                {Get.to(PestDetectDetails())}
              else
                {controller.detectPest(path)}
            },
            title: isPestDetected
                ? StringConstant.showPestDetails.tr
                : StringConstant.detectPest.tr,
            isLoading: controller.isLoading.value,
          )
        ],
      );
    });
  }
}
