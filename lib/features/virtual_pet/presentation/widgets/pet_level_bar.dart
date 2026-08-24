import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'pet_xp_bar.dart';

class PetLevelBar extends StatelessWidget {
  const PetLevelBar({
    super.key,
    required this.level,
    required this.currentXp,
    required this.xpToNextLevel,
  });

  final int level;
  final int currentXp;
  final int xpToNextLevel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final palette = Theme.of(context).extension<GymbooPalette>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Nível $level', style: textTheme.labelMedium?.copyWith(color: palette.surfaceAlt)),
        const SizedBox(width: 8),
        Expanded(
          child: PetXpBar(
            value: currentXp / xpToNextLevel, 
            fillColor: palette.surfaceAlt,
          ),
        ),
        const SizedBox(width: 8),
        Text('xp ', style: textTheme.labelMedium?.copyWith(color: palette.surfaceAlt)),
        const SizedBox(width: 2),
        Text('$currentXp/$xpToNextLevel', style: textTheme.labelSmall?.copyWith(color: palette.surfaceAlt)),
      ],
    );
  }
}