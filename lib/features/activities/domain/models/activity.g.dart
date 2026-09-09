// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Activity _$ActivityFromJson(Map<String, dynamic> json) => _Activity(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String?,
  category: $enumDecode(_$ActivityCategoryEnumMap, json['category']),
  affectedSkill: json['affectedSkill'] as String?,
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  activityDate: json['activityDate'] as String,
  activityTime: json['activityTime'] as String?,
  pointsEarned: (json['pointsEarned'] as num).toInt(),
);

Map<String, dynamic> _$ActivityToJson(_Activity instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'category': _$ActivityCategoryEnumMap[instance.category]!,
  'affectedSkill': instance.affectedSkill,
  'durationMinutes': instance.durationMinutes,
  'activityDate': instance.activityDate,
  'activityTime': instance.activityTime,
  'pointsEarned': instance.pointsEarned,
};

const _$ActivityCategoryEnumMap = {
  ActivityCategory.CARDIO: 'CARDIO',
  ActivityCategory.MUSCULACAO: 'MUSCULACAO',
  ActivityCategory.FLEXIBILIDADE: 'FLEXIBILIDADE',
  ActivityCategory.OUTRO: 'OUTRO',
};
