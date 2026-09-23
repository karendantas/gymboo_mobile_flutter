import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';

import '../../domain/models/pet_skill_display.dart';
import '../../domain/models/virtual_pet.dart';

class PetSkillCard extends StatelessWidget {
  const PetSkillCard({super.key, required this.skill});

  final PetSkill skill;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final color = skill.skill.skillColor(palette);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(skill.skill.skillIcon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill.skill.skillLabel,
                    style: textTheme.labelMedium?.copyWith(
                      color: palette.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Nível ${skill.level}',
                    style: textTheme.labelSmall?.copyWith(
                      color: palette.primaryPink,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Container(
                    height: 15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: palette.surface,
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(
                        color: AlwaysStoppedAnimation(color).value,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: skill.progress.clamp(0.0, 1.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AlwaysStoppedAnimation(color).value,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${skill.xpIntoCurrentLevel}/${skill.xpToNextLevel} xp',
              style: textTheme.labelSmall?.copyWith(
                color: palette.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
