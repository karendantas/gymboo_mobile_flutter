import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/pet_title.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/widgets/dressed_pet_sprite.dart';

import 'pet_hearts_row.dart';
import 'pet_hud_top_bar.dart';
import 'pet_level_bar.dart';

class PetHudScreen extends StatelessWidget {
  final VirtualPet pet;

  const PetHudScreen({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.primaryPink, width: 7),
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
          const PetHudTopBar(),
          const SizedBox(height: 16),

          Text(
            pet.name,
            style: textTheme.headlineSmall?.copyWith(
              color: palette.textPrimary,
            ),
          ),
          Text(
            petTitleForLevel(pet.level),
            style: textTheme.labelSmall?.copyWith(color: palette.textSecondary),
          ),

          const SizedBox(height: 10),

          PetHeartsRow(filledHearts: pet.filledHearts),

          DressedPetSprite(pet: pet, size: 220),

          const SizedBox(height: 40),
          PetLevelBar(
            level: pet.level,
            currentXp: pet.xpIntoCurrentLevel,
            xpToNextLevel: pet.xpToNextLevel,
          ),
        ],
      ),
    );
  }
}
