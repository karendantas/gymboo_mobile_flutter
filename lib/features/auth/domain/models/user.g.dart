// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  username: json['username'] as String?,
  provider: $enumDecode(_$AuthProviderEnumMap, json['provider']),
  age: (json['age'] as num?)?.toInt(),
  heightCm: (json['heightCm'] as num?)?.toInt(),
  weightKg: (json['weightKg'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'username': instance.username,
  'provider': _$AuthProviderEnumMap[instance.provider]!,
  'age': instance.age,
  'heightCm': instance.heightCm,
  'weightKg': instance.weightKg,
};

const _$AuthProviderEnumMap = {
  AuthProvider.LOCAL: 'LOCAL',
  AuthProvider.GOOGLE: 'GOOGLE',
};
