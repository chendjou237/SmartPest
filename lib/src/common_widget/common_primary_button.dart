import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class CommonPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? titleWidget;
  final String? title;
  final bool isLoading;
  final double? width;
  final Color? color;
  final double? height;
  final EdgeInsets padding;
  final Color? textColor;

  const CommonPrimaryButton({
    required this.onPressed,
    this.titleWidget,
    this.title,
    this.isLoading = false,
    this.width,
    this.height,
    this.color,
    Key? key,
    this.padding = const EdgeInsets.all(0),
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: titleWidget != null
          ? GestureDetector(
              onTap: onPressed,
              child: NeuCard(
                cardColor: color ?? neuDefault1,
                cardWidth: width ?? double.infinity,
                cardHeight: height,
                child: titleWidget!,
              ),
            )
          : Container(
              width: width ?? double.infinity,
              height: height,
              padding: const EdgeInsets.all(10),
              child: NeuTextButton(
                buttonColor: color ?? neuDefault1,
                enableAnimation: true,
                onPressed: isLoading ? null : onPressed,
                text: Text(
                  title ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor ?? Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ),
    );
  }
}
