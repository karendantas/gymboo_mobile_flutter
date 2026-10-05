import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/home/presentation/controllers/home_controller.dart';
import 'package:gymboo_app/features/virtual_pet/data/pet_repository.dart';
import 'package:gymboo_app/features/virtual_pet/data/reward_repository.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/reward.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';

import 'pet_controller.dart';

typedef WardrobeData = ({VirtualPet pet, List<Reward> rewards});

class WardrobeController extends AsyncNotifier<WardrobeData> {
  @override
  Future<WardrobeData> build() async {
    final results = await (
      ref.watch(petRepositoryProvider).getMyPet(),
      ref.watch(rewardRepositoryProvider).catalog(),
    ).wait;
    return (pet: results.$1, rewards: results.$2);
  }

  Future<bool> equip(String code) async {
    final current = state.value;
    if (current == null) return false;

    final previousData = current;
    final tappedItem = current.rewards.firstWhere((r) => r.code == code);

    final optimisticRewards = current.rewards.map((r) {
      if (r.code == code) return r.copyWith(equipped: true);
      if (r.slot == tappedItem.slot) return r.copyWith(equipped: false);
      return r;
    }).toList();

    final optimisticPet = _applyEquippedToPet(current.pet, optimisticRewards);

    state = AsyncData((pet: optimisticPet, rewards: optimisticRewards));

    try {
      await ref.read(rewardRepositoryProvider).equip(code);
      _invalidateDependents();
      return true;
    } catch (_) {
      state = AsyncData(previousData);
      return false;
    }
  }

  Future<bool> unequip(String code) async {
    final current = state.value;
    if (current == null) return false;

    final previousData = current;
    final optimisticRewards = current.rewards
        .map((r) => r.code == code ? r.copyWith(equipped: false) : r)
        .toList();

    final optimisticPet = _applyEquippedToPet(current.pet, optimisticRewards);

    state = AsyncData((pet: optimisticPet, rewards: optimisticRewards));

    try {
      await ref.read(rewardRepositoryProvider).unequip(code);
      _invalidateDependents();
      return true;
    } catch (_) {
      state = AsyncData(previousData);
      return false;
    }
  }

  VirtualPet _applyEquippedToPet(VirtualPet pet, List<Reward> rewards) {
    final equippedNow = rewards.where((r) => r.equipped).toList();
    return pet.copyWith(equippedItems: equippedNow);
  }

  void _invalidateDependents() {
    ref.invalidate(petControllerProvider);
    ref.invalidate(homeDataProvider);
  }
}

final wardrobeControllerProvider =
    AsyncNotifierProvider<WardrobeController, WardrobeData>(
      WardrobeController.new,
    );
