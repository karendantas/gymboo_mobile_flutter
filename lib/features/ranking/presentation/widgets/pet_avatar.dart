import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

class PetAvatar extends StatelessWidget {
  const PetAvatar({super.key, required this.type, required this.size});
  final String type;
  final double size;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;

    return Image.asset(
      'assets/images/pet_${type}_default.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.none,
      errorBuilder: (_, _, _) => SizedBox(
        width: size,
        height: size,
        child: Icon(
          Icons.pets,
          size: size * 0.6,
          color: palette.primaryPinkDark,
        ),
      ),
    );
  }
}
