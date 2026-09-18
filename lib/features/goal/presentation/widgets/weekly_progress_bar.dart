import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/goal/domain/models/weekly_progress.dart';

class WeeklyProgressBar extends StatelessWidget {
  const WeeklyProgressBar({
    super.key,
    required this.progress,
    this.height = 16,
    this.starSize = 50,
  });

  final WeeklyProgress progress;

  final double height;
  final double starSize;

  @override
  Widget build(BuildContext context) {
    final value = progress.completionRate;
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final clampedValue = value.clamp(0.0, 1.0);

    return LayoutBuilder(
      builder: (context, constraints) {
        final barWidth = constraints.maxWidth;
        final fillWidth = barWidth * clampedValue;

        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: palette.backgroundOuter,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: palette.primaryPink, width: 2),
              ),
              padding: const EdgeInsets.all(2),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: clampedValue,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: palette.primaryPink,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),

            Positioned(
              left: (fillWidth - starSize / 2).clamp(0.0, barWidth - starSize),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.loose,
                children: [
                  Image.asset(
                    'assets/images/star.png',
                    filterQuality: FilterQuality.none,
                    fit: BoxFit.contain,
                    width: starSize,
                    height: starSize,
                  ),
                  Text(
                    '${progress.completedDays.length}/${progress.days.length}',
                    style: textTheme.labelSmall?.copyWith(
                      fontSize: 7,
                      letterSpacing: -1,
                      color: palette.goldAccentDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
