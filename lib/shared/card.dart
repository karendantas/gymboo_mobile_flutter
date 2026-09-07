// shared/retro_card.dart
import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class RetroCard extends StatelessWidget {
  const RetroCard({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
    this.borderRadius = 6,
    this.borderWidth = 2,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget child;
  final Color? color;
  final Color? borderColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;

    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFFED3D6),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor ?? palette.backgroundDark, width: borderWidth),
      ),
      child: child,
    );
  }
}