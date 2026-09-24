import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/pet_skill_display.dart';

import '../../domain/models/reward.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({
    super.key,
    required this.reward,
    required this.onTap,
    this.isLoading = false,
  });

  final Reward reward;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final skillColor = reward.requiredSkill.skillColor(palette);

    return GestureDetector(
      onTap: reward.unlocked && !isLoading ? onTap : null,
      child: Opacity(
        opacity: reward.unlocked ? 1.0 : 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: reward.equipped
                ? skillColor.withValues(alpha: 0.15)
                : palette.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: reward.equipped ? skillColor : palette.divider,
              width: reward.equipped ? 3 : 2,
            ),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: skillColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      reward.unlocked ? Icons.checkroom : Icons.lock,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  if (reward.equipped)
                    Positioned(
                      top: -4,
                      right: -4,
                      child: Container(
                        width: 18,
                        height: 18,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                reward.name,
                textAlign: TextAlign.center,
                style: textTheme.labelSmall?.copyWith(
                  color: palette.textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 2),
              Text(
                'Nível ${reward.requiredLevel} de ${reward.requiredSkill.skillLabel}',
                textAlign: TextAlign.center,
                style: textTheme.bodySmall?.copyWith(
                  color: palette.textSecondary,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
