// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeeklyProgress _$WeeklyProgressFromJson(Map<String, dynamic> json) =>
    _WeeklyProgress(
      completedByDay: (json['completedByDay'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$WeekdayEnumMap, k), e as bool),
      ),
    );

Map<String, dynamic> _$WeeklyProgressToJson(_WeeklyProgress instance) =>
    <String, dynamic>{
      'completedByDay': instance.completedByDay.map(
        (k, e) => MapEntry(_$WeekdayEnumMap[k]!, e),
      ),
    };

const _$WeekdayEnumMap = {
  Weekday.seg: 'seg',
  Weekday.ter: 'ter',
  Weekday.qua: 'qua',
  Weekday.qui: 'qui',
  Weekday.sex: 'sex',
  Weekday.sab: 'sab',
  Weekday.dom: 'dom',
};
