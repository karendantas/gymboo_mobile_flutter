import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';
import 'pet_hud_top_bar.dart';
import 'pet_hearts_row.dart';
import 'pet_level_bar.dart';

class PetHudScreen extends StatelessWidget {
  final VirtualPet pet;
    final String dateLabel;

  const PetHudScreen({
    super.key,
    required this.pet,
    required this.dateLabel
  });


  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    
    final petSprite = pet.spritePath;

    return Container(
      margin: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.backgroundDark, width: 7),
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

          Text(pet.name, style: textTheme.headlineSmall?.copyWith(color: palette.textPrimary)),
          
          const SizedBox(height: 10),

          PetHeartsRow(filledHearts: pet.filledHearts),
     

    SizedBox(
              height: 280,
              width: 240,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    petSprite,
                    width: 220,
                    height: 225,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.none,
                  ),
                ],
              ),
            ),
          PetLevelBar(level: pet.level, currentXp: pet.points, xpToNextLevel: pet.xpToNextLevel),
        ],
      ),
    );
  }
}