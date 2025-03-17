import 'package:flutter/material.dart';
import 'package:pest_gpt/src/resource/constants.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    required this.hintText,
    this.textController,
    this.prefixIcon,
    this.obscureText = false,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? textController;
  final Widget? prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        border: const OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
