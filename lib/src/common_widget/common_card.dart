import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class CommonCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  const CommonCard({super.key, required this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return NeuCard(
      cardWidth: width,
      cardHeight: height,
      child: child,
      cardColor: Theme.of(context).colorScheme.surface,
    );
  }
}
