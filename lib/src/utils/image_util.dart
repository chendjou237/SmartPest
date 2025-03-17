import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:pest_gpt/src/models/pest/pest_detection_response.dart';
import 'package:pest_gpt/src/models/pest/pest_model.dart';

class ImageUtil {
  static List pestColors = [
    img.ColorRgb8(255, 0, 0),
    img.ColorRgb8(0, 255, 0),
    img.ColorRgb8(0, 0, 255),
    img.ColorRgb8(255, 0, 255),
    img.ColorRgb8(192, 192, 192),
    img.ColorRgb8(128, 128, 128),
    img.ColorRgb8(128, 0, 0),
    img.ColorRgb8(0, 255, 255),
    img.ColorRgb8(255, 255, 0),
  ];

  static img.Color getColor(int index) {
    return pestColors[index % pestColors.length];
  }

  static void drawBoundingBoxesAndCropPestImage(img.Image image,
      PestDetectionResponse response, List<PestModel> pestList) {
    var detectionList = response.getPestDetectionList();
    for (int i = 0; i < detectionList.length; i++) {
      var item = detectionList[i];
      List<double> box = item.box;
      List<int> originalShape = item.originalShape;

      // Scale factors
      double xScale = image.width / originalShape[1];
      double yScale = image.height / originalShape[0];

      // Scale coordinates
      int x1 = (box[0] * xScale).toInt();
      int y1 = (box[1] * yScale).toInt();
      int x2 = (box[2] * xScale).toInt();
      int y2 = (box[3] * yScale).toInt();
      var color = getColor(i);
      var croppedImage =
          img.copyCrop(image, x: x1, y: y1, width: x2 - x1, height: y2 - y1);
      var pestImage = Uint8List.fromList(
        img.encodeJpg(croppedImage),
      );
      pestList.add(
        PestModel(
          pestName: item.className,
          image: pestImage,
          color: color,
        ),
      );

      img.drawString(image, item.className,
          font: img.arial14, x: (x1), y: y1, color: img.ColorRgb8(0, 0, 0));

      img.drawRect(image,
          x1: x1,
          y1: y1,
          x2: x2,
          y2: y2,
          color: color,
          thickness: 10,
          radius: 4); // Red color box
    }
  }
}
