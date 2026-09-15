import 'package:freezed_annotation/freezed_annotation.dart';

part 'virtual_pet.freezed.dart';
part 'virtual_pet.g.dart';

@freezed
abstract class PetSkill with _$PetSkill {
  const factory PetSkill({
    required String skill,
    required int level,
    required int xp,
    required int xpIntoCurrentLevel,
    required int xpToNextLevel,
    required double progress,
  }) = _PetSkill;

  factory PetSkill.fromJson(Map<String, dynamic> json) =>
      _$PetSkillFromJson(json);
}

@freezed
abstract class VirtualPet with _$VirtualPet {
  const factory VirtualPet({
    required int id,
    required String name,
    required String type,
    required int level,
    required int life,
    required int points,
    required int totalXp,
    required List<PetSkill> skills,
  }) = _VirtualPet;

  const VirtualPet._();

  factory VirtualPet.fromJson(Map<String, dynamic> json) =>
      _$VirtualPetFromJson(json);

  static const int xpPerLevel = 3000;

  int get xpIntoCurrentLevel => totalXp % xpPerLevel;
  int get xpToNextLevel => xpPerLevel;
  double get levelProgress => xpIntoCurrentLevel / xpPerLevel;

  int get filledHearts => (life / 100 * 5).round().clamp(0, 5);
}
