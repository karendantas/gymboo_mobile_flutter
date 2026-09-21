// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PetLog _$PetLogFromJson(Map<String, dynamic> json) => _PetLog(
  id: (json['id'] as num).toInt(),
  action: json['action'] as String,
  attribute: json['attribute'] as String,
  oldValue: (json['oldValue'] as num?)?.toInt(),
  newValue: (json['newValue'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$PetLogToJson(_PetLog instance) => <String, dynamic>{
  'id': instance.id,
  'action': instance.action,
  'attribute': instance.attribute,
  'oldValue': instance.oldValue,
  'newValue': instance.newValue,
  'createdAt': instance.createdAt,
};
