// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_day_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeeklyDayDetail _$WeeklyDayDetailFromJson(Map<String, dynamic> json) =>
    _WeeklyDayDetail(
      date: json['date'] as String,
      dayOfWeek: $enumDecode(_$WeekdayEnumMap, json['dayOfWeek']),
      planned: json['planned'] as bool,
      completed: json['completed'] as bool,
      activityCount: (json['activityCount'] as num).toInt(),
      minutes: (json['minutes'] as num).toInt(),
    );

Map<String, dynamic> _$WeeklyDayDetailToJson(_WeeklyDayDetail instance) =>
    <String, dynamic>{
      'date': instance.date,
      'dayOfWeek': _$WeekdayEnumMap[instance.dayOfWeek]!,
      'planned': instance.planned,
      'completed': instance.completed,
      'activityCount': instance.activityCount,
      'minutes': instance.minutes,
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
