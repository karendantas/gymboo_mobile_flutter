import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class RetroCard extends StatelessWidget {
  const RetroCard({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
    this.borderWidth = 2,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.all(16),
    this.shadow = true,
  });

  final Widget child;
  final Color? color;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final bool shadow;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;

    final resolvedBorderColor = borderColor ?? palette.divider;

    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? palette.surface,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: resolvedBorderColor, width: borderWidth),
        boxShadow: shadow
            ? [
                BoxShadow(
                  color: resolvedBorderColor,
                  offset: const Offset(0, 4),
                  blurRadius: 0,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
