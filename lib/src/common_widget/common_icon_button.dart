import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class CommonIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final IconData icon;
  final double? iconSize;
  const CommonIconButton({
    super.key,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    required this.icon,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return NeuIconButton(
      buttonHeight: width ?? 50,
      buttonWidth: height ?? 50,
      enableAnimation: true,
      buttonColor: color ?? neuDefault1,
      icon: Icon(
        icon,
        color: Theme.of(context).colorScheme.surface,
        size: iconSize ?? 30,
      ),
      onPressed: onPressed,
    );
  }
}
