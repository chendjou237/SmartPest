import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/common_widget/common_scaffold.dart';
import 'package:pest_gpt/src/pages/pest_detection/controller/camera_controller.dart';
import 'package:pest_gpt/src/pages/pest_detection/widget/camera_widget.dart';
import 'package:pest_gpt/src/pages/pest_detection/widget/detect_pest.dart';

class PestDetection extends StatefulWidget {
  const PestDetection({super.key});

  @override
  State<PestDetection> createState() => _PestDetectionState();
}

class _PestDetectionState extends State<PestDetection> {
  final PestCameraController _cameraController =
      Get.put(PestCameraController());

  @override
  void dispose() {
    // _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      padding: EdgeInsets.zero,
      body: Obx(
        () => _cameraController.captureFile.value != null
            ? DetectPest(path: _cameraController.captureFile.value!.path)
            : CameraWidget(),
      ),
    );
  }
}
