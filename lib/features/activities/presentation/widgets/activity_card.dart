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
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: palette.card,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: palette.backgroundDark, width: 3),
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
              width: 50,
              height: 50,

              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: palette.backgroundDark,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activity.title,
                            style: textTheme.labelLarge?.copyWith(
                              color: palette.primaryPink,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Row(
                            spacing: 6,
                            children: [
                              Icon(
                                Icons.timer_sharp,
                                size: 16,
                                color: palette.primaryPink,
                              ),
                              Text(
                                '${activity.durationMinutes} min',
                                style: textTheme.labelSmall?.copyWith(
                                  color: palette.primaryPinkDark,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

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

                  const SizedBox(height: 12),
                  Row(
                    spacing: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        activity.category.label.toUpperCase(),
                        style: textTheme.labelSmall?.copyWith(
                          color: getActivityCategoryColor(
                            activity.category,
                            palette,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: palette.goldAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '+${activity.pointsEarned} pts',
                          style: textTheme.labelSmall?.copyWith(
                            color: palette.goldAccentDark,
                          ),
                        ),
                      ),
                    ],
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
