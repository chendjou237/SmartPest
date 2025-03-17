import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:pest_gpt/src/localization/string_constant.dart';
import 'package:pest_gpt/src/models/pest/pest_detection_request.dart';
import 'package:pest_gpt/src/models/pest/pest_detection_response.dart';
import 'package:pest_gpt/src/models/pest/pest_model.dart';
import 'package:pest_gpt/src/resource/api_service/pest_detect_service.dart';
import 'package:pest_gpt/src/utils/image_util.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';

class DetectPestController extends GetxController {
  final isLoading = false.obs;
  final Rx<PestDetectionResponse?> response = Rx<PestDetectionResponse?>(null);
  final Rx<Uint8List?> processedImage = Rx<Uint8List?>(null);
  List<PestModel> pestList = [];

  void setLoading(bool value) {
    isLoading.value = value;
  }

  void setResponse(PestDetectionResponse value) {
    response.value = value;
  }

  void clearResponse() {
    response.value = null;
  }

  Future<void> detectPest(String imagePath) async {
    setLoading(true);
    PestDetectionRequest request = PestDetectionRequest(
        detectionList: ["user_images/Ninzore/20231212203813.jpg"]);

    try {
      var response = await PestDetectService().detect(request);
      ToastManager.showSuccess(StringConstant.pestDetected.tr,
          duration: const Duration(seconds: 1));
      await proccessResponse(response, imagePath);
      setResponse(response);
      // Get.to(PestDetectDetails());
    } catch (e) {
      ToastManager.showError(
          StringConstant.failedToDetectPest.tr + e.toString());
    }
    setLoading(false);
  }

  Future<void> proccessResponse(
      PestDetectionResponse response, String imagePath) async {
    final img.Image image = img.decodeImage(File(imagePath).readAsBytesSync())!;
    pestList.clear();
    ImageUtil.drawBoundingBoxesAndCropPestImage(image, response, pestList);
    final Uint8List processedBytes = Uint8List.fromList(img.encodeJpg(image));
    processedImage.value = processedBytes;
  }

  List<String> getPestNames() {
    var names = <String>[];
    response.value?.getPestDetectionList().forEach((element) {
      names.add(element.className);
    });
    return names;
  }
}
