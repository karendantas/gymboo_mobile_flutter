// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeeklyProgress _$WeeklyProgressFromJson(Map<String, dynamic> json) =>
    _WeeklyProgress(
      weekStart: json['weekStart'] as String,
      weekEnd: json['weekEnd'] as String,
      plannedDays: (json['plannedDays'] as List<dynamic>)
          .map((e) => $enumDecode(_$WeekdayEnumMap, e))
          .toList(),
      completedDays: (json['completedDays'] as List<dynamic>)
          .map((e) => $enumDecode(_$WeekdayEnumMap, e))
          .toList(),
      plannedDaysTotal: (json['plannedDaysTotal'] as num).toInt(),
      plannedDaysCompleted: (json['plannedDaysCompleted'] as num).toInt(),
      totalActivities: (json['totalActivities'] as num).toInt(),
      totalMinutes: (json['totalMinutes'] as num).toInt(),
      completionRate: (json['completionRate'] as num).toDouble(),
      days: (json['days'] as List<dynamic>)
          .map((e) => WeeklyDayDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeeklyProgressToJson(
  _WeeklyProgress instance,
) => <String, dynamic>{
  'weekStart': instance.weekStart,
  'weekEnd': instance.weekEnd,
  'plannedDays': instance.plannedDays.map((e) => _$WeekdayEnumMap[e]!).toList(),
  'completedDays': instance.completedDays
      .map((e) => _$WeekdayEnumMap[e]!)
      .toList(),
  'plannedDaysTotal': instance.plannedDaysTotal,
  'plannedDaysCompleted': instance.plannedDaysCompleted,
  'totalActivities': instance.totalActivities,
  'totalMinutes': instance.totalMinutes,
  'completionRate': instance.completionRate,
  'days': instance.days,
};

const _$WeekdayEnumMap = {
  Weekday.MONDAY: 'MONDAY',
  Weekday.TUESDAY: 'TUESDAY',
  Weekday.WEDNESDAY: 'WEDNESDAY',
  Weekday.THURSDAY: 'THURSDAY',
  Weekday.FRIDAY: 'FRIDAY',
  Weekday.SATURDAY: 'SATURDAY',
  Weekday.SUNDAY: 'SUNDAY',
};
