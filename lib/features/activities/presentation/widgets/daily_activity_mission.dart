import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return Container(
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
      child: Expanded(
        child: Row(
          children: [
            Image.asset(
              'assets/images/star.png',
              width: 50,
              height: 54,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.none,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      : 'Complete sua atividade do dia!',
                  style: textTheme.labelSmall?.copyWith(color: isDoneTextColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
