import 'package:flutter/material.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class PoweredBy extends StatelessWidget {
  const PoweredBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      IMAGEPATH.mutusLogo, // Replace with your image asset
      height: 35,
    );
  }
}
