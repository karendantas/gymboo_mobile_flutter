// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Goal _$GoalFromJson(Map<String, dynamic> json) => _Goal(
  id: (json['id'] as num).toInt(),
  weeklyWorkoutTarget: (json['weeklyWorkoutTarget'] as num).toInt(),
);

Map<String, dynamic> _$GoalToJson(_Goal instance) => <String, dynamic>{
  'id': instance.id,
  'weeklyWorkoutTarget': instance.weeklyWorkoutTarget,
};
