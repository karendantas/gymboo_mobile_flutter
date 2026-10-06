import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/ranking/domain/models/ranking_entry.dart';
import 'package:gymboo_app/features/ranking/presentation/widgets/pet_avatar.dart';

class Podium extends StatelessWidget {
  const Podium({super.key, required this.entries});
  final List<RankingEntry> entries;

  @override
  Widget build(BuildContext context) {
    RankingEntry? at(int i) => i < entries.length ? entries[i] : null;

    // ordem visual: 2, 1, 3
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: _PodiumSpot(entry: at(1), blockHeight: 68, petSize: 56),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _PodiumSpot(entry: at(0), blockHeight: 92, petSize: 72),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _PodiumSpot(entry: at(2), blockHeight: 54, petSize: 56),
        ),
      ],
    );
  }
}

class _PodiumSpot extends StatelessWidget {
  const _PodiumSpot({
    required this.entry,
    required this.blockHeight,
    required this.petSize,
  });

  final RankingEntry? entry;
  final double blockHeight;
  final double petSize;

  Color _medalColor(GymbooPalette palette, int position) => switch (position) {
    1 => palette.goldAccent,
    2 => const Color.fromARGB(255, 200, 184, 194),
    _ => const Color.fromARGB(255, 205, 122, 94),
  };

  Color _medalBorderColor(GymbooPalette palette, int position) =>
      switch (position) {
        1 => palette.goldAccentDark,
        2 => const Color.fromARGB(255, 124, 113, 120),
        _ => const Color.fromARGB(255, 102, 61, 47),
      };

  @override
  Widget build(BuildContext context) {
    final e = entry;
    if (e == null) return const SizedBox.shrink();

    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (e.position == 1)
          Image.asset(
            'assets/images/trophy.png',
            fit: BoxFit.contain,
            filterQuality: FilterQuality.none,
          ),

        PetAvatar(type: e.petType, size: petSize),
        const SizedBox(height: 4),
        Text(
          e.petName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme.labelMedium?.copyWith(color: palette.textPrimary),
        ),
        Text(
          e.currentUser ? 'Você' : e.displayName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme.labelSmall?.copyWith(
            color: e.currentUser
                ? palette.primaryPinkDark
                : palette.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: blockHeight,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _medalColor(palette, e.position),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            border: Border.all(
              color: e.currentUser
                  ? palette.primaryPinkDark
                  : _medalBorderColor(palette, e.position),
              width: e.currentUser ? 3 : 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${e.position}º',
                style: textTheme.headlineSmall?.copyWith(color: Colors.white),
              ),
              Text(
                'Nv ${e.level}',
                style: textTheme.labelSmall?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
