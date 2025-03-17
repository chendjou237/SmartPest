import 'dart:typed_data';

import 'package:image/image.dart';

class PestModel {
  String pestName;
  Uint8List image;
  Color color;

  PestModel({
    required this.pestName,
    required this.image,
    required this.color,
  });
}
