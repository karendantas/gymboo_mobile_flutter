// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reward _$RewardFromJson(Map<String, dynamic> json) => _Reward(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
  slot: json['slot'] as String,
  requiredSkill: json['requiredSkill'] as String,
  requiredLevel: (json['requiredLevel'] as num).toInt(),
  unlocked: json['unlocked'] as bool,
  equipped: json['equipped'] as bool,
);

Map<String, dynamic> _$RewardToJson(_Reward instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'slot': instance.slot,
  'requiredSkill': instance.requiredSkill,
  'requiredLevel': instance.requiredLevel,
  'unlocked': instance.unlocked,
  'equipped': instance.equipped,
};
