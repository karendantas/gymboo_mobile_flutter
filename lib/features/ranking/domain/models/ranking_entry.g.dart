// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RankingEntry _$RankingEntryFromJson(Map<String, dynamic> json) =>
    _RankingEntry(
      position: (json['position'] as num).toInt(),
      displayName: json['displayName'] as String,
      petName: json['petName'] as String,
      petType: json['petType'] as String,
      level: (json['level'] as num).toInt(),
      totalXp: (json['totalXp'] as num).toInt(),
      currentUser: json['currentUser'] as bool,
    );

Map<String, dynamic> _$RankingEntryToJson(_RankingEntry instance) =>
    <String, dynamic>{
      'position': instance.position,
      'displayName': instance.displayName,
      'petName': instance.petName,
      'petType': instance.petType,
      'level': instance.level,
      'totalXp': instance.totalXp,
      'currentUser': instance.currentUser,
    };
