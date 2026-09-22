// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PetSkill _$PetSkillFromJson(Map<String, dynamic> json) => _PetSkill(
  skill: json['skill'] as String,
  level: (json['level'] as num).toInt(),
  xp: (json['xp'] as num).toInt(),
  xpIntoCurrentLevel: (json['xpIntoCurrentLevel'] as num).toInt(),
  xpToNextLevel: (json['xpToNextLevel'] as num).toInt(),
  progress: (json['progress'] as num).toDouble(),
);

Map<String, dynamic> _$PetSkillToJson(_PetSkill instance) => <String, dynamic>{
  'skill': instance.skill,
  'level': instance.level,
  'xp': instance.xp,
  'xpIntoCurrentLevel': instance.xpIntoCurrentLevel,
  'xpToNextLevel': instance.xpToNextLevel,
  'progress': instance.progress,
};

_VirtualPet _$VirtualPetFromJson(Map<String, dynamic> json) => _VirtualPet(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  type: json['type'] as String,
  mood: json['mood'] as String,
  level: (json['level'] as num).toInt(),
  life: (json['life'] as num).toInt(),
  points: (json['points'] as num).toInt(),
  totalXp: (json['totalXp'] as num).toInt(),
  skills: (json['skills'] as List<dynamic>)
      .map((e) => PetSkill.fromJson(e as Map<String, dynamic>))
      .toList(),
  equippedItems: (json['equippedItems'] as List<dynamic>)
      .map((e) => Reward.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$VirtualPetToJson(_VirtualPet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'mood': instance.mood,
      'level': instance.level,
      'life': instance.life,
      'points': instance.points,
      'totalXp': instance.totalXp,
      'skills': instance.skills,
      'equippedItems': instance.equippedItems,
    };
