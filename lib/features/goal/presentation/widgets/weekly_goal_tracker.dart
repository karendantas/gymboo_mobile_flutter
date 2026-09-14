import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/goal/domain/models/weekday.dart';
import 'package:gymboo_app/features/goal/domain/models/weekly_progress.dart';
import 'package:gymboo_app/features/goal/presentation/widgets/check_box.dart';
import 'package:gymboo_app/features/goal/presentation/widgets/weekly_progress_bar.dart';

class WeeklyGoalTracker extends StatelessWidget {
  const WeeklyGoalTracker({super.key, required this.progress});
  final WeeklyProgress progress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.backgroundOuter,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.backgroundDark, width: 4),
        boxShadow: [
          BoxShadow(
            color: theme.backgroundDark,
            offset: const Offset(0, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: progress.days.map((day) {
              return Column(
                children: [
                  Text(
                    day.dayOfWeek.shortLabel,
                    style: textTheme.labelSmall?.copyWith(
                      color: day.planned
                          ? theme.primaryPinkDark
                          : theme.textSecondary,
                      fontWeight: day.planned
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 4),
                  CheckBox(isCompleted: day.completed),
                ],
              );
            }).toList(),
          ),

          const SizedBox(height: 10),
          WeeklyProgressBar(value: progress.completionRate),
        ],
      ),
    );
  }
}
