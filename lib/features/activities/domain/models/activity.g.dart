// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Activity _$ActivityFromJson(Map<String, dynamic> json) => _Activity(
  id: json['id'] as String,
  title: json['title'] as String,
  date: DateTime.parse(json['date'] as String),
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  points: (json['points'] as num).toInt(),
  description: json['description'] as String?,
  type: ActivityType.fromJson(json['type'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityToJson(_Activity instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'date': instance.date.toIso8601String(),
  'durationMinutes': instance.durationMinutes,
  'points': instance.points,
  'description': instance.description,
  'type': instance.type,
};
