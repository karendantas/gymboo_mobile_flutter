import 'package:freezed_annotation/freezed_annotation.dart';
import 'weekday.dart';
import 'weekly_day_detail.dart';

part 'weekly_progress.freezed.dart';
part 'weekly_progress.g.dart';

@freezed
abstract class WeeklyProgress with _$WeeklyProgress {
  const factory WeeklyProgress({
    required String weekStart,
    required String weekEnd,
    required List<Weekday> plannedDays,
    required List<Weekday> completedDays,
    required int plannedDaysTotal,
    required int plannedDaysCompleted,
    required int totalActivities,
    required int totalMinutes,
    required double completionRate,
    required List<WeeklyDayDetail> days,
  }) = _WeeklyProgress;

  factory WeeklyProgress.fromJson(Map<String, dynamic> json) =>
      _$WeeklyProgressFromJson(json);
}
