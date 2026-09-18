import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward.freezed.dart';
part 'reward.g.dart';

@freezed
abstract class Reward with _$Reward {
  const factory Reward({
    required int id,
    required String code,
    required String name,
    required String slot,
    required String requiredSkill,
    required int requiredLevel,
    required bool unlocked,
    required bool equipped,
  }) = _Reward;

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);
}
