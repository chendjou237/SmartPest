import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class DetectingAnimation extends StatelessWidget {
  const DetectingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.green.withOpacity(0.1),
      child: Lottie.asset(IMAGEPATH.scanningAnimation),
    );
  }
}
