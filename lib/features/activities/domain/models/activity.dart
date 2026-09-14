import 'package:freezed_annotation/freezed_annotation.dart';
import 'activity_category.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
abstract class Activity with _$Activity {
  const factory Activity({
    required int id,
    required String title,
    String? description,
    required ActivityCategory category,
    String? affectedSkill,
    required int durationMinutes,
    required String activityDate,
    String? activityTime,
    required int pointsEarned,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
