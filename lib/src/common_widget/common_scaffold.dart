import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final EdgeInsetsGeometry padding;
  const CommonScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.padding = const EdgeInsets.only(bottom: 16, left: 25, right: 25),
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: Padding(
          padding: padding,
          child: body,
        ),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
