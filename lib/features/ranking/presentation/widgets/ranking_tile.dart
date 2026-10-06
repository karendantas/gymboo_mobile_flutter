import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/ranking/domain/models/ranking_entry.dart';
import 'package:gymboo_app/features/ranking/presentation/widgets/pet_avatar.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/pet_title.dart';

class RankingTile extends StatelessWidget {
  const RankingTile({super.key, required this.entry});
  final RankingEntry entry;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: entry.currentUser
            ? palette.primaryPink.withValues(alpha: 0.15)
            : palette.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: entry.currentUser ? palette.primaryPinkDark : palette.divider,
          width: entry.currentUser ? 3 : 2,
        ),
        boxShadow: [
          BoxShadow(
            color: palette.divider,
            offset: const Offset(0, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 38,
            child: Text(
              '${entry.position}º',
              style: textTheme.labelMedium?.copyWith(
                color: palette.primaryPinkDark,
              ),
            ),
          ),
          PetAvatar(type: entry.petType, size: 40),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.petName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(
                    color: palette.textPrimary,
                  ),
                ),
                Text(
                  '${petTitleForLevel(entry.level)} · ${entry.currentUser ? 'Você' : entry.displayName}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                    color: palette.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Nv ${entry.level}',
                style: textTheme.labelMedium?.copyWith(
                  color: palette.primaryPinkDark,
                ),
              ),
              Text(
                '${entry.totalXp} xp',
                style: textTheme.labelSmall?.copyWith(
                  color: palette.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
