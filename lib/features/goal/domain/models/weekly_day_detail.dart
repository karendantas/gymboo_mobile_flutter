import 'package:freezed_annotation/freezed_annotation.dart';
import 'weekday.dart';

part 'weekly_day_detail.freezed.dart';
part 'weekly_day_detail.g.dart';

@freezed
abstract class WeeklyDayDetail with _$WeeklyDayDetail {
  const factory WeeklyDayDetail({
    required String date,
    required Weekday dayOfWeek,
    required bool planned,
    required bool completed,
    required int activityCount,
    required int minutes,
  }) = _WeeklyDayDetail;

  factory WeeklyDayDetail.fromJson(Map<String, dynamic> json) =>
      _$WeeklyDayDetailFromJson(json);
}
