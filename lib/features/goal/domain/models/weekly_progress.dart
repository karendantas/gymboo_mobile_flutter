import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_progress.freezed.dart';
part 'weekly_progress.g.dart';

enum Weekday { seg, ter, qua, qui, sex, sab, dom }

@freezed
abstract class WeeklyProgress with _$WeeklyProgress {
  const factory WeeklyProgress({
    required Map<Weekday, bool> completedByDay,
  }) = _WeeklyProgress;

  const WeeklyProgress._();

  factory WeeklyProgress.fromJson(Map<String, dynamic> json) => _$WeeklyProgressFromJson(json);

  int get completedCount => completedByDay.values.where((v) => v).length;
}