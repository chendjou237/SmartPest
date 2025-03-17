import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:pest_gpt/src/common_widget/common_icon_button.dart';

class CaptureOrPick extends StatelessWidget {
  final VoidCallback onCapturePressed;
  final VoidCallback onPickFromImagePressed;
  const CaptureOrPick({
    super.key,
    required this.onCapturePressed,
    required this.onPickFromImagePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconButton(
                  context,
                  () {
                    Get.back();
                  },
                  Icons.home,
                ),
                NeuIconButton(
                  buttonColor: Theme.of(context).cardColor,
                  buttonHeight: 66,
                  borderRadius: BorderRadius.circular(33),
                  buttonWidth: 66,
                  enableAnimation: true,
                  icon: Icon(
                    Icons.radio_button_checked,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  onPressed: onCapturePressed,
                ),
                _buildIconButton(
                  context,
                  () {
                    onPickFromImagePressed();
                  },
                  Icons.image,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(
    context,
    Null Function() onPressed,
    IconData iconData,
  ) {
    return CommonIconButton(
      icon: iconData,
      onPressed: onPressed,
      height: 50,
      width: 50,
    );
  }
}
