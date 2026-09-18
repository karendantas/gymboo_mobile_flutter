import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/virtual_pet/data/pet_repository.dart';
import 'package:gymboo_app/features/virtual_pet/data/reward_repository.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/reward.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';

typedef WardrobeData = ({VirtualPet pet, List<Reward> rewards});

final wardrobeDataProvider = FutureProvider<WardrobeData>((ref) async {
  final results = await (
    ref.watch(petRepositoryProvider).getMyPet(),
    ref.watch(rewardRepositoryProvider).catalog(),
  ).wait;

  return (pet: results.$1, rewards: results.$2);
});
