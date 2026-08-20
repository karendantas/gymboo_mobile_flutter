import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class PetXpBar extends StatelessWidget {
  const PetXpBar({
    super.key,
    required this.value, // 0.0 a 1.0
    required this.fillColor,
    this.trackColor,
    this.height = 16,
  });

  final double value;
  final Color fillColor;
  final Color? trackColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: trackColor ?? palette.surfaceSecondary,
        borderRadius: BorderRadius.circular(2), 
        border: Border.all(color: palette.divider, width: 2),
      ),
      padding: const EdgeInsets.all(2),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: value.clamp(0.0, 1.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}