import 'package:flutter/material.dart';
import 'package:pest_gpt/src/resource/constants.dart';

class CommonOutlinedPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Widget prefixIcon; // Changed type to Widget

  const CommonOutlinedPrimaryButton({
    required this.onPressed,
    required this.child,
    this.prefixIcon = const SizedBox(), // Added default value
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric( vertical: 15.0),
          shape: const RoundedRectangleBorder(
            borderRadius: Constants.borderRadius,
          ),
        ),
        icon: prefixIcon,
        label: child,
      ),
    );
  }
}
