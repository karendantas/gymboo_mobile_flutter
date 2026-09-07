import 'models/pet_color_variant.dart';
import 'models/pet_mood.dart';

String spritePathFor(PetColorVariant color, PetMood mood) {
  final moodSuffix = mood == PetMood.neutral ? '' : '_${mood.name}';
  return 'assets/images/pet_${color.name}$moodSuffix.png';
}