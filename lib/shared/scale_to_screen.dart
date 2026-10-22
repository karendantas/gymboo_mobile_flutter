import 'package:flutter/material.dart';

class ScaleToScreen extends StatelessWidget {
  const ScaleToScreen({
    super.key,
    required this.child,
    this.designWidth = 352,
    this.maxHeightFraction = 0.55,
  });

  final Widget child;

  final double designWidth;

  final double maxHeightFraction;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: screenHeight * maxHeightFraction),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: SizedBox(width: designWidth, child: child),
      ),
    );
  }
}
