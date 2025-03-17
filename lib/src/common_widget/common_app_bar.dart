import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;
  final bool showBackButton;
  final List<Widget>? actions;
  final Widget? leading;
  final Alignment alignment;
  final TextAlign textAlign;

  const CommonAppBar({
    super.key,
    this.titleText,
    this.onBackPressed,
    this.backgroundColor,
    this.showBackButton = true,
    this.actions,
    this.leading,
    this.alignment = Alignment.center,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
              onPressed: () {
                if (onBackPressed != null) {
                  onBackPressed!();
                  return;
                }
                Navigator.pop(context);
              },
            )
          : leading,
      title: titleText != null
          ? Container(
              width: double.infinity,
              alignment: alignment,
              child: Text(
                titleText!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: textAlign,
              ),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
