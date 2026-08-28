// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VirtualPet _$VirtualPetFromJson(Map<String, dynamic> json) => _VirtualPet(
  id: json['id'] as String,
  name: json['name'] as String,
  life: (json['life'] as num).toInt(),
  level: (json['level'] as num).toInt(),
  points: (json['points'] as num).toInt(),
  xpToNextLevel: (json['xpToNextLevel'] as num).toInt(),
);

Map<String, dynamic> _$VirtualPetToJson(_VirtualPet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'life': instance.life,
      'level': instance.level,
      'points': instance.points,
      'xpToNextLevel': instance.xpToNextLevel,
    };
