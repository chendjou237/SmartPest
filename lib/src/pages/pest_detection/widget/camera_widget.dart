import 'package:camera/camera.dart';
// import 'package:error_view/error_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pest_gpt/src/common_widget/common_loader.dart';
import 'package:pest_gpt/src/common_widget/common_primary_button.dart';
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/pages/pest_detection/controller/camera_controller.dart';
import 'package:pest_gpt/src/pages/pest_detection/widget/capture_or_pick.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';

class CameraWidget extends StatelessWidget {
  CameraWidget({super.key});
  final PestCameraController _cameraController =
      Get.find<PestCameraController>();

  Future<void> _initializeCamera() async {
    await _cameraController.init();
    return _cameraController.initializeControllerFuture;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeCamera(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ToastManager.showError(StringConstant.cameraInitError.tr);
            });

            //return ErrorView(
            //   title: StringConstant.cameraInitError.tr,
            //   imageWidget: Lottie.asset(IMAGEPATH.cameraError,
            //       width: 200, height: 200, fit: BoxFit.cover),
            //   actionWidget: CommonPrimaryButton(
            //     onPressed: () async {
            //       final ImagePicker picker = ImagePicker();
            //       final XFile? image =
            //           await picker.pickImage(source: ImageSource.gallery);
            //       if (image != null) {
            //         _cameraController.captureFile.value = image;
            //       }
            //     },
            //     title: StringConstant.pickFromGallery.tr,
            //   ),
            // );
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${snapshot.error}'),
                  CommonPrimaryButton(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        _cameraController.captureFile.value = image;
                      }
                    },
                    title: StringConstant.pickFromGallery.tr,
                  )
                ],
              ),
            );
          } else {
            return _cameraController.controller == null
                ? const CommonLoader()
                : Column(
                    children: [
                      Expanded(
                        child: CameraPreview(_cameraController.controller!),
                      ),
                      CaptureOrPick(
                        onCapturePressed: _cameraController.captureImage,
                        onPickFromImagePressed: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            _cameraController.captureFile.value = image;
                          }
                        },
                      ),
                    ],
                  );
          }
        }
      },
    );
  }
}
