import 'package:flutter/material.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/activities/domain/models/activity_category.dart';

Color getActivityCategoryColor(
  ActivityCategory category,
  GymbooPalette palette,
) {
  switch (category) {
    case ActivityCategory.CARDIO:
      return palette.blueAccent;
    case ActivityCategory.MUSCULACAO:
      return palette.primaryPink;
    case ActivityCategory.FLEXIBILIDADE:
      return palette.goldAccent;
    case ActivityCategory.OUTRO:
      return palette.cream;
  }
}
