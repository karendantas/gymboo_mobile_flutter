import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/activities/presentation/controllers/daily_mission_controller.dart';

class DailyActivityMission extends ConsumerWidget {
  const DailyActivityMission({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final isDoneAsync = ref.watch(dailyActivityIsDoneProvider);

    final isDone = isDoneAsync.value ?? false;
    final isDoneColor = isDone ? theme.primaryPinkDark : theme.backgroundDark;
    final isDoneTextColor = isDone ? theme.input : theme.primaryPink;
    return GestureDetector(
      onTap: () => context.go('/activities/new'),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8),

        decoration: BoxDecoration(
          color: isDone ? theme.primaryPink : theme.card,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isDoneColor, width: 3),
          boxShadow: [
            BoxShadow(
              color: isDoneColor,
              offset: const Offset(0, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/star.png',
              width: 50,
              height: 54,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.none,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'MISSÃO DIÁRIA',
                    style: textTheme.labelMedium?.copyWith(
                      color: isDoneTextColor,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    isDone
                        ? 'Missão concluída hoje!'
                        : 'Fazer a atividade diária!',
                    style: textTheme.labelSmall?.copyWith(
                      color: isDoneTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
