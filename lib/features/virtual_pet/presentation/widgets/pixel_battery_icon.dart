import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class PixelBatteryIcon extends StatelessWidget {
  const PixelBatteryIcon({
    super.key,
    required this.level,
    this.width = 32,
    this.height = 18,
  });

  final int level;
  final double width;
  final double height;

  String _spriteFor(int level) {
    final effective = level < 0 ? 100 : level;
    if (effective > 80) return 'assets/images/battery_full.png';
    if (effective > 50) return 'assets/images/battery_medium.png';
    if (effective > 25) return 'assets/images/battery_low.png';
    return 'assets/images/battery_critical.png';
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final image = Image.asset(
      _spriteFor(level),
      width: width,
      height: height,
      filterQuality: FilterQuality.none,
    );

    return ColorFiltered(
      colorFilter: ColorFilter.mode(palette.surfaceAlt, BlendMode.srcIn),
      child: image,
    );
  }
}
