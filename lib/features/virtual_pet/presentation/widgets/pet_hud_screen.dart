import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'pet_hud_top_bar.dart';
import 'pet_hearts_row.dart';
import 'pet_level_bar.dart';

class PetHudScreen extends StatelessWidget {
  const PetHudScreen({
    super.key,
    required this.petName,
    required this.dateLabel,
    required this.filledHearts,
    required this.level,
    required this.currentXp,
    required this.xpToNextLevel,
  });

  final String petName;
  final String dateLabel;
  final int filledHearts;
  final int level;
  final int currentXp;
  final int xpToNextLevel;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.primaryPink, width: 5),
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: AssetImage('assets/images/hud_background.png'),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.none,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          PetHudTopBar(dateLabel: dateLabel),
          const SizedBox(height: 16),
          Text(petName, style: textTheme.headlineSmall?.copyWith(color: palette.textPrimary)),
                    const SizedBox(height: 10),
          PetHeartsRow(filledHearts: filledHearts),
     

    SizedBox(
              height: 280,
              width: 240,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/pet_purple_default.png',
                    width: 220,
                    height: 225,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.none,
                  ),
                ],
              ),
            ),
          
          PetLevelBar(level: level, currentXp: currentXp, xpToNextLevel: xpToNextLevel),
        ],
      ),
    );
  }
}