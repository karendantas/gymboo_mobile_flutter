import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _VirtualPet;

  const VirtualPet._(); // necessário pra métodos derivados abaixo

  factory VirtualPet.fromJson(Map<String, dynamic> json) => _$VirtualPetFromJson(json);


  //talvez mudar isso depois pois life sera de 1 a 5;
  int get filledHearts => (life / 100 * 5).round().clamp(0, 5);

  int get xpProgress =>
    xpToNextLevel == 0 ? 0 : ((points / xpToNextLevel) * 100).round().clamp(0, 100);
}