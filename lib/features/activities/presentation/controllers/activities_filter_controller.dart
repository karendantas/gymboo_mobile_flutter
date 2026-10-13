import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/activities/domain/models/activities_filters.dart';
import 'package:gymboo_app/features/activities/domain/models/activity_category.dart';

class ActivitiesFilterNotifier extends Notifier<ActivitiesFilter> {
  @override
  ActivitiesFilter build() => const ActivitiesFilter();

  void setCategory(ActivityCategory? category) => state = ActivitiesFilter(
    category: category,
    from: state.from,
    to: state.to,
  );

  void setRange(DateTimeRange? range) => state = ActivitiesFilter(
    category: state.category,
    from: range?.start,
    to: range?.end,
  );

  void clear() => state = const ActivitiesFilter();
}

final activitiesFilterProvider =
    NotifierProvider<ActivitiesFilterNotifier, ActivitiesFilter>(
      ActivitiesFilterNotifier.new,
    );
