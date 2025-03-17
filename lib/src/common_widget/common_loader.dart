import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pest_gpt/src/resource/image_path.dart';

class CommonLoader extends StatelessWidget {
  final Widget? buttonWidget;
  final String loadingText;
  const CommonLoader({
    super.key,
    this.buttonWidget,
    this.loadingText = 'Loading...',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  IMAGEPATH.pestLoadingAnimation,
                  width: 200,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    loadingText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          if (buttonWidget != null)
            Align(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: buttonWidget!,
              ),
            ),
        ],
      ),
    );
  }
}
