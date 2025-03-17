import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:pest_gpt/src/utils/toast/toast_manager.dart';

class PestCameraController extends GetxController {
  late List<CameraDescription> cameras;
  CameraController? controller;
  Future<void>? initializeControllerFuture;
  Rx<XFile?> captureFile = Rx<XFile?>(null);

  final loading = false.obs;
  final path = ''.obs;

  init() async {
    cameras = await availableCameras();
    if (cameras.isEmpty) {
      throw Exception('No camera found');
    } else {
      final firstCamera = cameras.first;
      controller = CameraController(
        firstCamera,
        ResolutionPreset.high,
      );
      initializeControllerFuture = controller?.initialize();
    }
  }

  void setLoading(bool value) {
    loading.value = value;
  }

  void setPath(String value) {
    path.value = value;
  }

  Future<void> captureImage() async {
    try {
      await initializeControllerFuture;
      XFile? takenFile = await controller?.takePicture();
      captureFile.value = takenFile;
    } catch (e) {
      ToastManager.showError('Error capturing image');
    }
  }
}
