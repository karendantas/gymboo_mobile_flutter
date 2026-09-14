import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/core/util/category_activity_color.dart';
import '../../domain/models/activity.dart';
import '../../domain/models/activity_category_display.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.activity,
    required this.onTap,
    required this.onDelete,
  });

  final Activity activity;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: palette.backgroundOuter,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: palette.backgroundDark, width: 4),
          boxShadow: [
            BoxShadow(
              color: palette.backgroundDark,
              offset: const Offset(0, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: palette.backgroundDark,
                borderRadius: BorderRadius.circular(8),
              ),
              child: activity.category.icon,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        activity.title,
                        style: textTheme.labelLarge?.copyWith(
                          color: palette.textSecondary,
                        ),
                      ),
                      Text(
                        '+${activity.pointsEarned} pts',
                        style: textTheme.labelMedium?.copyWith(
                          color: palette.goldAccentDark,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Row(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer_sharp,
                        size: 14,
                        color: palette.textSecondary,
                      ),
                      Text(
                        '${activity.durationMinutes} min',
                        style: textTheme.labelSmall?.copyWith(
                          color: palette.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: 160,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: getActivityCategoryColor(
                        activity.category,
                        palette,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      activity.category.label,
                      style: textTheme.labelSmall?.copyWith(
                        color: palette.textOnDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: onDelete,
                  child: Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: palette.coral,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
