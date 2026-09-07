import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/pet_mood.dart';
import 'pet_color_variant.dart';
import '../pet_sprite_resolver.dart';

part 'virtual_pet.freezed.dart';
part 'virtual_pet.g.dart';

@freezed
abstract class VirtualPet with _$VirtualPet {
    const factory VirtualPet({
    required String id,
    required String name,
    required int life,      
    required int level,
    required int points,   
    required int xpToNextLevel,
    required PetColorVariant colorVariant,
  }) = _VirtualPet;

  const VirtualPet._(); // necessário pra métodos derivados abaixo

  factory VirtualPet.fromJson(Map<String, dynamic> json) => _$VirtualPetFromJson(json);

  //talvez mudar isso depois pois life sera de 1 a 5;
  int get filledHearts => (life / 100 * 5).round().clamp(0, 5);
  int get xpProgress =>
    xpToNextLevel == 0 ? 0 : ((points / xpToNextLevel) * 100).round().clamp(0, 100);
  int get xpProgressPercent => (xpProgress * 100).round();

    PetMood get mood {
    if (life < 30) return PetMood.sad;
    if (life >= 70) return PetMood.happy;
    return PetMood.neutral;
  }

  String get spritePath => spritePathFor(colorVariant, mood);
}