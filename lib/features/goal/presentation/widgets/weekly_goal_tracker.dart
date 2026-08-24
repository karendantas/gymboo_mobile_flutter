import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/goal/domain/models/goal.dart';
import 'package:gymboo_app/features/goal/domain/models/weekly_progress.dart';
import 'package:gymboo_app/features/goal/presentation/widgets/check_box.dart';
import 'package:gymboo_app/features/goal/presentation/widgets/weekly_progress_bar.dart';

class WeeklyGoalTracker extends StatelessWidget {
  const WeeklyGoalTracker({super.key, required this.goal, required this.weeklyProgress});

  final Goal goal;
  final WeeklyProgress weeklyProgress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<GymbooPalette>()!;
  final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.backgroundOuter,
          borderRadius: BorderRadius.circular(8), 
        border: Border.all(color: theme.backgroundDark, width: 4),
        boxShadow: [BoxShadow(
             color: theme.backgroundDark,
                  offset: const Offset(0, 4),
                  blurRadius: 0,
        )]

        
      ),
      child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Progresso semanal',
              style: textTheme.labelMedium?.copyWith(color: theme.primaryPink),
            ),
            const SizedBox(height: 3,),
            Row(
            
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ...Weekday.values.map(
                  (day) => Column(
                    children: [
                      Text(day.name),
                      CheckBox(isCompleted: weeklyProgress.completedByDay[day] ?? false),
                    ],
                  )

                )

            ],),

            const SizedBox(height: 10,),

            WeeklyProgressBar(value: weeklyProgress.completedCount / 7)
          ],


        )
      
    );
  }
}