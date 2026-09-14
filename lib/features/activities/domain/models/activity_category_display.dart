import 'package:flutter/material.dart';
import 'package:gymboo_app/features/activities/domain/models/activity_category.dart';

extension ActivityCategoryDisplay on ActivityCategory {
  String get label => switch (this) {
    ActivityCategory.CARDIO => 'Cardio',
    ActivityCategory.MUSCULACAO => 'Musculação',
    ActivityCategory.FLEXIBILIDADE => 'Flexibilidade',
    ActivityCategory.OUTRO => 'Outro',
  };

  Image get icon => switch (this) {
    ActivityCategory.CARDIO => Image.asset(
      'assets/images/cardio_icon.png',
      width: 32,
      height: 40,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.none,
    ),
    ActivityCategory.MUSCULACAO => Image.asset(
      'assets/images/musculacao_icon.png',
      width: 32,
      height: 32,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.none,
    ),
    ActivityCategory.FLEXIBILIDADE => Image.asset(
      'assets/images/outro_icon.png',
      width: 32,
      height: 40,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.none,
    ),
    ActivityCategory.OUTRO => Image.asset(
      'assets/images/outro_icon.png',
      width: 32,
      height: 40,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.none,
    ),
  };
}
